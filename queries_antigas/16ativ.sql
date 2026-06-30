
--1
SELECT 
    date_part('year', order_date) as ANO,
    COUNT(*)
from orders
WHERE status in ('completed','shipped')
GROUP BY ANO
HAVING COUNT(*) > 2;

--2
SELECT 
    category,
    COUNT(*) as qtde
from products
GROUP BY category
HAVING COUNT(*) > 1
ORDER BY qtde desc;

--3
SELECT 
    date_part('month', created_at) as Meses,
    COUNT(*)
FROM customers
WHERE extract(year from created_at) = 2023
GROUP BY Meses
HAVING COUNT(*) >= 2
;
--4 
SELECT
    status,
    round(avg(total_amount),2)
FROM orders
GROUP BY status
HAVING avg(total_amount) > 1000;

--5
SELECT 
    category,
    MIN(price),
    max(price),
    round(avg(price),2)
    --COUNT(*)
FROM products
GROUP BY category
HAVING avg(price) BETWEEN 200 and 3000;
--BETWEEN funciona como >= e <=
SELECT * FROM products;

--6
SELECT  
    date_part('month',order_date) as Mes23,
    COUNT(*)
-- avg(total_amount)
FROM orders
WHERE extract(year from order_date) = 2023
GROUP BY Mes23
HAVING avg(total_amount) > 500;

--7
SELECT 
    city,
    COUNT(*)    
FROM customers
GROUP BY city
HAVING COUNT(*) >= 2 
ORDER BY COUNT(*) DESC;

--8
SELECT
    status,
    COUNT(*) as qtd
FROM orders
GROUP BY status
HAVING COUNT(*) > 1;

--9
SELECT
    extract(YEAR from order_date) as ANO,
    min(total_amount) as minimo,
    max(total_amount) as maximo,
    ROUND(avg(total_amount)) as media
FROM orders
GROUP BY ANO
HAVING avg(total_amount) >= 1000;

--10
SELECT
    category,
    min(price),
    COUNT(*)
FROM products
GROUP BY category
HAVING min(price) > 100;

--11
SELECT
    extract(MONTH from created_at) as MesesALLYEARS,
    count(*)
FROM customers
GROUP BY MesesALLYEARS
HAVING COUNT(*) < 3
ORDER BY MesesALLYEARS;