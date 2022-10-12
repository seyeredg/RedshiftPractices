CREATE TABLE dist_key (columna int)
diststyle key distkey (columna);
INSERT INTO dist_key VALUES (10);

CREATE TABLE dist_even (columna int)
diststyle even;
INSERT INTO dist_even VALUES (10);

CREATE TABLE dist_all (columna int)
diststyle all;
INSERT INTO dist_all VALUES (10);

CREATE TABLE dist_auto (columna int);
INSERT INTO dist_auto VALUES (10);

SELECT *
FROM pg_catalog.svv_table_info
LIMIT 10;

SELECT *
FROM pg_catalog.svv_table_info
WHERE "table" LIKE '%dist%'
LIMIT 10;

SELECT *
FROM pg_table_def
WHERE tablename = 'users';

SELECT *
FROM pg_catalog.svv_diskusage 
LIMIT 10;

SELECT *
FROM pg_catalog.svv_diskusage 
WHERE "name" = 'users'
AND col = 0;

SELECT distinct slice, col, num_values, "minvalue", "maxvalue"
FROM pg_catalog.svv_diskusage 
WHERE "name" = 'users'
AND col = 0
AND num_values > 0
ORDER BY slice, col;

CREATE TABLE user_key_state distkey(state) AS (SELECT * FROM users)

SELECT distinct slice, col, num_values, "minvalue", "maxvalue"
FROM pg_catalog.svv_diskusage 
WHERE "name" = 'user_key_state'
AND col = 0
AND num_values > 0
ORDER BY slice, col;

CREATE TABLE user_even_state diststyle even AS (SELECT * FROM users)

SELECT distinct slice, col, num_values, "minvalue", "maxvalue"
FROM pg_catalog.svv_diskusage 
WHERE "name" = 'user_even_state'
AND col = 0
AND num_values > 0
ORDER BY slice, col;

CREATE TABLE user_all diststyle all AS (SELECT * FROM users)

SELECT distinct slice, col, num_values, "minvalue", "maxvalue"
FROM pg_catalog.svv_diskusage 
WHERE "name" = 'user_all'
AND col = 0
AND num_values > 0
ORDER BY slice, col;