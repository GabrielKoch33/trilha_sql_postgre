
/*Tabela agrupada por nome/id do produto, considerando
quantas vendas/transações de cada produto*/
SELECT 
    t2.id_produto,
    t2.nome_produto,
    COUNT(t1.id_produto)--n conta null,
    COUNT(*)--conta null

FROM transacao_produto as t1

LEFT JOIN produtos as t2
ON t1.id_produto = t2.id_produto

GROUP BY t2.nome_produto, t2.id_produto

ORDER BY t2.id_produto ASC; 


-- SELECT 
--     t1.id_produto,
--     t1.qtde_produto,
--     t2.id_produto,
--     t2.nome_produto,
--     t2.categoria_produto

-- FROM transacao_produto as t1

-- LEFT JOIN produtos as t2
-- ON t1.id_produto = t2.id_produto

-- ORDER BY t1.id_produto;

SELECT id_produto,count(*) FROM produtos
GROUP BY id_produto;

SELECT * FROM transacao_produto
ORDER BY id_produto NULLS FIRST
/*Nessa tabela há 6 transações de nenhum produto,
movimentações fantasmas*/