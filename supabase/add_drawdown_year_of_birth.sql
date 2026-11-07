-- Draw Down Modeller: year of birth, used to shade the projection chart by age band.
ALTER TABLE savings.drawdown_assumptions ADD COLUMN IF NOT EXISTS year_of_birth integer NOT NULL DEFAULT 1989;
