
-- Практична робота №12
-- Варіант 5. Автосалон

-- Завдання 1. 

SELECT id, car_id, sale_date, sale_price
FROM sales
ORDER BY sale_price DESC;

-- Результат:
-- 5  | 5 | 2026-08-10 | 950000
-- 10 | 5 | 2026-08-22 | 940000
-- 3  | 3 | 2026-08-05 | 780000
-- 8  | 3 | 2026-08-18 | 775000
-- 1  | 1 | 2026-08-01 | 720000
-- 7  | 1 | 2026-08-15 | 715000
-- 2  | 2 | 2026-08-03 | 650000
-- 4  | 4 | 2026-08-07 | 580000
-- 9  | 4 | 2026-08-20 | 575000
-- 6  | 6 | 2026-08-12 | 490000


-- Завдання 2. 

SELECT id, brand, model, status, price
FROM cars
ORDER BY status ASC, price DESC;

-- Результат:
-- Skoda Octavia      | в наявності  | 780000
-- Toyota Corolla     | в наявності  | 730000
-- Renault Duster     | в наявності  | 580000
-- Hyundai Tucson     | зарезервовано| 950000
-- Volkswagen Golf    | продано      | 650000
-- Ford Focus         | продано      | 490000



-- Завдання 3. 

SELECT id, car_id, sale_date, sale_price
FROM sales
ORDER BY sale_price DESC
LIMIT 3;

-- Результат:
-- 5  | 5 | 2026-08-10 | 950000
-- 10 | 5 | 2026-08-22 | 940000
-- 3  | 3 | 2026-08-05 | 780000



-- Завдання 4а. 

SELECT DISTINCT status
FROM cars;

-- Результат: 3 унікальні статуси
-- в наявності
-- продано
-- зарезервовано



-- Завдання 4б. 

SELECT brand, model, year
FROM cars
WHERE year BETWEEN 2020 AND 2023
ORDER BY year ASC;


-- Завдання 5. 

SELECT id, brand, model, status
FROM cars
WHERE status LIKE 'в%';

-- Результат: 3 записи


-- Пошук із великої кириличної літери "В"

SELECT id, brand, model, status
FROM cars
WHERE status LIKE 'В%';

-- Результат: 0 записів


-- Порівняння кількості результатів

SELECT
    COUNT(CASE WHEN status LIKE 'в%' THEN 1 END)
        AS lowercase_count,
    COUNT(CASE WHEN status LIKE 'В%' THEN 1 END)
        AS uppercase_count
FROM cars;

-- Очікуваний результат:
-- lowercase_count = 3
-- uppercase_count = 0
