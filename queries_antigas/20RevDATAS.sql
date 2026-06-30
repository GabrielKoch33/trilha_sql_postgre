SELECT dt_criacao,
        EXTRACT( DOW FROM dt_criacao) AS week_nv
        --dow = day of week (0 a 6) 
        --0 = Domingo 6 =  sábado
FROM clientes
ORDER BY dt_criacao DESC


SELECT dt_criacao,
        date(dt_criacao)
FROM clientes;


SELECT dt_criacao,
        to_char(dt_criacao, 'DD/MM/YYYY') AS data_br
FROM clientes;
--OU--
SELECT *
FROM clientes
WHERE to_char(dt_criacao, 'YYYY') = '2024';
--OU--
SELECT 
        to_char(dt_criacao, 'Day') AS dia_semana,
        count(*)
FROM transacoes
WHERE extract(year FROM dt_criacao) = 2025
GROUP BY dia_semana


SELECT dt_criacao,  
        date_part('year', dt_criacao) as Ano_cria,--OUT: 202x
        date_part('month', dt_criacao) as Mes_cria,--OUT: 1..12
        date_part('day', dt_criacao) as dia_cria--OUT: 1..31
FROM clientes;
--OU--
SELECT *
FROM clientes
WHERE date_part('month',dt_criacao) = 7;--== '7'


SELECT dt_criacao, 
        extract( YEAR FROM dt_criacao) as dt_nova--OUT: 202x
FROM clientes;
--OU--
SELECT *
FROM clientes
WHERE extract(MONTH FROM dt_criacao) >= 6 and EXTRACT(MONTH from dt_criacao) < 9
order by dt_criacao DESC;


SELECT * FROM transacoes
WHERE dt_criacao >= '2025-07-01' and dt_criacao < '2025-08-01'
ORDER BY dt_criacao DESC