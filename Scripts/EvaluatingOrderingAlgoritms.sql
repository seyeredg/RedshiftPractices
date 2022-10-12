set enable_result_cache_for_session to off;

SELECT max(lo_revenue), min(lo_revenue) 
FROM cust_sales_simple
WHERE c_custkey < 100000; --349ms ,237ms

SELECT max(lo_revenue), min(lo_revenue) 
FROM cust_sales_compuesto
WHERE c_custkey < 100000; --125ms ,146ms

SELECT max(lo_revenue), min(lo_revenue) 
FROM cust_sales_intercalado
WHERE c_custkey < 100000; --397 ms ,179ms
-------------------------------

set enable_result_cache_for_session to off;


SELECT max(lo_revenue), min(lo_revenue) 
FROM cust_sales_simple
WHERE c_region = 'ASIA'
AND c_mktsegment = 'FURNITURE'; --1.468ms, 1.369 ms

SELECT max(lo_revenue), min(lo_revenue) 
FROM cust_sales_compuesto
WHERE c_region = 'ASIA'
AND c_mktsegment = 'FURNITURE';--2.586s, 770ms

SELECT max(lo_revenue), min(lo_revenue) 
FROM cust_sales_intercalado
WHERE c_region = 'ASIA'
AND c_mktsegment = 'FURNITURE';--303ms, 104 ms


-----------
set enable_result_cache_for_session to off;


SELECT max(lo_revenue), min(lo_revenue)
FROM cust_sales_simple
WHERE d_date BETWEEN '01/01/1996' AND '01/14/1996'
AND c_mktsegment = 'FURNITURE'
AND c_region = 'ASIA';--1.415s, 115ms

SELECT max(lo_revenue), min(lo_revenue)
FROM cust_sales_compuesto
WHERE d_date BETWEEN '01/01/1996' AND '01/14/1996'
AND c_mktsegment = 'FURNITURE'
AND c_region = 'ASIA';--806 ms, 326ms

SELECT max(lo_revenue), min(lo_revenue)
FROM cust_sales_intercalado
WHERE d_date BETWEEN '01/01/1996' AND '01/14/1996'
AND c_mktsegment = 'FURNITURE'
AND c_region = 'ASIA';--236 ms, 112ms