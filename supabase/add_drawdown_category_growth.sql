-- Draw Down Modeller: optional growth rate per savings type (jsonb map of
-- category -> annual %). A category left blank uses the default growth rate.
ALTER TABLE savings.drawdown_assumptions ADD COLUMN IF NOT EXISTS category_growth jsonb NOT NULL DEFAULT '{}'::jsonb;
