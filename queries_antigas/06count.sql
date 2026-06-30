--Agregação: quando desejamos estatisticas, médias, variancia, minimo, maximo, contagem etc...
--De certa forma, reduzir de acordo com estatisticas

--COUNT(*): conta quantas linhas tem,
--incluindo na contagem valores NULL

--COUNT(nome_coluna): contas quantas linhas tem
--a colunas especificada, desconsiderando NULL
--na contagem


SELECT COUNT(*)
FROM transacoes;

SELECT DISTINCT fl_twitch, fl_email
FROM clientes;

SELECT COUNT(DISTINCT fl_email)
from clientes;

-- o DISTINCT fl_email, fl_twitch vai selecionar
-- as duas tabelas, e LINHA por LINHA vai observar
-- combinações diferentes entre si (TABELA Verdade)
-- quantas linhas diferentes eu tenho entre
--flemail e fltwitch?

SELECT 
    COUNT(DISTINCT id_cliente) AS cont_clientes, 
    --CONTADOR DE CLIENTES DISTINTOS
    COUNT( dt_criacao) AS cont_dt_cria,
    --CONTADOR DE DATA DE CRIAÇÃO
    COUNT( id_transacao) AS cont_idtran
    --CONTADOR DE ID DE TRANSAÇÃO
FROM transacoes
WHERE dt_criacao >= '2025-07-01'
and dt_criacao < '2025-08-01';
/*
-1: Conta quantos clientes diferentes que batem com as condições
do WHERE existem
-2: Conta quantas registros de criação há no 
mês de JULHO
-3: Conta quantas transações foram feitas em JULHO
-4: Aplicar um DISTINCT no dt_criação apenas ia filtrar
datas não repetidas.
/

--Order by não funciona quando usa-se COUNT()

