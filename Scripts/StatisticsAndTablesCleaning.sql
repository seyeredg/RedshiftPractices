SELECT *
FROM pg_statistic_indicator
WHERE stairelid = (SELECT DISTINCT id
FROM stv_tbl_perm
WHERE name = 'sales');

SELECT *
FROM pg_table_def
WHERE tablename = 'sales';

analyze sales(salesid, pricepaid);
analyze sales predicate columns;
analyze sales;

SELECT *
FROM stl_analyze;

--Vaccum
SELECT "table", unsorted, vacuum_sort_benefit
FROM svv_table_info;

vacuum sales;
vacuum sort only sales to 75 percent;
vacuum delete only sales to 75 percent;
vacuum reindex sales;