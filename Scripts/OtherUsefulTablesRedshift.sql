SELECT * FROM pg_table_def
WHERE tablename = 'sales'; -- Encoding, distribution and ordering

SELECT * FROM pg_catalog.stv_blocklist sb ; -- Allow us to see data blocks

SELECT * FROM pg_catalog.stl_load_errors ; -- Error logs

SELECT * FROM pg_catalog.stl_load_commits ; -- Succesful commits logs

SELECT * FROM stl_query; -- information about queries

SELECT * FROM stl_query
WHERE query = 29;

SELECT * FROM pg_catalog.svl_qlog  -- see queries
ORDER BY starttime desc;


SELECT * FROM pg_catalog.svl_user_info ; -- information about users

CREATE user invitado password 'Password123';

SELECT * FROM svv_tables;

SELECT * FROM svv_tables
WHERE table_schema = 'public';