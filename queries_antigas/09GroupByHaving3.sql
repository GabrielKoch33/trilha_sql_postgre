SELECT
    extract(year from order_date) as ANOS,
    count(*)
FROM orders
WHERE status != 'cancelled' and date_part('month',order_date) != 1
GROUP BY ANOS;

SELECT 
    CASE 
        WHEN total_amount < 300 THEN 'barato'
        ELSE 'caro'
    END as classificacao,
    count(*)
from orders
GROUP BY classificacao
HAVING COUNT(*) > 3;

SELECT 
    extract(MONTH from order_date) as meses,
    round(avg(total_amount),2) mediapedidos
FROM orders
WHERE extract(year from order_date) = 2023 and status != 'cancelled'
GROUP BY meses
HAVING avg(total_amount) > 500;

SELECT 
    category,
    min(price) ,
    max(price),
    round(avg(price),2) as mediarr
from products
GROUP BY category 
HAVING  (AVG(price) BETWEEN 200 AND 3000) 
AND min(price) > 80;

SELECT 
    city,
    COUNT(*)
FROM customers
WHERE extract(year from created_at) = '2023'
GROUP BY city
HAVING COUNT(*) > 1;

--6
SELECT 
    extract(MONTH from created_at) as mes,
    COUNT(*)
FROM customers
GROUP BY mes
HAVING COUNT(*) < 2
ORDER BY mes
;

SELECT 
    status,
    COUNT(*) as tot,
    round(avg(total_amount),2) as media
FROM orders
GROUP BY status
HAVING avg(total_amount) > 1000 and count(*) > 2;

SELECT 
    extract(YEAR FROM order_date) as ano,
    max(total_amount) as precomaximo
FROM orders
WHERE status != 'processing'
GROUP BY ano
HAVING max(total_amount) > 5000;

SELECT * FROM orders