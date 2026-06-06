-- Run this if you already ran the original migration.sql
-- It replaces the per-user RLS policies with shared authenticated access.

-- Drop old account policies
drop policy if exists "Users can view own accounts" on savings.accounts;
drop policy if exists "Users can insert own accounts" on savings.accounts;
drop policy if exists "Users can update own accounts" on savings.accounts;
drop policy if exists "Users can delete own accounts" on savings.accounts;

-- Drop old snapshot policies
drop policy if exists "Users can view own snapshots" on savings.snapshots;
drop policy if exists "Users can insert own snapshots" on savings.snapshots;
drop policy if exists "Users can update own snapshots" on savings.snapshots;
drop policy if exists "Users can delete own snapshots" on savings.snapshots;

-- Create new shared policies for accounts
create policy "Authenticated users can view accounts"
  on savings.accounts for select using (auth.role() = 'authenticated');

create policy "Authenticated users can insert accounts"
  on savings.accounts for insert with check (auth.role() = 'authenticated');

create policy "Authenticated users can update accounts"
  on savings.accounts for update using (auth.role() = 'authenticated');

create policy "Authenticated users can delete accounts"
  on savings.accounts for delete using (auth.role() = 'authenticated');

-- Create new shared policies for snapshots
create policy "Authenticated users can view snapshots"
  on savings.snapshots for select using (auth.role() = 'authenticated');

create policy "Authenticated users can insert snapshots"
  on savings.snapshots for insert with check (auth.role() = 'authenticated');

create policy "Authenticated users can update snapshots"
  on savings.snapshots for update using (auth.role() = 'authenticated');

create policy "Authenticated users can delete snapshots"
  on savings.snapshots for delete using (auth.role() = 'authenticated');
