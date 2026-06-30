/*
Supondo que fosse um banco de dados real; existe na tabela order_items a coluna quantity, no caso todos os valores dela são 1, mas supondo que
esses valores fossem variados, a forma correta de eu definir o valor de um pedido de cliente
ou montante gerado por x produto seria multiplicar essa quantidade*preço para saber o total exato
do pedido y do cliente z. isso? 
*/
--1 
SELECT 
    c1.city,
    COUNT(o1.order_id) as totpedidos,
    CASE
        WHEN COUNT(*) > 1 THEN 'alto ticket'
        ELSE 'baixo ticket'
    END AS ticket
FROM customers as c1

LEFT JOIN orders AS o1
    ON c1.customer_id = o1.customer_id

WHERE status <> 'cancelled'

GROUP BY c1.city
HAVING COUNT(o1.order_id) > 1;
;

--2
SELECT 
    a1.category,
    CASE
        WHEN count(DISTINCT extract(year from a3.order_date)) >= 2 
        THEN 'ALTO IMPACTO'
        ELSE 'BAIXO IMPACTO'
    END as impacto,
    MAX(a3.total_amount) as maior_valor

FROM products as a1

LEFT JOIN order_items as a2
    ON a1.product_id = a2.product_id

LEFT JOIN orders as a3
    ON a2.order_id = a3.order_id
    
WHERE extract(year from a3.order_date) IN (2023,2024)
GROUP BY a1.category
HAVING COUNT(DISTINCT extract(YEAR from a3.order_date)) >= 2;

--3

SELECT
    CONCAT(a1.first_name, ' ', a1.last_name) AS nome,
    COUNT(a2.order_id) AS qtd_pedidos,
    SUM(a2.total_amount) AS total_gasto,
    CASE
        WHEN COUNT(a2.order_id) > 1 THEN 'RECORRENTE'
        ELSE 'OCASIONAL'
    END AS cl
FROM customers AS a1
LEFT JOIN orders AS a2
    ON a2.customer_id = a1.customer_id
    AND a2.status IN ('completed','shipped')
GROUP BY nome
ORDER BY total_gasto DESC;

-- 4
SELECT
    EXTRACT(MONTH FROM a1.order_date) AS mes,
    CASE 
        WHEN COUNT(*) > 2 THEN 'forte'
        ELSE 'fraco'
    END AS volume,
    ROUND(AVG(a1.total_amount), 2) AS media
FROM orders AS a1
GROUP BY mes
HAVING COUNT(*) > 2;


--5--v
SELECT
    status,
    COUNT(*),
    CASE WHEN COUNT(*) > 3 THEN 'Alto Volume' ELSE 'Baixo Volume' END as classificacao,
    min(total_amount)

FROM orders
WHERE total_amount > 100
GROUP BY status;

--6
SELECT
    a2.product_name,
    COUNT(*),
    round(avg(a3.total_amount),2),
    CASE 
        WHEN count(*) >= 2 then 'alto giro'
        else 'baixo giro'
    END AS classi

from order_items as a1

LEFT JOIN products as a2
    ON a1.product_id = a2.product_id

LEFT JOIN orders as a3
    ON a1.order_id = a3.order_id

WHERE a3.total_amount > 100

GROUP BY a2.product_name;

--7
--pulei o 7

--8
SELECT
    a2.first_name,
    COUNT(DISTINCT EXTRACT(YEAR FROM a1.order_date)) AS anos_distintos,
    CASE
        WHEN COUNT(DISTINCT EXTRACT(YEAR FROM a1.order_date)) > 1 
        THEN 'recorrente'
        ELSE 'concentrado'
    END AS classificacao
FROM orders AS a1
LEFT JOIN customers AS a2
    ON a1.customer_id = a2.customer_id
WHERE EXTRACT(YEAR FROM a1.order_date) IN (2023, 2024)
GROUP BY a2.first_name;
;

--9
SELECT
    a1.category,
    round(avg(a1.price*a2.quantity),2),
    CASE
        WHEN AVG(a1.price*a2.quantity) >= 700 THEN 'PREMIUM'
        WHEN AVG(a1.price*a2.quantity) <= 500 THEN 'POPULAR'
        ELSE 'Intermediário'
    END

FROM products as a1

LEFT JOIN order_items as a2
    ON a1.product_id = a2.product_id

LEFT JOIN orders as a3
    ON a2.order_id = a3.order_id

GROUP BY a1.category


;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT
 *

FROM products as a1

LEFT JOIN order_items as a2
    ON a1.product_id = a2.product_id

LEFT JOIN orders as a3
    ON a2.order_id = a3.order_id
