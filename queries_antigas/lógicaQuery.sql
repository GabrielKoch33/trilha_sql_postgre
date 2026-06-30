SELECT 
    customer_id,
    COUNT(*) AS total_pedidos
FROM orders
WHERE order_date >= '2023-01-01'
    AND order_date <  '2024-01-01'
GROUP BY customer_id
HAVING COUNT(*) > 5
ORDER BY total_pedidos DESC
LIMIT 10 OFFSET 0;

/*Da tabela orders iremos AGRUPAR por customer_id
e CONTAR quantos pedidos cada cliente fez
num PERIODO de 2023 à 2024. Tendo como parametros
pedidos ACIMA de 5, ORDENANDO o numero de
pedidos do MAIOR para o MENOR, mostrando por fim,
os 10 PRIMEIROS(limit) e sem DESCONSIDERAR(offset) nenhum
*/

/*
FROM        → escolhe dados
JOIN / ON   → conecta dados
WHERE       → filtra linhas
GROUP BY    → cria grupos
HAVING      → filtra grupos
SELECT      → escolhe colunas / cria alias
DISTINCT   → remove duplicatas
ORDER BY   → ordena resultado
LIMIT       → limita saída
*/