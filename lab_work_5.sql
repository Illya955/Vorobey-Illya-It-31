
PRAGMA foreign_keys = OFF;


task1

ALTER TABLE customers RENAME TO customers_old;

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT NOT NULL,
    city TEXT NOT NULL
);

INSERT INTO customers (id, name, phone, city)
SELECT id, name, phone, city
FROM customers_old;

DROP TABLE customers_old;

PRAGMA foreign_keys = ON;


INSERT INTO customers (name, phone)
VALUES ('�������� �볺��', '+380679999999');


task2

PRAGMA foreign_keys = OFF;

ALTER TABLE customers RENAME TO customers_old;

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT NOT NULL UNIQUE,
    city TEXT NOT NULL
);

INSERT INTO customers (id, name, phone, city)
SELECT id, name, phone, city
FROM customers_old;

DROP TABLE customers_old;

PRAGMA foreign_keys = ON;



INSERT INTO customers (name, phone, city)
VALUES ('����� ��������', '+380671112233', '���');


task3 

PRAGMA foreign_keys = OFF;

ALTER TABLE cars RENAME TO cars_old;

CREATE TABLE cars (
    id INTEGER PRIMARY KEY,
    brand TEXT NOT NULL,
    model TEXT NOT NULL,
    year INTEGER,
    price REAL CHECK (price > 0),
    status TEXT NOT NULL DEFAULT '� ��������'
);

INSERT INTO cars (id, brand, model, year, price, status)
SELECT id, brand, model, year, price, status
FROM cars_old;

DROP TABLE cars_old;

PRAGMA foreign_keys = ON;


INSERT INTO cars (brand, model, year, price, status)
VALUES ('Test', 'Negative', 2026, -1000, '� ��������');


INSERT INTO cars (brand, model, year, price, status)
VALUES ('Test', 'Valid', 2026, 500000, '� ��������');

DELETE FROM cars
WHERE brand = 'Test';

task4 

PRAGMA foreign_keys = OFF;

ALTER TABLE sales RENAME TO sales_old;

CREATE TABLE sales (
    id INTEGER PRIMARY KEY,
    car_id INTEGER NOT NULL,
    customer_id INTEGER,
    sale_date TEXT NOT NULL DEFAULT (date('now')),
    sale_price REAL NOT NULL,
    FOREIGN KEY (car_id) REFERENCES cars(id) ON DELETE RESTRICT,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL
);

INSERT INTO sales (id, car_id, customer_id, sale_date, sale_price)
SELECT id, car_id, customer_id, sale_date, sale_price
FROM sales_old;

DROP TABLE sales_old;

PRAGMA foreign_keys = ON;


INSERT INTO sales (car_id, customer_id, sale_price)
VALUES (1, 1, 710000);

SELECT id, car_id, customer_id, sale_date, sale_price
FROM sales
WHERE id = (SELECT MAX(id) FROM sales);

task5 

UPDATE customers
SET city = NULL
WHERE id = 1;



SELECT name
FROM sqlite_master
WHERE type = 'table'
ORDER BY name;

SELECT COUNT(*) AS cars_count FROM cars;
SELECT COUNT(*) AS customers_count FROM customers;
SELECT COUNT(*) AS sales_count FROM sales;