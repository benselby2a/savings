-- Draw Down Modeller: stores the household's shared projection assumptions
-- (per-owner income, growth rate, monthly spend, horizon) as a single row
-- so they persist for everyone who opens the app.
CREATE TABLE IF NOT EXISTS savings.drawdown_assumptions (
  id text PRIMARY KEY DEFAULT 'default',
  incomes jsonb NOT NULL DEFAULT '{}'::jsonb,
  growth_rate numeric NOT NULL DEFAULT 4,
  monthly_spend numeric NOT NULL DEFAULT 0,
  horizon_years integer NOT NULL DEFAULT 20,
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- Grant access
GRANT ALL ON savings.drawdown_assumptions TO anon, authenticated;

-- RLS: shared household settings, same pattern as the owners table
ALTER TABLE savings.drawdown_assumptions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can view drawdown assumptions"
  ON savings.drawdown_assumptions FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can insert drawdown assumptions"
  ON savings.drawdown_assumptions FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can update drawdown assumptions"
  ON savings.drawdown_assumptions FOR UPDATE USING (auth.role() = 'authenticated');
