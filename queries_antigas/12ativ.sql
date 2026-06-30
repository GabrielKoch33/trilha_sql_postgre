--1
SELECT first_name, last_name, city, created_at
FROM customers;

--2
SELECT *
FROM orders
WHERE orders.status = 'completed';

--3
SELECT *
FROM orders
WHERE extract( YEAR FROM order_date) = 2023 and status = 'completed';
--Função EXTRACT extrai campos (year, month, day) de colunas do tipo DATE, TIMESTAMP APENAS!!
--Saída: 2023-02-dd

--4
SELECT *
FROM products
WHERE category = 'Books'

--5
SELECT first_name, last_name,
    first_name || ' ' || last_name AS full_name
FROM customers;

--6 
SELECT *
FROM orders
WHERE total_amount > 1000;

--7
SELECT *
FROM customers
WHERE city IN ('São Paulo','Rio de Janeiro');

--8
SELECT *
FROM products
WHERE (category = 'Electronics') and (price < 500);

--9
SELECT *
FROM orders
WHERE status != 'cancelled'

--10
SELECT * 
FROM products
WHERE price::text LIKE '%9';
