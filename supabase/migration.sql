-- Savings Tracker: run this in your Supabase SQL Editor

-- Create dedicated schema
create schema if not exists savings;

-- Grant PostgREST roles access to the schema
grant usage on schema savings to anon, authenticated;
alter default privileges in schema savings grant all on tables to anon, authenticated;
alter default privileges in schema savings grant all on sequences to anon, authenticated;

-- Accounts table
create table if not exists savings.accounts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  owner text not null default 'Joint',
  category text not null default 'Cash',
  color text not null default '#2196F3',
  display_order integer not null default 0,
  created_at timestamptz not null default now()
);

-- Snapshots table
create table if not exists savings.snapshots (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  account_id uuid not null references savings.accounts(id) on delete cascade,
  date date not null,
  amount numeric not null default 0,
  created_at timestamptz not null default now(),
  unique (account_id, date)
);

-- Indexes
create index if not exists idx_accounts_user on savings.accounts(user_id);
create index if not exists idx_snapshots_user on savings.snapshots(user_id);
create index if not exists idx_snapshots_account_date on savings.snapshots(account_id, date);
create index if not exists idx_snapshots_date on savings.snapshots(date);

-- Enable RLS
alter table savings.accounts enable row level security;
alter table savings.snapshots enable row level security;

-- RLS policies: any authenticated user can read/write all data
create policy "Authenticated users can view accounts"
  on savings.accounts for select using (auth.role() = 'authenticated');

create policy "Authenticated users can insert accounts"
  on savings.accounts for insert with check (auth.role() = 'authenticated');

create policy "Authenticated users can update accounts"
  on savings.accounts for update using (auth.role() = 'authenticated');

create policy "Authenticated users can delete accounts"
  on savings.accounts for delete using (auth.role() = 'authenticated');

create policy "Authenticated users can view snapshots"
  on savings.snapshots for select using (auth.role() = 'authenticated');

create policy "Authenticated users can insert snapshots"
  on savings.snapshots for insert with check (auth.role() = 'authenticated');

create policy "Authenticated users can update snapshots"
  on savings.snapshots for update using (auth.role() = 'authenticated');

create policy "Authenticated users can delete snapshots"
  on savings.snapshots for delete using (auth.role() = 'authenticated');

-- IMPORTANT: After running this migration, go to your Supabase dashboard:
-- Settings → API → "Exposed schemas" → add "savings"
-- This allows the Supabase client to query tables in this schema.
notify pgrst, 'reload config';
