/*
Quais clientes assinaram a lista de presença no dia 25/08/25
*/
SELECT 
    a1.id_cliente,
    COUNT(*)

FROM transacoes as a1

LEFT JOIN transacao_produto as a2
    ON a1.id_transacao = a2.id_transacao

LEFT JOIN produtos as a3
    ON a2.id_produto = a3.id_produto

WHERE a1.dt_criacao = '2025-08-25'
AND a3.nome_produto = 'Lista de presença'

GROUP BY a1.id_cliente;

