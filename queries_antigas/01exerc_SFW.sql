
SELECT qtde_pontos
from transacoes
where qtde_pontos = 1

--2

--3
SELECT id_cliente,  qtde_pontos
FROM clientes
WHERE qtde_pontos = 0

--4
select id_cliente,qtde_pontos 
from clientes
where qtde_pontos >= 100 and qtde_pontos <= 200

--5
SELECT produtos.id_produto, produtos.nome_produto
from produtos
WHERE produtos.nome_produto LIKE 'Venda de%'

--6
SELECT id_produto, nome_produto
FROM produtos
WHERE nome_produto LIKE '%Lover'

--7
SELECT id_produto, nome_produto
FROM produtos
WHERE produtos.nome_produto LIKE '%Chapéu%';

--8
SELECT id_produto
FROM transacao_produto
WHERE id_produto = 15;

--9
