--1
SELECT
    extract(year from order_date) as Anos,
    count(*)
FROM orders

WHERE status <> 'cancelled'

GROUP BY Anos
HAVING COUNT(*) > 2;

--2
SELECT
    extract(MONTH from created_at) as Meses,
    Count(*)
FROM customers

WHERE extract(year from created_at) = 2023

GROUP BY Meses
ORDER BY Meses;


SELECT
    CASE
        WHEN EXTRACT(MONTH from created_at) = 1 THEN 'janeiro'
        WHEN EXTRACT(MONTH from created_at) = 2 THEN 'fevereiro'
        WHEN EXTRACT(MONTH from created_at) = 3 THEN 'março'
        WHEN EXTRACT(MONTH from created_at) = 4 THEN 'abril'
        WHEN EXTRACT(MONTH from created_at) = 5 THEN 'maio'
        WHEN EXTRACT(MONTH from created_at) = 6 THEN 'junho'
        WHEN EXTRACT(MONTH from created_at) = 7 THEN 'julho'
        WHEN EXTRACT(MONTH from created_at) = 8 THEN 'agosto'
        WHEN EXTRACT(MONTH from created_at) = 9 THEN 'setembro'
        WHEN EXTRACT(MONTH from created_at) = 10 THEN 'outubro'
        WHEN EXTRACT(MONTH from created_at) = 11 THEN 'novembro'
        WHEN EXTRACT(MONTH from created_at) = 12 THEN 'dezembro'
    END as Meses,
    Count(*)
FROM customers

WHERE extract(year from created_at) = 2023

GROUP BY 
    CASE
        WHEN EXTRACT(MONTH from created_at) = 1 THEN 'janeiro'
        WHEN EXTRACT(MONTH from created_at) = 2 THEN 'fevereiro'
        WHEN EXTRACT(MONTH from created_at) = 3 THEN 'março'
        WHEN EXTRACT(MONTH from created_at) = 4 THEN 'abril'
        WHEN EXTRACT(MONTH from created_at) = 5 THEN 'maio'
        WHEN EXTRACT(MONTH from created_at) = 6 THEN 'junho'
        WHEN EXTRACT(MONTH from created_at) = 7 THEN 'julho'
        WHEN EXTRACT(MONTH from created_at) = 8 THEN 'agosto'
        WHEN EXTRACT(MONTH from created_at) = 9 THEN 'setembro'
        WHEN EXTRACT(MONTH from created_at) = 10 THEN 'outubro'
        WHEN EXTRACT(MONTH from created_at) = 11 THEN 'novembro'
        WHEN EXTRACT(MONTH from created_at) = 12 THEN 'dezembro'
    END 
ORDER BY Meses;

--3
SELECT
    status,
    round(avg(total_amount),2) as mediapedidos
FROM orders
GROUP BY status
HAVING avg(total_amount) > 1000;
/*avg > 1000 fica no HAVING pois média não é uma coluna,
sendo ela apenas uma agregação que surge após o GBY*/

--4
SELECT 
    category,
    count(*),
    min(price),
    max(price),
    round(avg(price),2)
FROM products
GROUP BY category
HAVING avg(price) BETWEEN 200 AND 3000
--O count(*) não leva em consideração nenhuma das outras agregações né?
;

--5
SELECT
    city,
    count(*)
FROM customers
GROUP BY city
HAVING count(*) > 1;

/*GROUP BY COM CASE*/

--teste
SELECT
    Count(
        case when status = 'completed' then 1 end
    ) as concluidos
FROM orders;
/*nesse caso o case é ativado em todas as linhas
em que o status for 'completed'
e está dentro de uma agregação*/

SELECT
    status,
    CASE 
        WHEN COUNT(*) > 5 THEN 'alto volume'
        ELSE 'baixo volume'
    END AS volume
FROM orders
GROUP BY status;
/* o agrupamento é por status, ja o case surge 
como o resultado de uma agregação*/

--6
SELECT
    CASE
        WHEN total_amount < 300 THEN 'barato'
        WHEN total_amount <= 2500 THEN 'no preço'
        ELSE 'caro'
    END as faixas,
    count(*)
FROM orders
GROUP BY 
CASE       
    WHEN total_amount < 300 THEN 'barato'
    WHEN total_amount <= 2500 THEN 'no preço'
    ELSE 'caro'
END;

--7
SELECT
    CASE
    WHEN extract(year from created_at) = 2023 THEN 'criado em 2023'
    WHEN extract(year from created_at) > 2023 THEN 'criado após 2023'
    END as classificacao,
    count(*)
FROM customers
GROUP BY 
CASE
    WHEN extract(year from created_at) = 2023 THEN 'criado em 2023'
    WHEN extract(year from created_at) > 2023 THEN 'criado após 2023'
END;

--8
SELECT
    CASE
        WHEN status IN ('completed','shipped') THEN 'finalizado'
        ELSE 'incompleto'
    END as classificacao,
    count(*)
FROM orders
GROUP BY
    CASE
        WHEN status IN ('completed','shipped') THEN 'finalizado'
        ELSE 'incompleto'
    END 
HAVING count(*) > 3;

--9
SELECT
    CASE
    WHEN price < 100 THEN 'barato'
    WHEN price BETWEEN 100 and 500 THEN 'medio'
    ELSE 'caro' 
    END as faixa_preco,
    count(*)
FROM products
GROUP BY 
CASE
    WHEN price < 100 THEN 'barato'
    WHEN price BETWEEN 100 and 500 THEN 'medio'
    ELSE 'caro' 
END
ORDER BY COUNT(*) DESC;

--10
SELECT
    CASE
        WHEN extract(year from order_date) = 2023 AND
        extract(MONTH from order_date) > 3 THEN 'afterMARCH23'
        WHEN extract(year from order_date) = 2023 AND
        extract(MONTH from order_date) <= 3 THEN 'beforeMARCH23'
        WHEN extract(year from order_date) = 2024 AND
        extract(MONTH from order_date) > 3 THEN 'afterMARCH24'
        WHEN extract(year from order_date) = 2024 AND
        extract(MONTH from order_date) <= 3 THEN 'beforeMARCH24'
    END as anais,
    count(*),
    round(avg(total_amount),2) as media
from orders
GROUP BY
CASE
    WHEN extract(year from order_date) = 2023 AND
    extract(MONTH from order_date) > 3 THEN 'afterMARCH23'
    WHEN extract(year from order_date) = 2023 AND
    extract(MONTH from order_date) <= 3 THEN 'beforeMARCH23'
    WHEN extract(year from order_date) = 2024 AND
    extract(MONTH from order_date) > 3 THEN 'afterMARCH24'
    WHEN extract(year from order_date) = 2024 AND
    extract(MONTH from order_date) <= 3 THEN 'beforeMARCH24'
END 
HAVING avg(total_amount) > 500;

/*
Quais clientes fizeram compras em anos diferentes?
*/
-- 8
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
