Завдання 1
SELECT car_id, COUNT(*) AS sales_count
FROM sales
GROUP BY car_id;


Завдання 2
SELECT cars.brand, cars.model, COUNT(sales.id) AS sales_count
FROM cars
LEFT JOIN sales ON sales.car_id = cars.id
GROUP BY cars.id;


Завдання 3
SELECT cars.brand,
       cars.model,
       COUNT(sales.id) AS sales_count,
       AVG(sales.sale_price) AS average_sale_price
FROM cars
LEFT JOIN sales ON sales.car_id = cars.id
GROUP BY cars.id;


Завдання 4
SELECT cars.status,
       strftime('%Y-%m', sales.sale_date) AS sale_month,
       COUNT(*) AS sales_count
FROM sales
JOIN cars ON cars.id = sales.car_id
GROUP BY cars.status, sale_month
ORDER BY cars.status, sale_month;


Завдання 5
SELECT car_id, sale_price, COUNT(*) AS sales_count
FROM sales
GROUP BY car_id;
