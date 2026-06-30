SELECT 
    id_produto,
    COUNT(*) as QtdePerId
    FROM transacao_produto
GROUP BY id_produto;

SELECT * FROM transacao_produto
ORDER BY id_produto
OFFSET 8295;

SELECT 
        id_cliente, --5
        sum(qtde_pontos),
        COUNT(id_cliente)--qtdade transações do cliente

FROM transacoes--1

WHERE extract(month from dt_criacao) = 7--2

GROUP BY id_cliente--3
HAVING SUM(qtde_pontos) >= 4000--4

ORDER BY SUM(qtde_pontos) DESC --6

LIMIT 10;--7

--Having é o "where" do group by
--o filtro do agrupamento