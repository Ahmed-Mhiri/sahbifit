-- Enables UUID generation functions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- Enables robust geospatial data types and queries (for gyms)
CREATE EXTENSION IF NOT EXISTS "postgis";

-- ---------------------------------
-- | ENUM Types for State Management |
-- ---------------------------------
-- Using ENUMs is more efficient and provides better data integrity than VARCHAR.

CREATE TYPE user_role AS ENUM (
    'member',
    'ambassador',   -- For the "Founders' Circle"
    'admin'
);

CREATE TYPE user_status AS ENUM (
    'active',
    'suspended',    -- For "3-day suspension"
    'banned'
);

CREATE TYPE verification_status AS ENUM (
    'not_started',      -- User has not triggered the check
    'pending_review',   -- User is in "Probationary Mode"
    'verified',
    'rejected_bad_video',
    'rejected_mismatch'
);

CREATE TYPE verified_gender AS ENUM (
    'not_verified',
    'male',
    'female',
    'other' -- Added for completeness, though the doc focuses on male/female
);

CREATE TYPE session_type AS ENUM (
    'group',
    'one_on_one'
);

CREATE TYPE session_status AS ENUM (
    'active',       -- Session is upcoming
    'cancelled',
    'completed'     -- Session has finished
);

CREATE TYPE participant_status AS ENUM (
    'joined',       -- User is registered for the session
    'attended',     -- User successfully attended (for reputation)
    'no_show',      -- User missed the session (for accountability)
    'left'          -- User left the session before it started
);

CREATE TYPE tag_type AS ENUM (
    'goal',         -- e.g., 'weight_loss', 'muscle_gain'
    'schedule'      -- e.g., 'mornings', 'weekends'
);

CREATE TYPE report_priority AS ENUM (
    'low',          -- "All Other Reports"
    'high',         -- "9 AM problem" (New User, Critical Report)
    'critical'      -- "3 AM problem" (Trusted User, Critical Report)
);

CREATE TYPE report_status AS ENUM (
    'pending',
    'resolved',
    'dismissed'
);

CREATE TYPE gym_status AS ENUM (
    'pending',      -- For user-submitted gyms
    'approved',
    'rejected'
);

-- -----------------------------
-- | Core Tables               |
-- -----------------------------

-- Table: users
-- The central table for all users.
-- THIS MUST BE CREATED BEFORE 'gyms' and 'sessions'.
CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    phone_number VARCHAR(20) NOT NULL UNIQUE,
    
    -- NEU HINZUGEFÜGT ENTSPRECHEND DER ENTITÄT
    password_hash TEXT NOT NULL,
    is_phone_verified BOOLEAN NOT NULL DEFAULT false,
    
    -- NEUE FELDER FÜR SMS OTP (basierend auf der Entität)
    sms_otp VARCHAR(6),
    sms_otp_expires_at TIMESTAMPTZ,
    
    first_name VARCHAR(100) NOT NULL,
    -- Store date_of_birth to calculate age dynamically. This is better practice.
    date_of_birth DATE NOT NULL,
    
    -- Verification fields (Core Trust & Safety)
    profile_photo_url TEXT,
    verification_video_url TEXT, -- URL to the 5-sec video on Cloudflare R2
    verification_status verification_status NOT NULL DEFAULT 'not_started',
    verified_gender verified_gender NOT NULL DEFAULT 'not_verified',
    
    -- Foreign Keys
    -- Note: primary_gym_id is moved here but references gyms(gym_id).
    -- We will add this constraint AFTER the gyms table is created.
    primary_gym_id UUID, 
    
    -- Role and Status (Accountability)
    role user_role NOT NULL DEFAULT 'member',
    status user_status NOT NULL DEFAULT 'active',
    suspended_until TIMESTAMPTZ,

    -- Denormalized counters for performance (Reputation & Accountability)
    -- These will NOW be updated by the application layer.
    group_session_count INT NOT NULL DEFAULT 0, -- For "Reputation-Gated 1-on-1s"
    no_show_count INT NOT NULL DEFAULT 0,       -- For "Unreliable" badge
    
    -- Technical fields
    push_notification_token TEXT, -- For "magic moment" and other notifications
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
-- Table: gyms
-- Stores all gym locations, including user-submitted ones.
CREATE TABLE gyms (
    gym_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    address TEXT,
    -- Using PostGIS 'geography' for accurate lat/long distance calculations
    location geography(Point, 4326),
    status gym_status NOT NULL DEFAULT 'pending',
    
    -- This foreign key will now work because the 'users' table exists.
    submitted_by_user_id UUID REFERENCES users(user_id) ON DELETE SET NULL,
    
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Now we can safely add the foreign key from users -> gyms
ALTER TABLE users
ADD CONSTRAINT fk_users_primary_gym
FOREIGN KEY (primary_gym_id) 
REFERENCES gyms(gym_id) 
ON DELETE SET NULL;


-- Table: sessions
-- The core "product": workouts created by users.
CREATE TABLE sessions (
    session_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    creator_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    gym_id UUID NOT NULL REFERENCES gyms(gym_id) ON DELETE CASCADE,
    
    session_type session_type NOT NULL,
    status session_status NOT NULL DEFAULT 'active',
    title VARCHAR(255) NOT NULL,
    
    -- Timestamps for the session and "Ephemeral Chat" logic
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ NOT NULL,
    
    -- Max 1 for 1-on-1, 3+ for group.
    -- We set a CHECK constraint to enforce group logic.
    max_participants INT NOT NULL DEFAULT 3,
    
    -- Pointer to the external chat room
    firestore_chat_id VARCHAR(100), -- ID for the Firebase Firestore chat document
    
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    -- Enforce 'Groups First' logic
    CONSTRAINT check_max_participants
        CHECK ( (session_type = 'one_on_one' AND max_participants = 2) OR 
                (session_type = 'group' AND max_participants >= 3) )
);

-- ---------------------------------
-- | Relationship Tables (Many-to-Many) |
-- ---------------------------------

-- Table: session_participants
-- Junction table linking users to sessions they've joined.
CREATE TABLE session_participants (
    session_id UUID NOT NULL REFERENCES sessions(session_id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    status participant_status NOT NULL DEFAULT 'joined',
    joined_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    -- A user can only be in a session once
    PRIMARY KEY (session_id, user_id)
);

-- Table: tags
-- Stores the master list of "Profile Tags" (Goals & Schedules).
CREATE TABLE tags (
    tag_id SERIAL PRIMARY KEY,
    tag_name VARCHAR(100) NOT NULL UNIQUE,
    tag_type tag_type NOT NULL
);

-- Table: user_tags
-- Junction table linking users to their selected tags.
CREATE TABLE user_tags (
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    tag_id INT NOT NULL REFERENCES tags(tag_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, tag_id)
);

-- ---------------------------------
-- | Accountability & Safety Tables |
-- ---------------------------------

-- Table: ratings
-- For the "Buddy Rating System" post-session.
CREATE TABLE ratings (
    rating_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    session_id UUID NOT NULL REFERENCES sessions(session_id) ON DELETE CASCADE,
    
    -- The user giving the rating
    rating_by_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    -- The user receiving the rating
    rating_for_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    
    rating_value SMALLINT NOT NULL CHECK (rating_value BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    -- A user can only rate another user once per session
    UNIQUE (session_id, rating_by_user_id, rating_for_user_id),
    -- A user cannot rate themselves
    CONSTRAINT no_self_rating CHECK (rating_by_user_id != rating_for_user_id)
);

-- Table: reports
-- For the "Block & Report" feature and "Sleep-Safe" triage.
CREATE TABLE reports (
    report_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    reported_by_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    reported_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    
    -- A report can be session-specific but doesn't have to be
    session_id UUID REFERENCES sessions(session_id) ON DELETE SET NULL,
    
    reason TEXT NOT NULL,
    -- This will now be set by the application layer, not a trigger.
    priority report_priority NOT NULL DEFAULT 'low',
    status report_status NOT NULL DEFAULT 'pending',
    
    -- Admin notes for resolution
    resolution_notes TEXT,
    
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT no_self_reporting CHECK (reported_by_user_id != reported_user_id)
);

-- Table: user_blocks
-- Stores block relationships.
CREATE TABLE user_blocks (
    blocker_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    blocked_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    PRIMARY KEY (blocker_user_id, blocked_user_id),
    CONSTRAINT no_self_block CHECK (blocker_user_id != blocked_user_id)
);

-- -----------------------------
-- | Indexes for Performance   |
-- -----------------------------
-- Indexes are critical for a fast read-heavy application.

-- Index for the admin panel's verification queue
CREATE INDEX idx_users_verification_status ON users (verification_status) WHERE verification_status = 'pending_review';

-- Index for finding users by phone (login)
-- UNIQUE constraint already creates an index, but this is explicit
CREATE UNIQUE INDEX idx_users_phone_number ON users (phone_number);

-- Index for finding users at a specific gym
CREATE INDEX idx_users_primary_gym_id ON users (primary_gym_id);

-- Spatial index for finding gyms "near me" or in a certain area
CREATE INDEX idx_gyms_location ON gyms USING GIST (location);

-- Index for the admin panel's gym approval queue
CREATE INDEX idx_gyms_status ON gyms (status) WHERE status = 'pending';

-- Indexes for the main session feed (finding active sessions by time and gym)
CREATE INDEX idx_sessions_start_time ON sessions (start_time);
CREATE INDEX idx_sessions_gym_id ON sessions (gym_id);
CREATE INDEX idx_sessions_session_type ON sessions (session_type);

-- Indexes for finding a user's sessions and session history
CREATE INDEX idx_session_participants_user_id ON session_participants (user_id);
CREATE INDEX idx_session_participants_session_id ON session_participants (session_id);

-- Index for calculating a user's average rating
CREATE INDEX idx_ratings_rating_for_user_id ON ratings (rating_for_user_id);

-- Indexes for the admin panel's report triage dashboard
CREATE INDEX idx_reports_status_priority ON reports (status, priority);
CREATE INDEX idx_reports_reported_user_id ON reports (reported_user_id);

-- Index for finding users with specific tags
CREATE INDEX idx_user_tags_tag_id ON user_tags (tag_id);


-- -----------------------------
-- | Triggers & Functions      |
-- -----------------------------

-- Function to automatically update the 'updated_at' timestamp
-- This is a "good" trigger as it handles a simple, cross-cutting audit concern.
CREATE OR REPLACE FUNCTION fn_set_updated_at_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply the 'updated_at' trigger to all relevant tables
CREATE TRIGGER trg_set_gyms_updated_at
BEFORE UPDATE ON gyms
FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at_timestamp();

CREATE TRIGGER trg_set_users_updated_at
BEFORE UPDATE ON users
FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at_timestamp();

CREATE TRIGGER trg_set_sessions_updated_at
BEFORE UPDATE ON sessions
FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at_timestamp();

CREATE TRIGGER trg_set_reports_updated_at
BEFORE UPDATE ON reports
FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at_timestamp();


-- [REMOVED] Function fn_set_report_priority()
-- [REMOVED] Trigger trg_set_report_priority
-- This logic must now be handled in your Spring @Service layer.
-- (e.g., ReportService.createReport(ReportDTO reportDTO))


-- [REMOVED] Function fn_update_user_accountability()
-- [REMOVED] Trigger trg_update_user_accountability
-- This logic must now be handled in your Spring @Service layer.
-- (e.g., SessionService.updateParticipantStatus(UUID participantId, ParticipantStatus status))


-- -----------------------------
-- | Populate Initial Data     |
-- -----------------------------
-- Example: Populate the master list of tags

INSERT INTO tags (tag_name, tag_type)
VALUES
    ('weight_loss', 'goal'),
    ('muscle_gain', 'goal'),
    ('cardio', 'goal'),
    ('beginner', 'goal'),
    ('mornings', 'schedule'),
    ('evenings', 'schedule'),
    ('weekends', 'schedule'),
    ('flexible', 'schedule');

-- Example: Create a pre-approved "Founders' Circle" gym
INSERT INTO gyms (name, address, location, status)
VALUES
    ('Founders Gym 1', '123 Main St, Tunis', ST_SetSRID(ST_MakePoint(10.1815, 36.8065), 4326), 'approved');

-- Example: Create an "Ambassador" user
-- (In reality, you'd insert a user and then update their role/status)
INSERT INTO users (phone_number, first_name, date_of_birth, verification_status, verified_gender, primary_gym_id, role)
VALUES
    ('+21600000001', 'Founding_Lieutenant', '1990-01-01', 'verified', 'male', (SELECT gym_id FROM gyms WHERE name = 'Founders Gym 1'), 'ambassador');


COMMIT;