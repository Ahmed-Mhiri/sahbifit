-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "postgis";

-- ---------------------------------
-- | ENUM Types for State Management |
-- ---------------------------------

CREATE TYPE user_role AS ENUM (
    'member',
    'ambassador',
    'admin'
);

CREATE TYPE user_status AS ENUM (
    'active',
    'suspended',
    'banned'
);

CREATE TYPE verification_status AS ENUM (
    'not_started',
    'pending_review',
    'verified',
    'rejected_bad_video',
    'rejected_mismatch'
);

CREATE TYPE verified_gender AS ENUM (
    'not_verified',
    'male',
    'female',
    'other'
);

CREATE TYPE profile_visibility AS ENUM (
    'all',
    'same_gender'
);

CREATE TYPE session_type AS ENUM (
    'group',
    'one_on_one'
);

CREATE TYPE session_status AS ENUM (
    'active',
    'cancelled',
    'completed'
);

CREATE TYPE participant_status AS ENUM (
    'joined',
    'attended',
    'no_show',
    'left'
);

CREATE TYPE tag_type AS ENUM (
    'goal',
    'schedule'
);

CREATE TYPE report_priority AS ENUM (
    'low',
    'high',
    'critical'
);

CREATE TYPE report_status AS ENUM (
    'pending',
    'resolved',
    'dismissed'
);

CREATE TYPE gym_status AS ENUM (
    'pending',
    'approved',
    'rejected'
);

-- -----------------------------
-- | Core Tables               |
-- -----------------------------

CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    phone_number VARCHAR(20) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    is_phone_verified BOOLEAN NOT NULL DEFAULT false,
    sms_otp VARCHAR(6),
    sms_otp_expires_at TIMESTAMPTZ,
    first_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    profile_photo_url TEXT,
    verification_video_url TEXT,
    verification_status verification_status NOT NULL DEFAULT 'not_started',
    verified_gender verified_gender NOT NULL DEFAULT 'not_verified',
    profile_visibility profile_visibility NOT NULL DEFAULT 'all',
    primary_gym_id UUID, -- Foreign key added below after gyms table is created
    role user_role NOT NULL DEFAULT 'member',
    status user_status NOT NULL DEFAULT 'active',
    suspended_until TIMESTAMPTZ,
    group_session_count INT NOT NULL DEFAULT 0,
    no_show_count INT NOT NULL DEFAULT 0,
    push_notification_token TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    verification_submitted_at TIMESTAMPTZ -- Added from User.java
);

CREATE TABLE gyms (
    gym_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    address TEXT,
    location geography(Point, 4326),
    status gym_status NOT NULL DEFAULT 'pending',
    submitted_by_user_id UUID REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- -----------------------------
-- | Badge System Tables       |
-- -----------------------------

CREATE TABLE badges (
    badge_id SERIAL PRIMARY KEY,
    badge_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    icon_url TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE user_badges (
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    badge_id INT NOT NULL REFERENCES badges(badge_id) ON DELETE CASCADE,
    earned_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (user_id, badge_id)
);

-- Add the foreign key from users to gyms now that gyms table exists
ALTER TABLE users
ADD CONSTRAINT fk_users_primary_gym
FOREIGN KEY (primary_gym_id) 
REFERENCES gyms(gym_id) 
ON DELETE SET NULL;

CREATE TABLE sessions (
    session_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    creator_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    gym_id UUID NOT NULL REFERENCES gyms(gym_id) ON DELETE CASCADE,
    session_type session_type NOT NULL,
    status session_status NOT NULL DEFAULT 'active',
    title VARCHAR(255) NOT NULL,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ NOT NULL,
    max_participants INT NOT NULL DEFAULT 3,
    firestore_chat_id VARCHAR(100),
    is_rating_notified BOOLEAN NOT NULL DEFAULT false,
    -- --- NEW FIELDS FOR EPHEMERAL CHAT ---
    
    /**
     * Controls if the chat is currently visible to clients.
     * Managed by the ChatActivationService.
     */
    is_chat_active BOOLEAN NOT NULL DEFAULT false,
    
    /**
     * Prevents the scheduler from re-processing old sessions.
     * Set to true after the deactivation job runs.
     */
    is_chat_processed BOOLEAN NOT NULL DEFAULT false,
    
    -- --- END OF NEW FIELDS ---
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    -- Check constraint from @Check annotation in Session.java
    CONSTRAINT check_max_participants
        CHECK ( (session_type = 'one_on_one' AND max_participants = 2) OR 
                (session_type = 'group' AND max_participants >= 3) )
);

-- ---------------------------------
-- | Relationship Tables (Many-to-Many) |
-- ---------------------------------

CREATE TABLE session_participants (
    session_id UUID NOT NULL REFERENCES sessions(session_id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    status participant_status NOT NULL DEFAULT 'joined',
    joined_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (session_id, user_id)
);

CREATE TABLE tags (
    tag_id SERIAL PRIMARY KEY,
    tag_name VARCHAR(100) NOT NULL UNIQUE,
    tag_type tag_type NOT NULL
);

CREATE TABLE user_tags (
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    tag_id INT NOT NULL REFERENCES tags(tag_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, tag_id)
);

-- ---------------------------------
-- | Accountability & Safety Tables |
-- ---------------------------------

CREATE TABLE ratings (
    rating_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    session_id UUID NOT NULL REFERENCES sessions(session_id) ON DELETE CASCADE,
    rating_by_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    rating_for_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    rating_value SMALLINT NOT NULL, -- Per Rating.java, no DB-level check constraint
    comment TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    -- Unique constraint from @UniqueConstraint in Rating.java
    UNIQUE (session_id, rating_by_user_id, rating_for_user_id),
    -- Check constraint from @Check in Rating.java
    CONSTRAINT no_self_rating CHECK (rating_by_user_id != rating_for_user_id)
);

CREATE TABLE reports (
    report_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    reported_by_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    reported_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    session_id UUID REFERENCES sessions(session_id) ON DELETE SET NULL,
    reason TEXT NOT NULL,
    priority report_priority NOT NULL DEFAULT 'low',
    status report_status NOT NULL DEFAULT 'pending',
    resolution_notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    -- Check constraint from @Check in Report.java
    CONSTRAINT no_self_reporting CHECK (reported_by_user_id != reported_user_id)
);

CREATE TABLE user_blocks (
    blocker_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    blocked_user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (blocker_user_id, blocked_user_id)
    -- Note: no_self_block constraint is not in UserBlock.java
);

-- -----------------------------
-- | Indexes for Performance   |
-- | (As defined in @Index annotations) |
-- -----------------------------

-- Indexes from User.java
CREATE INDEX idx_user_primary_gym ON users (primary_gym_id);
CREATE INDEX idx_user_verification_status ON users (verification_status);
CREATE INDEX idx_user_role_status ON users (role, status);
CREATE INDEX idx_user_created_at ON users (created_at DESC);

-- Indexes for Badge System
CREATE INDEX idx_badges_name ON badges (badge_name);
CREATE INDEX idx_user_badges_user ON user_badges (user_id);
CREATE INDEX idx_user_badges_badge ON user_badges (badge_id);
CREATE INDEX idx_user_badges_earned_at ON user_badges (earned_at DESC);

-- Indexes from Gym.java
CREATE INDEX idx_gym_submitted_by_user ON gyms (submitted_by_user_id);
CREATE INDEX idx_gyms_location ON gyms USING GIST (location); -- Standard index for PostGIS

-- Indexes from Session.java
CREATE INDEX idx_session_creator_user ON sessions (creator_user_id);
CREATE INDEX idx_session_gym ON sessions (gym_id);
CREATE INDEX idx_session_status_type ON sessions (status, session_type);
CREATE INDEX idx_session_time_range ON sessions (start_time, end_time);
-- --- ADD THESE INDEXES for scheduler performance ---
CREATE INDEX idx_session_chat_activation ON sessions (is_chat_active, is_chat_processed, start_time);
CREATE INDEX idx_session_chat_deactivation ON sessions (is_chat_active, is_chat_processed, end_time);

-- Indexes from SessionParticipant.java
CREATE INDEX idx_sessionparticipant_session ON session_participants (session_id);
CREATE INDEX idx_sessionparticipant_user ON session_participants (user_id);

-- Indexes from UserTag.java
CREATE INDEX idx_usertag_user ON user_tags (user_id);
CREATE INDEX idx_usertag_tag ON user_tags (tag_id);

-- Indexes from Rating.java
CREATE INDEX idx_rating_session ON ratings (session_id);
CREATE INDEX idx_rating_rating_by ON ratings (rating_by_user_id);
CREATE INDEX idx_rating_rating_for ON ratings (rating_for_user_id);

-- Indexes from Report.java
CREATE INDEX idx_report_reported_by ON reports (reported_by_user_id);
CREATE INDEX idx_report_reported_user ON reports (reported_user_id);
CREATE INDEX idx_report_session ON reports (session_id);

-- Indexes from UserBlock.java
CREATE INDEX idx_userblock_blocker ON user_blocks (blocker_user_id);
CREATE INDEX idx_userblock_blocked ON user_blocks (blocked_user_id);

-- -----------------------------
-- | Triggers & Functions      |
-- | (For @UpdateTimestamp)    |
-- -----------------------------

CREATE OR REPLACE FUNCTION fn_set_updated_at_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply trigger to tables with @UpdateTimestamp
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

-- -----------------------------
-- | Populate Initial Data     |
-- -----------------------------

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

-- Insert the UNRELIABLE badge for the no-show system
INSERT INTO badges (badge_name, description, icon_url)
VALUES
    ('UNRELIABLE', 'User has 3 or more no-shows.', '/badges/unreliable.png');

-- Example data (optional, kept from your script)
INSERT INTO gyms (name, address, location, status)
VALUES
    ('Founders Gym 1', '123 Main St, Tunis', ST_SetSRID(ST_MakePoint(10.1815, 36.8065), 4326), 'approved');

INSERT INTO users (phone_number, password_hash, first_name, date_of_birth, verification_status, verified_gender, primary_gym_id, role)
VALUES
    ('+21600000001', 'hashed_password', 'Founding_Lieutenant', '1990-01-01', 'verified', 'male', (SELECT gym_id FROM gyms WHERE name = 'Founders Gym 1'), 'ambassador');

COMMIT;