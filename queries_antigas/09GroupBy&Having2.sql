--1
SELECT qtde_pontos,
    CASE
    WHEN qtde_pontos < 10 THEN 'baixo'
    WHEN qtde_pontos < 500 THEN 'médio'
    ELSE 'alto'
    END AS Valor
FROM transacoes
ORDER BY qtde_pontos DESC;

--2
SELECT fl_email, COUNT(*)
FROM clientes
WHERE fl_email = 1
GROUP BY fl_email;
--ou
SELECT SUM(fl_email)--tem mesmo resultado pois só existe 1 e 0
FROM clientes;
--ou
SELECT COUNT(*)
FROM clientes
WHERE fl_email = 1;

--3
SELECT 
    id_cliente,
    SUM(qtde_pontos) as soma
FROM transacoes
WHERE dt_criacao >= '2025-05-01' and dt_criacao < '2025-06-01'
and qtde_pontos > 0
GROUP BY id_cliente
ORDER BY soma DESC;

--4
SELECT 
    id_cliente,
    COUNT(*)
FROM transacoes
WHERE extract(year from dt_criacao) = 2024
GROUP BY id_cliente;

--5
SELECT COUNT(*) --qtos são rpg, contagem simples
FROM produtos
WHERE categoria_produto = 'rpg';
--ou
SELECT --qtos produtos temos de cada tipo
    categoria_produto,
    COUNT(*)
FROM produtos
GROUP BY categoria_produto;

--6
SELECT  
    extract(day from dt_criacao) as Dias,
    round(avg(qtde_pontos)) as MediaperDia
FROM transacoes
WHERE qtde_pontos > 0
GROUP BY Dias
ORDER BY Dias;

--7
SELECT 
    extract(DOW from dt_criacao) as diasemana,
    count(*) transpdia
FROM transacoes
WHERE date_part('year', dt_criacao) = 2025
GROUP BY diasemana
ORDER BY 2 DESC; /*order by = 2 indica o
numero da coluna que vai ser ordenada*/

--8
SELECT * FROM produtos;
SELECT * FROM transacao_produto;

SELECT 
    id_produto,
    COUNT(*)
FROM transacao_produto
GROUP BY id_produto
ORDER BY count(*) DESC;

--9
SELECT 
    id_produto,
    sum(vl_produto * qtde_produto) as ReceitaObtida,-- + lucro/dinheiro
    sum(qtde_produto) as QtdeEstoqueSaida-- + saiu
FROM transacao_produto
GROUP BY id_produto
ORDER BY QtdeEstoqueSaida DESC;