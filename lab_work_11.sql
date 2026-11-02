
-- Практична робота №11
-- Ілля Воробей, група IT-31
-- Варіант 5: Автосалон

-- Створення таблиці
CREATE TABLE IF NOT EXISTS test_drives (
    id INTEGER PRIMARY KEY,
    car_id INTEGER NOT NULL REFERENCES cars(id),
    customer_id INTEGER NOT NULL REFERENCES customers(id),
    drive_date TEXT NOT NULL,
    duration INTEGER NOT NULL CHECK(duration > 0),
    result TEXT NOT NULL,
    rating INTEGER CHECK(rating BETWEEN 1 AND 5)
);

-- Заповнення таблиці
INSERT INTO test_drives
(car_id, customer_id, drive_date, duration, result, rating)
VALUES
(1, 1, '2026-09-10', 30, 'успішно', 5),
(1, 2, '2026-09-12', 25, 'успішно', 4),
(1, 3, '2026-09-15', 40, 'успішно', 5),
(2, 1, '2026-09-18', 30, 'успішно', 4),
(2, 2, '2026-09-20', 20, 'відмова', 3),
(3, 1, '2026-09-22', 35, 'успішно', 5),
(3, 3, '2026-09-25', 30, 'успішно', 4),
(4, 2, '2026-09-28', 45, 'успішно', 5);

-- JOIN + GROUP BY
SELECT cars.id, cars.brand, cars.model,
COUNT(DISTINCT test_drives.customer_id) AS customers_count
FROM cars
JOIN test_drives ON cars.id = test_drives.car_id
GROUP BY cars.id;

--HAVING
SELECT cars.id, cars.brand, cars.model,
COUNT(DISTINCT test_drives.customer_id) AS customers_count
FROM cars
JOIN test_drives ON cars.id = test_drives.car_id
GROUP BY cars.id
HAVING COUNT(DISTINCT test_drives.customer_id) > 1;

-- WHERE + JOIN + GROUP BY + HAVING
SELECT cars.id, cars.brand, cars.model,
COUNT(DISTINCT test_drives.customer_id) AS customers_count
FROM cars
JOIN test_drives ON cars.id = test_drives.car_id
WHERE test_drives.drive_date >= '2026-09-15'
GROUP BY cars.id
HAVING COUNT(DISTINCT test_drives.customer_id) > 1;

-- Додавання клієнта-двійника
INSERT INTO customers (name, phone, city)
VALUES ('Олена Коваленко', '+380991112233', 'Київ');

-- Додавання тест-драйвів двійнику (ID 7)
INSERT INTO test_drives
(car_id, customer_id, drive_date, duration, result, rating)
VALUES
(1, 7, '2026-09-29', 30, 'успішно', 5),
(2, 7, '2026-09-30', 35, 'успішно', 4);

-- Групування за ID
SELECT customers.id, customers.name,
COUNT(test_drives.id) AS drives_count
FROM customers
JOIN test_drives ON customers.id = test_drives.customer_id
GROUP BY customers.id;

-- Групування за іменем
SELECT customers.name,
COUNT(test_drives.id) AS drives_count
FROM customers
JOIN test_drives ON customers.id = test_drives.customer_id
GROUP BY customers.name;

-- LEFT JOIN
SELECT cars.id, cars.brand, cars.model,
COUNT(DISTINCT test_drives.customer_id) AS customers_count
FROM cars
LEFT JOIN test_drives ON cars.id = test_drives.car_id
WHERE test_drives.drive_date >= '2026-09-15'
GROUP BY cars.id
HAVING COUNT(DISTINCT test_drives.customer_id) > 1;
