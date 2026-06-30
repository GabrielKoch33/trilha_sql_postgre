SELECT 
    t2.categoria_produto,
    COUNT(t2.categoria_produto),--n exite null na cat.prod
    count(DISTINCT t1.id_transacao),
    COUNT(t1.id_transacao),
    COUNT(*)
FROM transacao_produto as t1

LEFT JOIN produtos as t2
ON t1.id_produto = t2.id_produto

GROUP BY t2.categoria_produto;


/*Em 2024, quantas transações de Lovers foram feitas?*/
SELECT 
    a1.categoria_produto,
    COUNT(*) AS lovano24

FROM produtos as a1

LEFT JOIN transacao_produto as a2
    ON a1.id_produto = a2.id_produto

LEFT JOIN transacoes as a3
    ON a2.id_transacao = a3.id_transacao

WHERE extract(year from a3.dt_criacao) = 2024 
AND (a1.categoria_produto = 'lovers')

GROUP BY a1.categoria_produto;

/*Qual mês tivemos mais lista de presença assinada?*/

SELECT 
    to_char(a1.dt_criacao, 'MM/YYYY') as Ano_mes,
    extract(MONTH from a1.dt_criacao) as meses,
    count(a3.categoria_produto)--conta qtas vezes 
--a categroria produto aparece em cada mes

FROM transacoes as a1

LEFT JOIN transacao_produto as a2
    ON a1.id_transacao = a2.id_transacao 

LEFT JOIN produtos as a3
    ON a3.id_produto = a2.id_produto

WHERE a3.categoria_produto = 'present'

GROUP BY a3.categoria_produto,meses ,Ano_mes

ORDER BY COUNT(a3.categoria_produto) DESC;

/*Qual total de pontos trocados no StreamElements em junho de 2025
qtdepontos, dtcriacao = transacoes
categoria_prod = produtos (streamelements)
*/

SELECT * FROM produtos;

SELECT 
    a1.categoria_produto,
    sum(a3.qtde_pontos)

FROM produtos as a1

LEFT JOIN transacao_produto as a2
    ON a1.id_produto = a2.id_produto

LEFT JOIN transacoes as a3
    ON a2.id_transacao = a3.id_transacao

WHERE a1.categoria_produto = 'streamelements' and a3.qtde_pontos > 0
and a3.dt_criacao >= '2025-06-01' and a3.dt_criacao < '2025-07-01'

GROUP BY a1.categoria_produto