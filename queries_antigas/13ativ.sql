--1
SELECT *
FROM orders
ORDER BY order_date;

--2
SELECT *
FROM customers
WHERE created_at > '2023-06-01'
ORDER BY first_name;

--3
SELECT * 
FROM products
WHERE price > 300 
ORDER BY price DESC;

--4
SELECT * 
FROM products
ORDER BY price
LIMIT 3;

--5
SELECT * 
FROM orders
WHERE status = 'shipped' or  status = 'processing';

---perguntar pq não consigo criar uma coluna com AS e
--depois usar o WHERE para filtrar essa tabela

--6
SELECT *
FROM orders
WHERE to_char(order_date,'yyyy-mm-dd') LIKE '202%-12-%%';

--7
SELECT *
FROM orders
WHERE to_char(order_date, 'MM') = '12';
---usa-se '12' pois foi convertido data em string

--8
SELECT * 
FROM orders
WHERE extract(DAY FROM order_date) = 2;

--9
SELECT *
FROM orders
where date_part('year', order_date) = 2024
ORDER BY order_date;

--10--N CONSEGUI

--11
SELECT customer_id, order_date,
    to_char(order_date,'DD-MM-YYYY') AS datafor
FROM orders;

--12
SELECT customer_id, order_date,
    to_char(order_date,'DD "de" Month "de" YYYY')
from orders;

--13
SELECT *,
    to_char(created_at,'YYYY-MM') as data_nova
FROM customers;

--14
SELECT *,
CASE
    WHEN price < 300 THEN 'barato'
    WHEN price <= 1000 THEN 'medio'
    WHEN price > 1000 THEN 'caro'
END AS tipo_preco
FROM products;

--15
SELECT *,
CASE
    WHEN order_date > '2023-12-01' THEN 'sim'
    ELSE 'nao'
END
FROM orders;

--16
SELECT *,
CASE
    WHEN city IN ('São Paulo','Rio de Janeiro','Belo Horizonte') THEN 'sudeste'
    ELSE 'outros'
END AS cidade_regiao
FROM customers;

--17
SELECT order_id, status,
CASE
    WHEN status = 'completed' THEN 'finalizado'
    WHEN status = 'processing' or status = 'shipped' THEN 'em andamento'
    ELSE 'cancelado'
END AS situacao,
order_date
FROM orders;

--18
SELECT order_id, status,
CASE
    WHEN status = 'completed' THEN 'finalizado'
    WHEN status = 'processing' or status = 'shipped' THEN 'em andamento'
    ELSE 'cancelado'
END AS situacao,
order_date
FROM orders
WHERE order_date < '2024-01-01'
ORDER BY order_date ASC ;

--19
SELECT *,
    CASE
        WHEN price >= 200 THEN 'caro'
        ELSE 'barato'
    END AS classificacao
FROM products
WHERE product_name LIKE 'Livro%';

--20
SELECT * 
FROM customers
WHERE city = 'São Paulo' AND (created_at >= '2023-01-01')and (created_at < '2024-01-01')
ORDER BY created_at;

--1
--Listar todos os pedidos feitos no mês de novembro de 2023, 
--ordenados da data mais recente para a mais antiga.

SELECT * 
FROM orders
WHERE extract(MONTH from order_date) = 12 and EXTRACT(YEAR from order_date) = 2023
ORDER BY order_date DESC;
--2
--Listar nome completo dos clientes 
--(first_name + last_name), a cidade, 
--e uma coluna indicando se o cliente é da região sudeste 
--(São Paulo, Rio de Janeiro ou Belo Horizonte) ou “outros”.

SELECT first_name || ' ' || last_name as nome_completo, city,
CASE
    WHEN city IN ('São Paulo','Rio de Janeiro','Belo Horizonte') THEN 'sudeste'
    ELSE 'outros'
    END as Regiao
FROM customers;

--3
-- Listar todos os produtos com preço acima de 800, 
--exibindo também uma coluna categorizando o produto em:
-- – “premium” se preço > 1500
-- – “intermediário” se preço entre 801 e 1500
-- – “básico” caso contrário
-- Ordenar pelos mais caros primeiro.

SELECT *,
CASE
    WHEN price > 1500 THEN 'premium'
    WHEN price > 801 THEN 'intermediário'
    WHEN price <= 801 THEN 'básico'
END AS classe
FROM products
ORDER BY price DESC;

--4
--Mostrar todos os pedidos cujo ano da data seja 2024, 
--porém apenas os que tenham status diferente de 'cancelled'.
--Ordenar pelo total_amount do maior para o menor.

SELECT * 
FROM orders
WHERE (status <> 'cancelled') and extract(YEAR from order_date) = 2024
ORDER BY total_amount DESC;

--5
--Criar uma consulta que retorne:
--order_id, customer_id, order_date E
-- uma coluna chamada ano_mes formatada 
--como YYYY-MM usando to_char, 
--e filtrar apenas os pedidos do ano de 2023.

SELECT order_id, customer_id, order_date, to_char( order_date,'YYYY-MM') as ano_mes
FROM orders
WHERE extract(YEAR FROM order_date) = 2023;