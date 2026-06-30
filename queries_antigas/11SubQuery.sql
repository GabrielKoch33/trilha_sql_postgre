SELECT *

FROM transacao_produto AS T1

WHERE T1.id_produto IN (
    SELECT id_produto
    FROM produtos
    WHERE nome_produto = 'Resgatar Ponei'
);
/*Vai retornar todas as linhas de compras
da tabela transacao_produto, onde o produto
comprado seja 'Resgatar Pônei'.
É uma forma de extrair dados 
sem fazer duas querys separadas*/

SELECT * FROM produtos