PRAGMA foreign_keys = ON;

Завдання 1

SELECT
    COUNT(*) AS усі_продажі,
    COUNT(sale_date) AS продажі_з_датою
FROM sales;

SELECT
    COUNT(*) AS усі_рядки,
    COUNT(sale_date) AS рядки_з_датою,
    COUNT(*) - COUNT(sale_date) AS рядки_з_NULL
FROM sales;


Завдання 2

SELECT
    SUM(sale_price) AS загальна_сума_продажів,
    AVG(sale_price) AS середня_ціна_продажу
FROM sales;


Завдання 3

SELECT
    MIN(sale_date) AS найраніша_дата_продажу,
    MAX(sale_date) AS найпізніша_дата_продажу
FROM sales;


Завдання 4

SELECT
    COUNT(*) AS кількість_продажів,
    SUM(sale_price) AS загальна_сума_продажів,
    AVG(sale_price) AS середня_ціна_продажу,
    MIN(sale_price) AS мінімальна_ціна_продажу,
    MAX(sale_price) AS максимальна_ціна_продажу
FROM sales;


Завдання 5

SELECT
    COUNT(*) AS кількість_продажів,
    SUM(sales.sale_price) AS сума_продажів,
    AVG(sales.sale_price) AS середня_ціна_продажу
FROM sales
INNER JOIN cars
    ON sales.car_id = cars.id
WHERE cars.brand = 'Toyota';
