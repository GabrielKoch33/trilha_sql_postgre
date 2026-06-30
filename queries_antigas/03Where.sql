SELECT *
FROM produtos
WHERE categoria_produto = 'rpg' and (id_produto >= 10) and (id_produto <= 20);

SELECT id_cliente, dt_criacao, fl_email
FROM clientes
WHERE fl_email = 1;

SELECT id_transacao, qtde_pontos, id_cliente
FROM transacoes
WHERE qtde_pontos = 50;

SELECT id_cliente, qtde_pontos
FROM clientes
WHERE qtde_pontos >= 500;

SELECT *
FROM produtos
WHERE nome_produto = 'Churn_10pp' OR nome_produto = 'Churn_2pp';

SELECT * 
FROM produtos
WHERE nome_produto IN ('Churn_10pp','Churn_2pp', ' Churn_5pp ');--semelhante a uma lista to-do

SELECT *
FROM produtos
WHERE categoria_produto = 'churn_model'