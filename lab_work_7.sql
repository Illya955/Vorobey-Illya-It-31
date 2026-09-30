PRAGMA foreign_keys = ON;


Завдання 1
SELECT
    cars.brand AS марка,
    cars.model AS модель,
    cars.year AS рік,
    sales.sale_date AS дата_продажу,
    sales.sale_price AS ціна_продажу
FROM sales
INNER JOIN cars
    ON sales.car_id = cars.id
ORDER BY sales.sale_date;


Завдання 2
SELECT
    cars.brand AS марка,
    cars.model AS модель,
    customers.name AS клієнт,
    customers.city AS місто,
    sales.sale_date AS дата_продажу,
    sales.sale_price AS ціна_продажу
FROM sales
INNER JOIN cars
    ON sales.car_id = cars.id
INNER JOIN customers
    ON sales.customer_id = customers.id
ORDER BY sales.sale_date;


Завдання 3
SELECT
    cars.brand AS марка,
    cars.model AS модель,
    cars.year AS рік,
    cars.price AS ціна,
    cars.status AS статус
FROM cars
LEFT JOIN sales
    ON sales.car_id = cars.id
WHERE sales.id IS NULL
ORDER BY cars.brand, cars.model;



Завдання 4
SELECT COUNT(*) AS кількість_автомобілів
FROM cars;

SELECT COUNT(*) AS кількість_клієнтів
FROM customers;

SELECT COUNT(*) AS кількість_комбінацій
FROM cars, customers