

-- ЗАВДАННЯ 1

BEGIN TRANSACTION;

INSERT INTO sales (car_id, customer_id, sale_date, sale_price)
VALUES (1, 1, '2026-11-10', 850000);

UPDATE cars
SET status = 'продано'
WHERE id = 1;

COMMIT;

SELECT * FROM sales WHERE car_id = 1;

SELECT * FROM cars WHERE id = 1;


-- ЗАВДАННЯ 2

BEGIN TRANSACTION;

UPDATE cars
SET status = 'на перевірці'
WHERE id = 2;

ROLLBACK;

SELECT * FROM cars WHERE id = 2;


-- ЗАВДАННЯ 3

BEGIN TRANSACTION;

UPDATE cars
SET status = 'резерв'
WHERE id = 3;

SELECT * FROM cars WHERE id = 3;

ROLLBACK;


-- ЗАВДАННЯ 4

BEGIN TRANSACTION;

UPDATE cars
SET status = 'тестова зміна'
WHERE id = 4;

-- Тут використати вже наявний телефон
INSERT INTO customers (name, phone, city)
VALUES ('Тестовий клієнт', '0501234567', 'Київ');

SELECT * FROM cars WHERE id = 4;

ROLLBACK;


-- ЗАВДАННЯ 5

BEGIN TRANSACTION;

UPDATE cars
SET status = 'тестова зміна'
WHERE id = 5;

-- Тут використати вже наявний телефон
INSERT INTO customers (name, phone, city)
VALUES ('Ще один тест', '0501234567', 'Київ');

COMMIT;

SELECT * FROM cars WHERE id = 5;

SELECT * FROM customers
WHERE name = 'Ще один тест';

