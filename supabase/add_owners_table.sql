-- Create owners table
CREATE TABLE IF NOT EXISTS savings.owners (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL UNIQUE,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Grant access
GRANT ALL ON savings.owners TO anon, authenticated;

-- RLS
ALTER TABLE savings.owners ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can view owners"
  ON savings.owners FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can insert owners"
  ON savings.owners FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can delete owners"
  ON savings.owners FOR DELETE USING (auth.role() = 'authenticated');

-- Seed default owners
INSERT INTO savings.owners (name) VALUES ('Ben'), ('Louise'), ('Joint')
  ON CONFLICT (name) DO NOTHING;
