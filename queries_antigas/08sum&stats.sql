SELECT sum(qtde_pontos)
FROM transacoes
WHERE qtde_pontos > 0;

SELECT 
    SUM(qtde_pontos),

    SUM(CASE
    WHEN qtde_pontos > 0 THEN qtde_pontos
    END) as SomaPosi,

    SUM(CASE
    WHEN qtde_pontos < 0 THEN qtde_pontos
    END) as SomaNega,


    COUNT(CASE
    WHEN qtde_pontos < 0 THEN qtde_pontos
    END) as qtdeTransNegativa

FROM transacoes

WHERE dt_criacao >= '2025-07-01'
and dt_criacao < '2025-08-01';

--
SELECT
    avg(qtde_pontos),
    round(avg(qtde_pontos),2),
    sum(qtde_pontos)/ COUNT(id_cliente) as media,
    1.* sum(qtde_pontos)/ COUNT(id_cliente) as media,
    min(qtde_pontos) as Minimo,
    max(qtde_pontos) as Maximo,
    sum(fl_email),
    sum(fl_twitch)
FROM clientes;

SELECT * FROM clientes
