-- 1. Add the tracking column to the users table
-- We use IF NOT EXISTS so this script won't fail if the column is already there
ALTER TABLE users
ADD COLUMN IF NOT EXISTS late_cancel_count INTEGER NOT NULL DEFAULT 0;

-- 2. Ensure the 'UNRELIABLE' badge exists for the new penalty logic
-- Using ON CONFLICT to prevent errors if the badge already exists
INSERT INTO badges (badge_name, description, icon_url)
VALUES (
    'UNRELIABLE', 
    'User has frequently cancelled late (less than 1 hour before) or missed sessions.', 
    NULL -- Set to NULL. The Flutter app will show a default Shield icon.
)
ON CONFLICT (badge_name) DO NOTHING;