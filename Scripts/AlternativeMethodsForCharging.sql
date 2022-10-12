SELECT * FROM estudiante;

INSERT INTO estudiante VALUES
(5, 'Brandon', 'Huertas', 24, '2020-01-01'),
(6, 'Cristian', 'Salas', 30, '2020-03-01'),
(7, 'Holman', 'Capos', 25, '2020-02-01'),
(8, 'Natalia', 'Montenegro', 25, '2020-04-01');

-- bulk insert, datos por lotes
SELECT e.eventname, e.starttime, sum(pricepaid) pricepaid, sum(commission) commission 
FROM sales s 
INNER JOIN event e
ON s.eventid = e.eventid 
GROUP BY e.eventname , e.starttime;

CREATE TABLE total_price_by_event AS (
SELECT e.eventname, e.starttime, sum(pricepaid) pricepaid, sum(commission) commission 
FROM sales s 
INNER JOIN event e
ON s.eventid = e.eventid 
GROUP BY e.eventname , e.starttime
);

SELECT * FROM total_price_by_event;

-- deep copy
CREATE TABLE likesales (like sales);
INSERT INTO likesales (SELECT * FROM sales);
DROP TABLE sales;
ALTER TABLE likesales RENAME TO sales;

SELECT * FROM sales;