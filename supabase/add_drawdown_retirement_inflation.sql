-- Draw Down Modeller: retirement age (gates when the Pensions category
-- starts being drawn down rather than just compounding untouched) and an
-- inflation rate (used to deflate the chart/stats to today's money).
ALTER TABLE savings.drawdown_assumptions ADD COLUMN IF NOT EXISTS retirement_age integer NOT NULL DEFAULT 65;
ALTER TABLE savings.drawdown_assumptions ADD COLUMN IF NOT EXISTS inflation_rate numeric NOT NULL DEFAULT 4;
