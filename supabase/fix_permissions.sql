-- Grant access to the savings schema for PostgREST roles
GRANT USAGE ON SCHEMA savings TO anon, authenticated;
GRANT ALL ON ALL TABLES IN SCHEMA savings TO anon, authenticated;
GRANT ALL ON ALL SEQUENCES IN SCHEMA savings TO anon, authenticated;

-- Ensure future tables in the schema also get the right permissions
ALTER DEFAULT PRIVILEGES IN SCHEMA savings GRANT ALL ON TABLES TO anon, authenticated;
ALTER DEFAULT PRIVILEGES IN SCHEMA savings GRANT ALL ON SEQUENCES TO anon, authenticated;
