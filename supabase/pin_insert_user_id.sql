-- Run this in the Supabase SQL Editor against an existing install.
-- Pins INSERT on accounts/snapshots to the inserting user's own id,
-- so user_id can no longer be set to another household member's id.
--
-- UPDATE policies are deliberately left alone: the app lets any
-- authenticated member edit an entry regardless of who originally
-- created it, and its update calls never touch user_id, so requiring
-- user_id = auth.uid() there would reject edits to another member's
-- existing rows.

drop policy if exists "Authenticated users can insert accounts" on savings.accounts;
create policy "Authenticated users can insert accounts"
  on savings.accounts for insert with check (auth.role() = 'authenticated' and user_id = auth.uid());

drop policy if exists "Authenticated users can insert snapshots" on savings.snapshots;
create policy "Authenticated users can insert snapshots"
  on savings.snapshots for insert with check (auth.role() = 'authenticated' and user_id = auth.uid());
