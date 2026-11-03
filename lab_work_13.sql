
-- Практична робота №13
-- Варіант 5. Автосалон


-- Завдання 1.

SELECT
    id,
    sale_price AS raw_price,
    printf('%.2f грн', sale_price) AS formatted_price
FROM sales;

-- Результат:
-- 1  | 720000.0 | 720000.00 грн
-- 2  | 650000.0 | 650000.00 грн
-- 3  | 780000.0 | 780000.00 грн
-- 4  | 580000.0 | 580000.00 грн
-- 5  | 950000.0 | 950000.00 грн
-- 6  | 490000.0 | 490000.00 грн
-- 7  | 715000.0 | 715000.00 грн
-- 8  | 775000.0 | 775000.00 грн
-- 9  | 575000.0 | 575000.00 грн
-- 10 | 940000.0 | 940000.00 грн


-- Завдання 2. 

SELECT
    id,
    sale_price,
    printf('%12.2f грн', sale_price) AS aligned_price
FROM sales;

-- Результат: усі ціни виведені з вирівнюванням.


-- Завдання 3. 

SELECT
    id,
    sale_date,
    date(sale_date, '+30 days') AS date_after_30_days
FROM sales;

-- Результат:
-- 1  | 2026-08-01 | 2026-08-31
-- 2  | 2026-08-03 | 2026-09-02
-- 3  | 2026-08-05 | 2026-09-04
-- 4  | 2026-08-07 | 2026-09-06
-- 5  | 2026-08-10 | 2026-09-09
-- 6  | 2026-08-12 | 2026-09-11
-- 7  | 2026-08-15 | 2026-09-14
-- 8  | 2026-08-18 | 2026-09-17
-- 9  | 2026-08-20 | 2026-09-19
-- 10 | 2026-08-22 | 2026-09-21


-- Завдання 4. 

SELECT
    strftime('%Y', sale_date) AS sale_year,
    COUNT(*) AS sales_count
FROM sales
GROUP BY sale_year
ORDER BY sale_year;

-- Результат:
-- 2026 | 10



-- Завдання 5. 

SELECT
    'not-a-date' AS invalid_date,
    strftime('%Y', 'not-a-date') AS extracted_year,
    date('not-a-date') AS converted_date;

-- Результат:
-- invalid_date = not-a-date
-- extracted_year = NULL
-- converted_date = NULL


-- Додаткова перевірка результату через COALESCE

SELECT
    'not-a-date' AS invalid_date,
    COALESCE(strftime('%Y', 'not-a-date'), 'NULL') AS extracted_year,
    COALESCE(date('not-a-date'), 'NULL') AS converted_date;

-- Результат:
-- not-a-date | NULL | NULL
