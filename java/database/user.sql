-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER volinslate_owner
WITH PASSWORD 'FirstOwner';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO volinslate_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO volinslate_owner;

CREATE USER volinslate_appuser
WITH PASSWORD 'FirstUser';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO volinslate_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO volinslate_appuser;
