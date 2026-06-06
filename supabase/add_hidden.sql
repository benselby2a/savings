-- Add hidden column to accounts (allows hiding accounts without deleting)
ALTER TABLE savings.accounts ADD COLUMN IF NOT EXISTS hidden boolean NOT NULL DEFAULT false;
