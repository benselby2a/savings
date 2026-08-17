-- Add owner column to accounts
ALTER TABLE savings.accounts ADD COLUMN IF NOT EXISTS owner text NOT NULL DEFAULT 'Joint';
