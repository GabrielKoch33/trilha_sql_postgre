--1
SELECT city,
    concat(first_name,' ',last_name) as Nome
FROM customers
WHERE city = 'São Paulo'
ORDER BY last_name;

--2
SELECT product_name, price
FROM products
WHERE category = 'Electronics' AND price > 1000;

--3
SELECT *
FROM orders
WHERE extract( MONTH from order_date) = 2 and status IN ('completed','shipped')
ORDER BY total_amount DESC;

--4
/*Nesse caso eu teria que usar a tabela Orders devido ao total_amount
porém, esta me pedindo nome do cliente, e para isso eu precisaria usar a tabela
customer. Entretando eu n sei usar JOIN, logo n consigo fazer*/

--5
SELECT product_name
FROM products
WHERE category in ('Books','Apparel');

--6
SELECT *
FROM orders
WHERE date_part('MONTH',order_date) < 4 and date_part('year', order_date) = 2024;

--7
SELECT 
    ROUND(avg(total_amount),2) as media
FROM orders
WHERE status = 'completed';

--8
SELECT COUNT(customer_id)
FROM customers
WHERE extract(year from created_at) = 2024;

--9
SELECT *
FROM products
WHERE product_name LIKE '%Livro%'
ORDER BY product_name;

--10
SELECT 
    MAX(price)
FROM products;

--11
SELECT SUM(total_amount)
FROM orders
WHERE extract(year from order_date) = 2024;

--12
SELECT *
FROM orders
WHERE extract(month from order_date) = 12
order by order_date;

--13
SELECT *
FROM customers
WHERE (extract(day from created_at) % 2) = 1;

--14
SELECT *
FROM products
WHERE price < 5000;

--15
SELECT *
FROM orders
WHERE total_amount in (109.90, 259.90, 349.90);

--16
SELECT COUNT(DISTINCT category)
FROM products

--17
SELECT *
FROM customers
WHERE customers.last_name NOT LIKE '%s'

--18
SELECT * 
from orders
WHERE EXTRACT( DOW FROM order_date) = 0 or EXTRACT( DOW FROM order_date) = 6;

--19
SELECT 
    concat(first_name,' ',last_name) as NomeFull,
    CASE
        WHEN city = 'São Paulo' THEN 'SP_CAPITAL'
        ELSE 'Outros'
    END as Paulistas
FROM customers;

--22
SELECT *
FROM orders
WHERE (order_id::text) LIKE '%0';


--1 
SELECT *
FROM orders
WHERE order_date >= DATE_TRUNC('year', order_date)
AND order_date < DATE_TRUNC('year', order_date) + INTERVAL '60 days'
ORDER BY order_date DESC;

--2
SELECT * 
FROM products
WHERE price > 500
ORDER BY price DESC;

--3
SELECT *
FROM orders
WHERE status in ('shipped','completed') and extract(year from order_date) = 2023
order by total_amount DESC;

--4
SELECT *,
    CASE
    WHEN total_amount < 400 THEN 'baixo'
    ELSE 'alto'
    END as lowticket
FROM orders
ORDER BY total_amount;
/*nesse caso é mais profissional eu
agrupar por lowticket ou total_amount?*/

--5
SELECT *,
    CASE
    WHEN price < 500 THEN 'baixo'
    WHEN price <= 2500 THEN 'médio'
    WHEN price > 2500 THEN 'premium'
    END as categoria
FROM products
WHERE category in ('Games','Electronics')
ORDER BY price DESC;
