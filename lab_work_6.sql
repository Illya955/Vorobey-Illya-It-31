PRAGMA foreign_keys = ON;

 Завдання 1
UPDATE sales
SET sale_date = '2026-09-23'
WHERE id = 11;

Завдання 2
UPDATE cars
SET price = 730000
WHERE id = 1;

 Завдання 3
SELECT COUNT(*) AS sales_before
FROM sales;

DELETE FROM sales
WHERE id = 11;

SELECT COUNT(*) AS sales_after
FROM sales;

Завдання 4
SELECT *
FROM sales
WHERE customer_id = 1;

DELETE FROM customers
WHERE id = 1;

SELECT *
FROM sales
WHERE customer_id IS NULL;

Перевірка ON DELETE RESTRICT
SELECT *
FROM sales
WHERE car_id = 1;
