-- Merge Chase and Marcus into a single account
-- Run this in the Supabase SQL Editor
--
-- Strategy: keep Marcus, merge Chase snapshots into it, delete Chase.
-- For dates where both accounts have data, the amounts are summed.

BEGIN;

-- 1. For dates that exist in BOTH accounts, add Chase amount to Marcus
UPDATE savings.snapshots AS m
SET amount = m.amount + c.amount
FROM savings.snapshots AS c
WHERE m.account_id = (SELECT id FROM savings.accounts WHERE name = 'Chase / Marcus' LIMIT 1)
  AND c.account_id = (SELECT id FROM savings.accounts WHERE name = 'Chase Savings' LIMIT 1)
  AND m.date = c.date;

-- 2. Move Chase snapshots for dates that DON'T already exist in Marcus
UPDATE savings.snapshots
SET account_id = (SELECT id FROM savings.accounts WHERE name = 'Chase / Marcus' LIMIT 1)
WHERE account_id = (SELECT id FROM savings.accounts WHERE name = 'Chase Savings' LIMIT 1)
  AND date NOT IN (
    SELECT date FROM savings.snapshots
    WHERE account_id = (SELECT id FROM savings.accounts WHERE name = 'Chase / Marcus' LIMIT 1)
  );

-- 3. Delete any remaining Chase snapshots (the ones that overlapped and were summed)
DELETE FROM savings.snapshots
WHERE account_id = (SELECT id FROM savings.accounts WHERE name = 'Chase Savings' LIMIT 1);

-- 4. Delete the Chase account
DELETE FROM savings.accounts WHERE name = 'Chase Savings';

-- 5. Rename Marcus to Chase & Marcus (optional — change as you like)
UPDATE savings.accounts SET name = 'Chase / Marcus' WHERE name = 'Chase / Marcus';

COMMIT;
