-- Add category column to accounts
ALTER TABLE savings.accounts ADD COLUMN IF NOT EXISTS category text NOT NULL DEFAULT 'Cash';
