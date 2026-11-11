
-- ЗАВДАННЯ 1. Підрахунок до імпорту
SELECT COUNT(*) AS total_before FROM cars;
-- Результат: 6

-- ЗАВДАННЯ 2. Створення проміжної таблиці
CREATE TABLE cars_staging (
    brand TEXT,
    model TEXT,
    year INTEGER,
    price REAL,
    status TEXT
);

-- Імпорт CSV виконується окремо:
-- .mode csv
-- .import --skip 1 v5_new_rows.csv cars_staging

-- Перевірка проміжної таблиці
SELECT * FROM cars_staging;
-- Очікувано: 8 записів

-- ЗАВДАННЯ 3. Перенесення в основну таблицю
INSERT INTO cars (brand, model, year, price, status)
SELECT brand, model, year, price, status
FROM cars_staging;

-- Видалення проміжної таблиці
DROP TABLE cars_staging;

-- Підрахунок після імпорту
SELECT COUNT(*) AS total_after FROM cars;
-- Результат: 14
-- Приріст: 14 - 6 = 8

-- ЗАВДАННЯ 4. Перевірка нових автомобілів
SELECT id, brand, model, year, price, status
FROM cars
WHERE brand IN (
    'Toyota',
    'Skoda',
    'Volkswagen',
    'Renault',
    'Hyundai',
    'Kia',
    'Ford',
    'Mazda'
)
ORDER BY id;

-- Очікувані ID нових записів: 7-14

-- ЗАВДАННЯ 5. Пряма спроба імпорту
-- Виконувалася на тестовій копії бази.
-- Команди CLI:
-- .mode csv
-- .import --skip 1 v5_new_rows.csv cars
-- У DB Browser команда .mode csv викликає
-- синтаксичну помилку, оскільки це команда CLI,
-- а не SQL.
