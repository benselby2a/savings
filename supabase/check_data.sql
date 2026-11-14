-- Read-only health check. Run in the Supabase SQL Editor; changes nothing.
-- Returns one row per expected column in every table (accounts, snapshots,
-- owners, drawdown_assumptions) showing whether it exists, its type, how many
-- rows are blank in it, and (for drawdown_assumptions) the saved value, then
-- a set of checks on the numbers the Draw Down Modeller depends on.
--
-- Status: OK | WARN (look at it) | MISSING (column absent: run its migration)
--         | EMPTY (table has no rows) | INFO
-- If you get 'relation ... does not exist', that whole table's migration
-- hasn't been run (owners: add_owners_table.sql; drawdown_assumptions:
-- add_drawdown_assumptions.sql).

with
expected(tbl, col, ord) as (values
  ('accounts','id',1), ('accounts','user_id',2), ('accounts','name',3), ('accounts','owner',4),
  ('accounts','category',5), ('accounts','color',6), ('accounts','display_order',7),
  ('accounts','hidden',8), ('accounts','created_at',9),
  ('snapshots','id',101), ('snapshots','user_id',102), ('snapshots','account_id',103),
  ('snapshots','date',104), ('snapshots','amount',105), ('snapshots','created_at',106),
  ('owners','id',201), ('owners','name',202), ('owners','created_at',203),
  ('drawdown_assumptions','id',301), ('drawdown_assumptions','incomes',302),
  ('drawdown_assumptions','income_years',303), ('drawdown_assumptions','growth_rate',304),
  ('drawdown_assumptions','monthly_spend',305), ('drawdown_assumptions','monthly_essentials',306),
  ('drawdown_assumptions','monthly_discretionary',307), ('drawdown_assumptions','horizon_years',308),
  ('drawdown_assumptions','year_of_birth',309), ('drawdown_assumptions','retirement_age',310),
  ('drawdown_assumptions','state_pension_age',311), ('drawdown_assumptions','inflation_rate',312),
  ('drawdown_assumptions','included_categories',313), ('drawdown_assumptions','updated_at',314),
  ('drawdown_assumptions','category_growth',315)
),
src(tbl, j) as (
  select 'accounts', to_jsonb(t) from savings.accounts t
  union all select 'snapshots', to_jsonb(t) from savings.snapshots t
  union all select 'owners', to_jsonb(t) from savings.owners t
  union all select 'drawdown_assumptions', to_jsonb(t) from savings.drawdown_assumptions t
),
col_rows as (
  select e.tbl, e.col, e.ord, c.data_type,
    (select count(*) from src s where s.tbl = e.tbl) as n_rows,
    (select count(*) from src s where s.tbl = e.tbl
       and (s.j -> e.col is null or jsonb_typeof(s.j -> e.col) = 'null')) as n_blank,
    (select s.j ->> e.col from src s
       where s.tbl = 'drawdown_assumptions' and e.tbl = 'drawdown_assumptions'
         and s.j ->> 'id' = 'default' limit 1) as saved_value
  from expected e
  left join information_schema.columns c
    on c.table_schema = 'savings' and c.table_name = e.tbl and c.column_name = e.col
),
cats(c) as (values ('Cash'), ('Available Assets'), ('Restricted Assets'), ('Properties'), ('Pensions')),
one as (select 1 as x),
a as (
  select
    (j ->> 'growth_rate')::numeric as growth, (j ->> 'inflation_rate')::numeric as infl,
    (j ->> 'monthly_essentials')::numeric as ess, (j ->> 'monthly_discretionary')::numeric as disc,
    (j ->> 'horizon_years')::numeric as horizon, (j ->> 'year_of_birth')::numeric as yob,
    (j ->> 'retirement_age')::numeric as ret_age, (j ->> 'state_pension_age')::numeric as sp_age,
    j -> 'included_categories' as cats_j, j -> 'incomes' as incomes
  from src where tbl = 'drawdown_assumptions' and j ->> 'id' = 'default'
),
latest as (select max(date) as d from savings.snapshots),
vis as (select * from savings.accounts where coalesce(hidden, false) = false),
inc_owners as (select name from savings.owners where name <> 'Joint'),
inc_check as (
  select o.name,
    case when jsonb_typeof(a.incomes -> o.name) = 'object' then a.incomes -> o.name ->> 'job1'
         else a.incomes ->> o.name end as job1
  from inc_owners o cross join a
),
checks(n, chk, status, detail) as (
  select ord, tbl || '.' || col,
    case when data_type is null then 'MISSING'
         when n_rows = 0 then 'EMPTY'
         when n_blank > 0 then 'WARN'
         else 'OK' end,
    case when data_type is null then 'column not found - run the migration that adds it'
         else data_type || ' | rows ' || n_rows || ' | blank ' || n_blank
              || coalesce(' | value: ' || saved_value, '') end
  from col_rows

  union all
  select 1001, 'Assumptions row saved',
    case when exists (select 1 from a) then 'OK' else 'MISSING' end,
    case when exists (select 1 from a) then 'id = default'
         else 'Nothing saved yet - change any field on the Draw Down tab, then re-run' end

  union all
  select 1002, 'Growth vs inflation',
    case when a.growth is null or a.infl is null then 'MISSING'
         when a.growth <= a.infl then 'WARN' else 'OK' end,
    'growth ' || coalesce(a.growth::text, '?') || '%, inflation ' || coalesce(a.infl::text, '?') || '%'
      || case when a.growth <= a.infl then ' - zero/negative real growth, savings will fall steadily' else '' end
  from one left join a on true

  union all
  select 1003, 'Monthly spend',
    case when coalesce(a.ess, 0) + coalesce(a.disc, 0) = 0 then 'WARN' else 'OK' end,
    'essentials ' || coalesce(a.ess::text, '?') || ' + discretionary ' || coalesce(a.disc::text, '?')
  from one left join a on true

  union all
  select 1004, 'Ages',
    case when a.yob is null or a.ret_age is null or a.sp_age is null then 'MISSING'
         when a.yob not between 1930 and 2010 or a.ret_age not between 50 and 80 then 'WARN'
         else 'OK' end,
    'born ' || coalesce(a.yob::text, '?') || ', retirement age ' || coalesce(a.ret_age::text, '?')
      || ', state pension age ' || coalesce(a.sp_age::text, '?')
  from one left join a on true

  union all
  select 1005, 'Included savings types',
    case when a.cats_j is null or jsonb_array_length(a.cats_j) = 0 then 'WARN'
         when exists (select 1 from jsonb_array_elements_text(a.cats_j) v where v not in (select c from cats)) then 'WARN'
         else 'OK' end,
    coalesce(a.cats_j::text, 'none')
  from one left join a on true

  union all
  select 1006, 'Job 1 income per owner',
    case when not exists (select 1 from inc_check) then 'WARN'
         when exists (select 1 from inc_check where coalesce(nullif(job1, ''), '0')::numeric <= 0) then 'WARN'
         else 'OK' end,
    coalesce((select string_agg(name || ' = ' || coalesce(nullif(job1, ''), 'none'), ', ' order by name) from inc_check),
             'no owners (or no assumptions saved)')

  union all
  select 1007, 'Income entries match owners table',
    case when exists (select 1 from a, jsonb_each(a.incomes) k
                      where k.key not in (select name from savings.owners)) then 'WARN' else 'OK' end,
    coalesce((select string_agg(k.key, ', ') from a, jsonb_each(a.incomes) k
              where k.key not in (select name from savings.owners)), 'all income entries belong to an owner')

  union all
  select 1010, 'Owners', case when count(*) = 0 then 'WARN' else 'OK' end,
    count(*) || ': ' || coalesce(string_agg(name, ', ' order by name), 'none')
  from savings.owners

  union all
  select 1011, 'Accounts (visible / total)', case when count(*) = 0 then 'WARN' else 'OK' end,
    count(*) filter (where coalesce(hidden, false) = false) || ' / ' || count(*)
  from savings.accounts

  union all
  select 1012, 'Accounts with unrecognised category',
    case when count(*) > 0 then 'WARN' else 'OK' end,
    coalesce(string_agg(name || ' (' || coalesce(category, 'null') || ')', ', '), 'none')
  from savings.accounts where coalesce(category, '') not in (select c from cats)

  union all
  select 1013, 'Accounts whose owner is not in owners table',
    case when count(*) > 0 then 'WARN' else 'OK' end,
    coalesce(string_agg(name || ' (' || coalesce(owner, 'null') || ')', ', '), 'none')
  from savings.accounts where coalesce(owner, '') not in (select name from savings.owners)

  union all
  select 1020, 'Snapshots / latest date',
    case when count(*) = 0 then 'WARN' when current_date - max(date) > 45 then 'WARN' else 'OK' end,
    count(*) || ' rows, latest ' || coalesce(max(date)::text, 'none')
      || coalesce(' (' || (current_date - max(date)) || ' days ago)', '')
  from savings.snapshots

  union all
  select 1021, 'Visible accounts missing a snapshot on the latest date',
    case when count(*) > 0 then 'WARN' else 'OK' end,
    coalesce(string_agg(v.name, ', '), 'none') || ' (a missing one counts as 0 and understates the starting balance)'
  from vis v
  where not exists (select 1 from savings.snapshots s where s.account_id = v.id and s.date = (select d from latest))

  union all
  select 1022, 'Accounts with no snapshots at all',
    case when count(*) > 0 then 'WARN' else 'OK' end,
    coalesce(string_agg(name, ', '), 'none')
  from savings.accounts v where not exists (select 1 from savings.snapshots s where s.account_id = v.id)

  union all
  select 1023, 'Negative snapshot amounts',
    case when count(*) > 0 then 'WARN' else 'OK' end, count(*) || ' rows'
  from savings.snapshots where amount < 0

  union all
  select 1030, 'Starting balance at latest date, by type (visible accounts)', 'INFO',
    coalesce((select string_agg(cat || ' £' || to_char(t, 'FM999,999,990'), ' | ' order by cat)
              from (select coalesce(v.category, 'Cash') as cat, sum(s.amount) as t
                    from vis v join savings.snapshots s on s.account_id = v.id and s.date = (select d from latest)
                    group by 1) x), 'no data')
    || ' | ALL £' || to_char(coalesce((select sum(s.amount) from vis v
                    join savings.snapshots s on s.account_id = v.id and s.date = (select d from latest)), 0), 'FM999,999,990')
)
select chk as "check", status, detail from checks order by n;
