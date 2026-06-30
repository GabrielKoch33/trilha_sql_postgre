SELECT *
FROM produtos
WHERE nome_produto LIKE 'Churn%';
-- Inicia com Churn e com final random

SELECT * 
FROM produtos
WHERE nome_produto LIKE '%pp';
-- Inicia de forma aleatória e final pp

SELECT *
FROM produtos
WHERE nome_produto LIKE '%Botas%';
-- Possue meio e fim aleatórios, mas tem que conter Botas no meio da string
