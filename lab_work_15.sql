
SELECT name, tbl_name
FROM sqlite_master
WHERE type = 'index';


-- ЗАВДАННЯ 1

EXPLAIN QUERY PLAN
SELECT *
FROM sales
WHERE customer_id = 1;


-- ЗАВДАННЯ 2

CREATE INDEX idx_sales_customer
ON sales(customer_id);

EXPLAIN QUERY PLAN
SELECT *
FROM sales
WHERE customer_id = 1;

-- ЗАВДАННЯ 3

EXPLAIN QUERY PLAN
SELECT *
FROM sales
WHERE customer_id = 1
AND car_id = 2;

CREATE INDEX idx_sales_customer_car
ON sales(customer_id, car_id);

EXPLAIN QUERY PLAN
SELECT *
FROM sales
WHERE customer_id = 1
AND car_id = 2;


-- ЗАВДАННЯ 4

EXPLAIN QUERY PLAN
SELECT *
FROM sales
ORDER BY sale_date;

CREATE INDEX idx_sales_date
ON sales(sale_date);

EXPLAIN QUERY PLAN
SELECT *
FROM sales
ORDER BY sale_date;


-- ЗАВДАННЯ 5

DROP INDEX idx_sales_customer;

EXPLAIN QUERY PLAN
SELECT *
FROM sales
WHERE customer_id = 1;

SELECT name, tbl_name
FROM sqlite_master
WHERE type = 'index';
