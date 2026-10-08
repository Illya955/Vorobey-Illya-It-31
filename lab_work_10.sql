
Завдання 1. HAVING на COUNT

SELECT car_id, COUNT(*) AS sales_count
FROM sales
GROUP BY car_id
HAVING COUNT(*) > 1;


Завдання 2. HAVING на AVG

SELECT car_id,
       AVG(sale_price) AS average_sale_price
FROM sales
GROUP BY car_id
HAVING AVG(sale_price) > 700000;


Завдання 3. WHERE + GROUP BY + HAVING

SELECT car_id,
       COUNT(*) AS sales_count,
       AVG(sale_price) AS average_sale_price
FROM sales
WHERE sale_price >= 600000
GROUP BY car_id
HAVING COUNT(*) >= 2;


Завдання 4. Свідома помилка WHERE з агрегатом

SELECT car_id, COUNT(*) AS sales_count
FROM sales
WHERE COUNT(*) > 1
GROUP BY car_id;



Завдання 5. LEFT JOIN + GROUP BY + HAVING


SELECT cars.id,
       cars.brand,
       cars.model,
       COUNT(sales.id) AS sales_count
FROM cars
LEFT JOIN sales ON sales.car_id = cars.id
GROUP BY cars.id
HAVING COUNT(sales.id) < 2
ORDER BY cars.id;
