-- Draw Down Modeller: per-owner income validity window, and which
-- account categories count toward the starting balance.
ALTER TABLE savings.drawdown_assumptions ADD COLUMN IF NOT EXISTS income_years jsonb NOT NULL DEFAULT '{}'::jsonb;
ALTER TABLE savings.drawdown_assumptions ADD COLUMN IF NOT EXISTS included_categories jsonb NOT NULL DEFAULT '["Cash","Available Assets","Restricted Assets"]'::jsonb;
