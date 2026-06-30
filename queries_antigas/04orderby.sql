SELECT id_cliente ,qtde_pontos
FROM clientes
ORDER BY qtde_pontos DESC 
LIMIT 10; 
-- por padrão é crescente
--  LIMIT pega os 10 primeiro, e como 
--  estão ordenados do maior p/ menor
--  ent são os top 10 mais pontos

SELECT id_cliente, qtde_pontos,dt_criacao
FROM clientes
ORDER BY dt_criacao ASC, qtde_pontos DESC  
-- datas: entenda mais antiga como "menor valor"
-- e mais recentes como "maior valor" use DESC para mais recentes 

SELECT clientes.id_cliente, clientes.qtde_pontos, clientes.fl_twitch, clientes.dt_criacao
FROM clientes
WHERE fl_twitch = 1 
ORDER BY clientes.dt_criacao ASC, clientes.qtde_pontos DESC