-- Draw Down Modeller: split the single monthly spend figure into
-- essentials vs discretionary. Existing monthly_spend is left in place
-- (unused going forward) and the app migrates its value into
-- monthly_essentials client-side on first load after this runs.
ALTER TABLE savings.drawdown_assumptions ADD COLUMN IF NOT EXISTS monthly_essentials numeric NOT NULL DEFAULT 0;
ALTER TABLE savings.drawdown_assumptions ADD COLUMN IF NOT EXISTS monthly_discretionary numeric NOT NULL DEFAULT 0;
