SELECT salesid, pricepaid, commission
FROM sales s
WHERE eventid IN (
	SELECT eventid
	FROM event e
	WHERE eventname = 'Beck'
);

CREATE table sales_auxiliar AS (
	SELECT salesid, pricepaid * 2 pricepaid , commission * 2 commission 
	FROM sales s
	WHERE eventid IN (
		SELECT eventid
		FROM event e
		WHERE eventname = 'Beck'
	)
);

UPDATE sales
SET pricepaid =sa.pricepaid
FROM sales_auxiliar sa
WHERE sales.salesid = sa.salesid;

DELETE FROM sales
USING sales_auxiliar
WHERE sales.salesid = sales_auxiliar.salesid;


DROP TABLE sales_auxiliar;

CREATE table sales_auxiliar AS (
	SELECT *
	FROM sales s
	WHERE eventid IN (
		SELECT eventid
		FROM event e
		WHERE eventname = 'Macbeth'
	)
);

INSERT INTO sales (SELECT * FROM sales_auxiliar);