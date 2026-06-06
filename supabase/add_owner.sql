-- Add owner column to accounts
ALTER TABLE savings.accounts ADD COLUMN IF NOT EXISTS owner text NOT NULL DEFAULT 'Joint';

-- Set all existing accounts to Ben
UPDATE savings.accounts SET owner = 'Ben';
