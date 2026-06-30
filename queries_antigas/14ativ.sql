
--Bônus: 1
SELECT
    COUNT(order_id),
    sum(total_amount),
    round(avg(total_amount),2)
FROM orders
WHERE status <> 'cancelled' and extract(YEAR from order_date) = 2024
;

--1
SELECT * 
from orders
WHERE date_part('year',order_date) = '2023'
ORDER BY total_amount;

--2
/*Exibir o total de pedidos por status, 
filtrando apenas status que tenham mais de 1 pedido.
*/
-- SELECT 
--     COUNT(CASE
--     WHEN status = 'completed' THEN status    
--     END) as contCOMP,
--     COUNT(CASE
--     WHEN status = 'processing' THEN status
--     END) AS contPROC,
--     COUNT(CASE
--     WHEN status = 'shipped' THEN status
--     END) AS contSHI,
--     COUNT(CASE
--     WHEN status = 'cancelled'  THEN status
--     END) AS contCANC
-- from orders;

--3
/*Exibir o valor médio dos pedidos com status 
completed ou shipped, arredondado para 2 casas decimais.
*/
SELECT round(avg(total_amount),2)
FROM orders
WHERE status = 'completed' or status = 'shipped';

--4
/*Classificar o valor total dos pedidos em faixas 
(baixo, médio, alto) e 
ordenar pelos pedidos de maior faixa para menor.
*/
SELECT *,
    CASE
    WHEN total_amount <= 500 THEN 'baixo'
    WHEN total_amount > 500 AND  total_amount <= 3000 THEN 'médio'
    ELSE 'alto'
    END AS classificação
FROM orders 
ORDER BY total_amount DESC;

--5
/*Exibir a quantidade de clientes
distintos que realizaram pedidos em 2023.
*/
SELECT COUNT( DISTINCT customer_id)
FROM orders
WHERE date_part('year',order_date) = 2023;

select * FROM orders;

--6
/*Exibir o menor, oo maior e o 
valor médio do total_amount entre pedidos completed.
*/
SELECT
    MIN(total_amount),
    MAX(total_amount),
    round(AVG(total_amount),3)
FROM orders
WHERE status = 'completed';

--7
/*Exibir os pedidos cujo total_amount
não esteja no intervalo entre 100 e 5000,
ordenados pela data do pedido.
*/
SELECT *
FROM orders
WHERE total_amount < 100 or total_amount > 5000
order by order_date;

--8
/*Exibir os pedidos ocorridos no 
primeiro trimestre de 2023.*/

SELECT *
FROM orders
WHERE order_date >= '2023-01-01' and order_date < '2023-04-01'
ORDER BY order_date DESC;

--9
/*Agrupar pedidos por mês e exibir a
quantidade de pedidos por mês no período total disponível.
*/


--10
/*Exibir a quantidade total de pedidos com status
completed ou shipped e valor total acima de 500.
*/
SELECT count(*)
FROM orders
WHERE (status = 'completed' or status = 'shipped') and total_amount > 500;

--11
/*Exibir os pedidos cujo status seja 
diferente de cancelled e completed, 
ordenados pelo valor total.
*/
SELECT * 
FROM orders
WHERE status <> 'cancelled' and status <> 'completed'
ORDER BY total_amount;

--12
/*Exibir os clientes cujo first_name 
contenha a letra 'a' e que tenham sido criados 
após 2023-03-01.*/

SELECT * 
FROM customers
WHERE first_name LIKE '%a%' AND created_at > '2023-03-01' 

--13
/*Exibir a quantidade de clientes por cidade, 
ordenando das cidades com mais clientes para as com menos.
*/
SELECT city, COUNT(city)
FROM customers
group by city
ORDER BY count DESC;

--14 
/*Exibir os clientes criados no ano de 2023 
cujo last_name não contenha a letra 'o', 
ordenando por last_name.
*/
SELECT * 
FROM customers
WHERE extract(year from created_at) = 2023 and last_name NOT LIKE '%o%'
ORDER BY last_name;

--15
/*Exibir a quantidade de clientes cujo 
first_name comece com vogal.
*/
SELECT (first_name)
FROM customers
WHERE first_name ~* '^[aeiou]';

select COUNT(first_name)
FROM customers
WHERE first_name ~*'^[aeiou]';
