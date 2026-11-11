
-- =====================================
-- ЗАВДАННЯ 1. Підрахунок до імпорту
-- =====================================

SELECT COUNT(*) AS total_before, MAX(id) AS max_id
FROM cars;
-- Результат: 14 | 14

-- =====================================
-- ЗАВДАННЯ 2. Створення проміжної таблиці
-- =====================================

CREATE TABLE cars_staging (
    brand TEXT,
    model TEXT,
    year INTEGER,
    price REAL,
    status TEXT
);

-- Імпорт CSV виконувався через DB Browser:
-- File -> Import -> Table from CSV file
-- File: v5_raw_rows.csv
-- Table: cars_staging
-- Column names in first line: увімкнено
-- Field separator: ;
-- Encoding: UTF-8

-- =====================================
-- ЗАВДАННЯ 3. Перевірка якості
-- =====================================

-- Кількість рядків
SELECT COUNT(*) FROM cars_staging;
-- Результат: 10

-- Перевірка порожніх рядків
SELECT
    SUM(brand = '') AS brand_empty,
    SUM(model = '') AS model_empty,
    SUM(year = '') AS year_empty,
    SUM(price = '') AS price_empty,
    SUM(status = '') AS status_empty
FROM cars_staging;

-- Перевірка NULL
SELECT brand, model, price, typeof(price)
FROM cars_staging
WHERE price IS NULL;
-- Volvo XC60
-- Mercedes-Benz E 200

-- Перевірка типів року
SELECT typeof(year), COUNT(*)
FROM cars_staging
GROUP BY typeof(year);

-- Перевірка типів ціни
SELECT typeof(price), COUNT(*)
FROM cars_staging
GROUP BY typeof(price);
-- NULL: 2
-- REAL: 8

-- Пошук дублікатів
SELECT brand, model, year, price, status, COUNT(*) AS cnt
FROM cars_staging
GROUP BY brand, model, year, price, status
HAVING COUNT(*) > 1;
-- Nissan Qashqai: 2

-- Перевірка структури основної таблиці
PRAGMA table_info(cars);

-- =====================================
-- ЗАВДАННЯ 4. Перенесення даних
-- =====================================

INSERT INTO cars (brand, model, year, price, status)
SELECT DISTINCT
    brand,
    model,
    NULLIF(year, ''),
    NULLIF(price, ''),
    status
FROM cars_staging;

-- Перевірка після перенесення
SELECT COUNT(*) AS total_after, MAX(id) AS max_id
FROM cars;
-- Результат: 23 | 23
-- Додано 9 записів

-- Перевірка нових автомобілів
SELECT id, brand, model, year, price, status
FROM cars
WHERE id > 14
ORDER BY id;

-- Перевірка порожніх цін
SELECT id, brand, model, price
FROM cars
WHERE id > 14 AND price IS NULL;
-- ID 17: Volvo XC60
-- ID 19: Mercedes-Benz E 200

-- Видалення проміжної таблиці
DROP TABLE cars_staging;

-- =====================================
-- ЗАВДАННЯ 5. Експорт у CSV
-- =====================================

-- Експорт результату запиту виконується
-- через DB Browser або SQLite CLI.

SELECT id, brand, model, year, price, status
FROM cars
WHERE id > 14
ORDER BY id;

-- Для SQLite CLI:
-- .headers on
-- .mode csv
-- .output lab_work_17_export.csv
-- SELECT id, brand, model, year, price, status
-- FROM cars WHERE id > 14 ORDER BY id;
-- .output stdout
