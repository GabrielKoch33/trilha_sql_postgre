/*
8 e 4 não usam JOIN?
*/

--1
SELECT 
    concat(a1.first_name,' ',a1.last_name) as fullname,
    a1.city,
    a2.status,
    a2.order_date,
    a2.total_amount

FROM customers AS a1

LEFT JOIN orders as a2
ON a1.customer_id = a2.customer_id

WHERE (date_part('year', a2.order_date) = 2023) AND (status != 'cancelled')

ORDER BY a2.total_amount DESC;

--1.2
SELECT 
    concat(a1.first_name,' ',a1.last_name) as fullname,
    count(*),
    a1.city,
    sum(a2.total_amount) as tot

FROM customers AS a1

LEFT JOIN orders as a2
ON a1.customer_id = a2.customer_id

WHERE (date_part('year', a2.order_date) = 2023) AND (status != 'cancelled')
GROUP BY fullname,a1.city
ORDER BY tot DESC;
--pq tenho q usar city no group by tbm?

--2
SELECT
    a1.category,
    COUNT(*) as qtd

FROM products as a1

LEFT JOIN order_items as a2
    ON a1.product_id = a2.product_id

WHERE (a1.price > 200)

GROUP BY a1.category
HAVING count(*) > 1
ORDER BY qtd DESC
;

--3
SELECT
    a1.product_name,
    a1.category,
    a3.order_date,
    a3.total_amount
FROM products as a1

LEFT JOIN order_items as a2
    ON a1.product_id = a2.product_id

LEFT JOIN orders as a3
    ON a2.order_id = a3.order_id

WHERE (a3.total_amount BETWEEN 200 and 3000) AND
date_part('year',a3.order_date) = 2023

ORDER BY a3.total_amount DESC
;

SELECT * from orders;
SELECT * FROM products;
SELECT * FROM order_items;

--4

SELECT
    CASE
        WHEN total_amount < 300 THEN 'baixo'
        WHEN total_amount < 2500 THEN 'medio'
        ELSE 'alto'
    END AS cat,
    COUNT(*)
FROM orders
WHERE status <> 'cancelled'
GROUP BY
    CASE
        WHEN total_amount < 300 THEN 'baixo'
        WHEN total_amount < 2500 THEN 'medio'
        ELSE 'alto'
    END;

--5
SELECT 
    a1.city,
    COUNT(*),
    min(a2.total_amount),
    max(a2.total_amount),
    round(sum(a2.total_amount)/count(*),1) as media
FROM customers as a1

LEFT JOIN orders as a2
    ON a1.customer_id = a2.customer_id

WHERE date_part('year', a2.order_date) = 2023

GROUP BY a1.city
HAVING COUNT(*) > 1;

--6
SELECT 
    concat(a1.first_name,' ', a1.last_name) as nome,
    a1.customer_id,
    COUNT(*)

FROM customers as a1

LEFT JOIN orders as a2
    ON a1.customer_id = a2.customer_id

WHERE a2.status IN ('completed','shipped')

GROUP BY nome, a1.customer_id
HAVING COUNT(*) > 1;

--7(fiz algumas alterações)
SELECT 
    
    a1.product_name,
    a1.price,
    COUNT(*),
    sum(a3.total_amount) as receita

FROM products as a1

LEFT JOIN order_items as a2
ON a1.product_id = a2.product_id

LEFT JOIN orders as a3
ON a2.order_id = a3.order_id

WHERE a1.category IN ('Electronics','Games') and a1.price > 500

GROUP BY a1.product_name, a1.price
ORDER BY receita DESC;

--8
SELECT
    date_part('month',a1.order_date) as Mes_,
    Count(*)
from orders as a1

WHERE extract(year from a1.order_date) = 2023 and 
a1.status = 'completed'

group by Mes_
HAVING COUNT(*) > 1;

--9
SELECT
    a1.category,
    ROUND(avg(a3.total_amount),2) as media

from products as a1

LEFT JOIN order_items as a2
ON a1.product_id = a2.product_id

LEFT JOIN orders as a3
ON a2.order_id = a3.order_id

WHERE extract(year from a3.order_date) = 2024

GROUP BY a1.category
HAVING avg(a3.total_amount) > 1000;

--10

SELECT 
    a1.first_name,
    a2.order_date,
    CASE
    WHEN a2.order_date >= '2024-01-01' THEN 'recente'
    ELSE 'antigo'
    END AS dt
FROM customers as a1

LEFT JOIN orders as a2
ON a1.customer_id = a2.customer_id

ORDER BY dt DESC;

SELECT
    CASE 
        WHEN total_amount < 300 THEN 'baixo'
        ELSE 'alto'
    END AS faixa,
    COUNT(*)
FROM orders
GROUP BY
    CASE 
        WHEN total_amount < 300 THEN 'baixo'
        ELSE 'alto'
    END;

SELECT
    status,
    CASE 
        WHEN COUNT(*) > 10 THEN 'alto volume'
        ELSE 'baixo volume'
    END AS volume
FROM orders
GROUP BY status;
