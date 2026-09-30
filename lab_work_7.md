Воробей Ілля IT-31
Практика 7.
Варіант 5 — Car dealership

Завдання 1

Для об'єднання таблиць sales і cars використано INNER JOIN:

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


Запит повернув 10 рядків. Замість car_id у результаті показуються реальні дані автомобіля: марка, модель та рік.

Завдання 2

До попереднього запиту додано таблицю customers:

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


Запит повернув 10 рядків. Результат містить інформацію про автомобіль, клієнта, місто, дату продажу та ціну продажу без використання ID у результаті.

Завдання 3

Спочатку запит із LEFT JOIN не повернув жодного рядка, оскільки кожен автомобіль уже мав пов'язаний запис у таблиці sales.

Для виконання умови завдання було додано новий автомобіль:

INSERT INTO cars
    (brand, model, year, price, status)
VALUES
    ('Mazda', 'CX-5', 2025, 890000, 'в наявності');


Для нового автомобіля ще немає запису в таблиці sales.

Після цього запит:

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


повернув 1 рядок — автомобіль Mazda CX-5.

LEFT JOIN використано тому, що потрібно зберегти всі записи з таблиці cars, навіть якщо для них немає відповідного запису в sales. Умова WHERE sales.id IS NULL залишає тільки автомобілі без продажів.

Завдання 4

Для перевірки декартового добутку виконано:

SELECT COUNT(*)
FROM cars;

SELECT COUNT(*)
FROM customers;

SELECT COUNT(*)
FROM cars, customers;


Результат FROM cars, customers є добутком кількості рядків двох таблиць.

Якщо cars містить 7 рядків, а customers — N рядків, то CROSS JOIN повертає:

7 × N

рядків.

Причина полягає в тому, що кожен автомобіль поєднується з кожним клієнтом. Це декартів добуток, а не сума кількості рядків.

У реальному звіті такий запит найчастіше є помилкою, оскільки він створює комбінації автомобілів і клієнтів, які не обов'язково відповідають реальним продажам.

Завдання 5. Обґрунтування вибору JOIN

Завдання 1: використано INNER JOIN, тому що потрібно показати тільки продажі, для яких існує відповідний автомобіль у таблиці cars.

Завдання 2: використано два INNER JOIN, тому що потрібно отримати тільки ті продажі, для яких існують відповідні автомобіль і клієнт.

Завдання 3: використано LEFT JOIN, тому що потрібно знайти автомобілі, для яких немає пов'язаного продажу; INNER JOIN такі автомобілі не показав би.

Контрольні питання
1.Умова з'єднання, наприклад sales.car_id = cars.id, не є істинною для NULL, тому рядок не має відповідної пари та не потрапляє до результату INNER JOIN.

У LEFT JOIN рядок лівої таблиці зберігається, а значення правої таблиці для відсутньої пари будуть NULL.

2.LEFT JOIN збереже рядки лівої частини результату навіть тоді, коли відповідного запису в приєднаній таблиці немає. У такому випадку поля приєднаної таблиці матимуть значення NULL.

3.Для внутрішнього з'єднання запити

FROM cars, customers
WHERE cars.id = customers.car_id


та

FROM cars
JOIN customers
    ON cars.id = customers.car_id


можуть мати однаковий результат.