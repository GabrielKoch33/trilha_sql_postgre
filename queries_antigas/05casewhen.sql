-- INTERVALOS:
-- De 0 a 500 >> ponei 
-- de 501 a 1000 >> ponei premium
-- de 1001 a 5000 >> mago aprendiz
-- de 5001 a 10000 >> mago mestre
-- +10000 >> mago supremo

SELECT id_cliente, 
    qtde_pontos, 
    CASE
        WHEN qtde_pontos <= 500 THEN 'Pônei'
        WHEN qtde_pontos <= 1000 THEN 'Pônei Premium'
        WHEN qtde_pontos <= 5000 THEN 'Mago Aprendiz'
        WHEN qtde_pontos <= 10000 THEN 'Mago Mestre'
        WHEN qtde_pontos > 10000 THEN 'Mago Supremo'
        ELSE 'Mago Supremo'
        -- Se nenhuma condição bater, Else ocorre
    END AS nome_group
FROM clientes

ORDER BY qtde_pontos DESC;


SELECT id_cliente,
    qtde_pontos, 
    CASE
        WHEN qtde_pontos <= 500 THEN 'Pônei'
        WHEN qtde_pontos <= 1000 THEN 'Pônei Premium'
        WHEN qtde_pontos <= 5000 THEN 'Mago Aprendiz'
        WHEN qtde_pontos <= 10000 THEN 'Mago Mestre'
        ELSE 'Mago Supremo' 
    END AS nome_group,
-- Criação de Coluna: É pônei? SIM(1) ou NÃO(0)?
    CASE 
        WHEN qtde_pontos <= 1000 THEN 1
        ELSE 0
    END as isponei,
-- Criação de Coluna: É mago?
    CASE
        WHEN qtde_pontos > 1000 THEN 1
        ELSE 0
    END AS ismago

FROM clientes

WHERE qtde_pontos > 1000

ORDER BY qtde_pontos DESC;

SELECT id_transacao, qtde_pontos,
CASE
    WHEN qtde_pontos < 10 THEN 'Baixo'
    WHEN qtde_pontos < 500 THEN 'Médio'
    WHEN qtde_pontos >= 500 THEN 'Alto'
END AS Nível
FROM transacoes
ORDER BY qtde_pontos DESC

