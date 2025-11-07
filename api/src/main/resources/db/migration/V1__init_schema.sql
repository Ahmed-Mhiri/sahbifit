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
    primary_gym_id UUID,
    role user_role NOT NULL DEFAULT 'member',
    status user_status NOT NULL DEFAULT 'active',
    suspended_until TIMESTAMPTZ,
    group_session_count INT NOT NULL DEFAULT 0,
    no_show_count INT NOT NULL DEFAULT 0,
    push_notification_token TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
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
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
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
    rating_value SMALLINT NOT NULL CHECK (rating_value BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (session_id, rating_by_user_id, rating_for_user_id),
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
    CONSTRAINT no_self_reporting CHECK (reported_by_user_id != reported_user_id)
);

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

-- Existing indexes from your DDL
CREATE INDEX idx_users_verification_status ON users (verification_status) WHERE verification_status = 'pending_review';
CREATE UNIQUE INDEX idx_users_phone_number ON users (phone_number);
CREATE INDEX idx_users_primary_gym_id ON users (primary_gym_id);
CREATE INDEX idx_gyms_location ON gyms USING GIST (location);
CREATE INDEX idx_gyms_status ON gyms (status) WHERE status = 'pending';
CREATE INDEX idx_sessions_start_time ON sessions (start_time);
CREATE INDEX idx_sessions_gym_id ON sessions (gym_id);
CREATE INDEX idx_sessions_session_type ON sessions (session_type);
CREATE INDEX idx_session_participants_user_id ON session_participants (user_id);
CREATE INDEX idx_session_participants_session_id ON session_participants (session_id);
CREATE INDEX idx_ratings_rating_for_user_id ON ratings (rating_for_user_id);
CREATE INDEX idx_reports_status_priority ON reports (status, priority);
CREATE INDEX idx_reports_reported_user_id ON reports (reported_user_id);
CREATE INDEX idx_user_tags_tag_id ON user_tags (tag_id);

-- New indexes for pending ratings query
CREATE INDEX idx_session_participant_user_status ON session_participants(user_id, status);
CREATE INDEX idx_session_participant_session_status ON session_participants(session_id, status);
CREATE INDEX idx_rating_session_rater_rated ON ratings(session_id, rating_by_user_id, rating_for_user_id);

-- Additional critical indexes
CREATE INDEX idx_users_verification_gender ON users(verified_gender);
CREATE INDEX idx_users_role_status ON users(role, status);
CREATE INDEX idx_users_created_at ON users(created_at DESC);
CREATE INDEX idx_users_dob ON users(date_of_birth);
CREATE INDEX idx_users_profile_visibility ON users(profile_visibility);

-- Session query performance
CREATE INDEX idx_sessions_status_type ON sessions(status, session_type);
CREATE INDEX idx_sessions_time_range ON sessions(start_time, end_time) WHERE status = 'active';
CREATE INDEX idx_sessions_creator_status ON sessions(creator_user_id, status);
CREATE INDEX idx_sessions_created_at ON sessions(created_at DESC);

-- Rating and reputation queries
CREATE INDEX idx_ratings_rating_for_created ON ratings(rating_for_user_id, created_at DESC);
CREATE INDEX idx_ratings_rating_value ON ratings(rating_value);
CREATE INDEX idx_ratings_rating_by_created ON ratings(rating_by_user_id, created_at DESC);

-- Report management
CREATE INDEX idx_reports_created_priority ON reports(created_at DESC, priority);
CREATE INDEX idx_reports_status_created ON reports(status, created_at DESC);
CREATE INDEX idx_reports_reported_by ON reports(reported_by_user_id);

-- Gym location queries
CREATE INDEX idx_gyms_status_location ON gyms(status, location);
CREATE INDEX idx_gyms_created_at ON gyms(created_at DESC);
CREATE INDEX idx_gyms_submitted_by ON gyms(submitted_by_user_id);

-- Composite indexes for common join patterns
CREATE INDEX idx_session_participants_user_session_composite ON session_participants(user_id, session_id, status);
CREATE INDEX idx_user_tags_composite ON user_tags(user_id, tag_id);
CREATE INDEX idx_user_blocks_composite ON user_blocks(blocker_user_id, blocked_user_id);

-- Partial indexes for soft deletion
CREATE INDEX idx_active_users ON users(user_id) WHERE status != 'banned';
CREATE INDEX idx_active_sessions ON sessions(session_id) WHERE status = 'active';
CREATE INDEX idx_active_gyms ON gyms(gym_id) WHERE status = 'approved';

-- Covering indexes for common queries
CREATE INDEX idx_user_profile ON users (user_id, first_name, profile_photo_url, verification_status, verified_gender);

-- Specialized indexes for pending ratings optimization
CREATE INDEX idx_pending_ratings_query ON session_participants (user_id, status) INCLUDE (session_id) WHERE status IN ('attended', 'joined');
CREATE INDEX idx_rating_checks ON ratings (session_id, rating_by_user_id) INCLUDE (rating_for_user_id);

-- -----------------------------
-- | Additional Constraints    |
-- -----------------------------

-- Add check constraints for data integrity
ALTER TABLE users 
ADD CONSTRAINT chk_users_age CHECK (date_of_birth <= CURRENT_DATE - INTERVAL '16 years');

ALTER TABLE sessions 
ADD CONSTRAINT chk_session_times CHECK (end_time > start_time);

ALTER TABLE ratings 
ADD CONSTRAINT chk_rating_value_range CHECK (rating_value BETWEEN 1 AND 5);

-- Ensure unique constraints that match entity definitions
ALTER TABLE user_blocks 
ADD CONSTRAINT uk_user_blocks_unique UNIQUE (blocker_user_id, blocked_user_id);

-- -----------------------------
-- | Triggers & Functions      |
-- -----------------------------

CREATE OR REPLACE FUNCTION fn_set_updated_at_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

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

INSERT INTO gyms (name, address, location, status)
VALUES
    ('Founders Gym 1', '123 Main St, Tunis', ST_SetSRID(ST_MakePoint(10.1815, 36.8065), 4326), 'approved');

INSERT INTO users (phone_number, password_hash, first_name, date_of_birth, verification_status, verified_gender, primary_gym_id, role)
VALUES
    ('+21600000001', 'hashed_password', 'Founding_Lieutenant', '1990-01-01', 'verified', 'male', (SELECT gym_id FROM gyms WHERE name = 'Founders Gym 1'), 'ambassador');

COMMIT;