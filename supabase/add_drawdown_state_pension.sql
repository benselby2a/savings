-- Draw Down Modeller: state pension age (shared; each owner's state pension
-- amount lives in the existing incomes jsonb column, same pattern as job1/job2).
ALTER TABLE savings.drawdown_assumptions ADD COLUMN IF NOT EXISTS state_pension_age integer NOT NULL DEFAULT 67;
