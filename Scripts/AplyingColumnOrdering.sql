CREATE TABLE public.cust_sales_date (
	c_custkey int4 NULL,
	c_nation varchar(15) NULL,
	c_region varchar(12) NULL,
	c_mktsegment varchar(10) NULL,
	d_date date NULL,
	lo_revenue int4 NULL
);

copy cust_sales_date from 's3://mybucketredshift/cust_sales_date.bz2' 
credentials 'aws_iam_role=arn:aws:iam::XXXX:role/MiRoleRedshift' 
BZIP2
region 'us-east-2';

SELECT COUNT(0) FROM cust_sales_date;
SELECT * FROM  cust_sales_date LIMIT 10;

CREATE TABLE cust_sales_simple
sortkey (c_custkey)
AS (
	SELECT c_custkey, c_nation, c_region, c_mktsegment, d_date, lo_revenue
	FROM cust_sales_date, auxiliar
	);

SELECT count(0) FROM cust_sales_simple;

CREATE TABLE auxiliar (col int);
INSERT INTO auxiliar VALUES (1), (2), (3), (4), (5);

SELECT * FROM auxiliar;

SELECT c_custkey, c_nation, c_region, c_mktsegment, d_date, lo_revenue
FROM cust_sales_date, auxiliar
LIMIT 10;

CREATE TABLE cust_sales_compuesto
compound sortkey (c_custkey, c_region, c_mktsegment, d_date)
AS (
	SELECT c_custkey, c_nation, c_region, c_mktsegment, d_date, lo_revenue
	FROM cust_sales_date, auxiliar
	);

CREATE TABLE cust_sales_intercalado
interleaved sortkey (c_custkey, c_region, c_mktsegment, d_date)
AS (
	SELECT c_custkey, c_nation, c_region, c_mktsegment, d_date, lo_revenue
	FROM cust_sales_date, auxiliar
	);
	
SELECT count(0) FROM cust_sales_compuesto;
SELECT count(0) FROM cust_sales_intercalado;