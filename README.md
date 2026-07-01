# Roadmap de Estudos — SQL para Dados

A prática é realizada com base no banco Postgre e pgAdmin 4 como interface gráfica, ambos estão rodando em um conteiener docker. Estou usando o database do youtuber 'Téo me Why' 

Este repositório organiza uma trilha de estudos em **SQL**, com foco consultas, resolução de exercícios e aprendizado da linguagem SQL, futuramente irei inserir algumas modelagens que fiz como exercício, alheios a faculdade.

O objetivo deste roadmap é servir como checklist de progresso, guia de revisão e base para construção de portfólio em análise de dados, ciência de dados, engenharia de dados e bancos relacionais.

---

## Sumário

- [1. Fundamentos](#1-fundamentos)
- [2. Datas e Tempo](#2-datas-e-tempo)
- [3. Funções Básicas](#3-funções-básicas)
- [4. Manipulação de Texto](#4-manipulação-de-texto)
- [5. Agrupamento](#5-agrupamento)
- [6. Joins](#6-joins)
- [7. Subqueries e CTEs](#7-subqueries-e-ctes)
- [8. Window Functions](#8-window-functions)
- [9. Performance e Otimização](#9-performance-e-otimização)
- [10. Modelagem de Dados](#10-modelagem-de-dados)
- [11. DDL e DML](#11-ddl-e-dml)
- [12. SQL Profissional](#12-sql-profissional)
- [13. SQL para Dados](#13-sql-para-dados)
- [14. Portfólio](#14-portfólio)
- [15. Critérios de Domínio](#15-critérios-de-domínio)

---

# 1. Fundamentos

## Objetivo

Aprender a consultar dados em tabelas relacionais, filtrar registros, ordenar resultados e selecionar informações relevantes.

Essa fase forma a base para praticamente todo uso futuro de SQL.

---

## Checklist

- [ ] `SELECT`
- [ ] `FROM`
- [ ] `WHERE`
- [ ] `ORDER BY`
- [ ] `LIMIT`
- [ ] `DISTINCT`
- [ ] Alias com `AS`
- [ ] Operadores relacionais
- [ ] `IN`
- [ ] `NOT IN`
- [ ] `BETWEEN`
- [ ] `LIKE`
- [ ] `ILIKE`
- [ ] `IS NULL`
- [ ] `IS NOT NULL`

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Consultar colunas específicas de uma tabela.
- Filtrar registros com condições simples e compostas.
- Ordenar resultados.
- Limitar a quantidade de linhas retornadas.
- Remover duplicidades aparentes com `DISTINCT`.
- Usar aliases para melhorar a leitura das consultas.
- Filtrar textos, intervalos, listas e valores nulos.

---

# 2. Datas e Tempo

## Objetivo

Aprender a trabalhar com datas, horários, intervalos e agrupamentos temporais.

Essa fase é essencial para análises de vendas, comportamento de usuários, relatórios mensais, indicadores e séries temporais.

---

## Checklist

- [ ] `CURRENT_DATE`
- [ ] `CURRENT_TIMESTAMP`
- [ ] `INTERVAL`
- [ ] `EXTRACT`
- [ ] `DATE_PART`
- [ ] `DATE_TRUNC`
- [ ] `TO_CHAR`
- [ ] Diferença entre datas
- [ ] Agrupamento por mês
- [ ] Agrupamento por ano

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Obter a data atual e o timestamp atual.
- Calcular intervalos de tempo.
- Extrair ano, mês, dia e outras partes de uma data.
- Agrupar registros por mês, ano ou período.
- Formatizar datas para relatórios.
- Comparar datas em filtros e análises.

---

# 3. Funções Básicas

## Objetivo

Aprender as principais funções usadas em consultas analíticas e relatórios.

Essas funções permitem contar, somar, calcular médias, tratar nulos e criar regras condicionais.

---

## Checklist

- [ ] `COUNT()`
- [ ] `SUM()`
- [ ] `AVG()`
- [ ] `MIN()`
- [ ] `MAX()`
- [ ] `ROUND()`
- [ ] `COALESCE()`
- [ ] `NULLIF()`
- [ ] `CASE WHEN`

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Contar registros.
- Somar valores.
- Calcular médias.
- Encontrar valores mínimos e máximos.
- Arredondar resultados numéricos.
- Tratar valores nulos.
- Evitar divisões por zero com `NULLIF()`.
- Criar classificações condicionais com `CASE WHEN`.

---

# 4. Manipulação de Texto

## Objetivo

Aprender a limpar, padronizar e transformar campos textuais dentro do SQL.

Essa fase é importante para lidar com nomes, e-mails, categorias, códigos, descrições e dados inconsistentes.

---

## Checklist

- [ ] `CONCAT`
- [ ] `UPPER`
- [ ] `LOWER`
- [ ] `TRIM`
- [ ] `LENGTH`
- [ ] `SUBSTRING`
- [ ] `REPLACE`
- [ ] `SPLIT_PART` no PostgreSQL

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Concatenar textos.
- Padronizar letras maiúsculas e minúsculas.
- Remover espaços extras.
- Medir tamanho de strings.
- Extrair partes de textos.
- Substituir padrões textuais.
- Separar partes de uma string usando delimitadores.

---

# 5. Agrupamento

## Objetivo

Aprender a resumir dados por grupos, categorias, períodos e dimensões de negócio.

Essa fase é central para análises de dados.

---

## Checklist

- [ ] `GROUP BY`
- [ ] `HAVING`
- [ ] `COUNT DISTINCT`
- [ ] Agregações múltiplas
- [ ] Métricas por categoria
- [ ] Agrupamento temporal

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Agrupar registros por uma ou mais colunas.
- Calcular métricas por grupo.
- Filtrar grupos usando `HAVING`.
- Contar valores distintos.
- Criar relatórios por categoria, cidade, cliente, produto ou período.

---

## Exemplos de perguntas que você deve conseguir responder

- Quantos pedidos existem por status?
- Qual foi o total vendido por mês?
- Quantos clientes distintos compraram em cada ano?
- Qual categoria teve maior faturamento?
- Quais produtos venderam acima de determinado valor?

---

# 6. Joins

## Objetivo

Aprender a combinar dados de múltiplas tabelas relacionais.

Essa fase é uma das mais importantes para trabalhar com bancos reais, pois os dados normalmente ficam distribuídos entre várias tabelas.

---

## Checklist

- [ ] `INNER JOIN`
- [ ] `LEFT JOIN`
- [ ] `RIGHT JOIN`
- [ ] `FULL JOIN`
- [ ] `SELF JOIN`
- [ ] Joins múltiplos
- [ ] Diferença entre `ON` e `WHERE`
- [ ] Join com valores `NULL`

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Combinar duas ou mais tabelas.
- Escolher corretamente entre `INNER`, `LEFT`, `RIGHT` e `FULL JOIN`.
- Entender quando registros desaparecem em uma junção.
- Identificar valores sem correspondência.
- Evitar filtros no `WHERE` que transformam um `LEFT JOIN` em comportamento de `INNER JOIN`.
- Fazer consultas envolvendo clientes, pedidos, produtos e itens de pedido.

---

# 7. Subqueries e CTEs

## Objetivo

Aprender a decompor consultas complexas em partes menores e mais legíveis.

Subqueries e CTEs são fundamentais para análises mais sofisticadas.

---

## Checklist

- [ ] Subquery escalar
- [ ] Subquery em `WHERE`
- [ ] `EXISTS`
- [ ] `NOT EXISTS`
- [ ] `IN` com subquery
- [ ] CTE simples
- [ ] CTE múltiplas
- [ ] CTE recursiva básica

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Usar o resultado de uma consulta dentro de outra.
- Comparar valores contra resultados agregados.
- Verificar existência ou ausência de registros relacionados.
- Organizar consultas longas usando `WITH`.
- Quebrar problemas analíticos em etapas intermediárias.

---

# 8. Window Functions

## Objetivo

Aprender a fazer cálculos analíticos sem perder o nível de detalhe das linhas.

Window functions são fundamentais para rankings, comparações, acumulados e análises temporais.

---

## Checklist

- [ ] `OVER()`
- [ ] `ROW_NUMBER()`
- [ ] `RANK()`
- [ ] `DENSE_RANK()`
- [ ] `LAG()`
- [ ] `LEAD()`
- [ ] `SUM() OVER`
- [ ] `AVG() OVER`
- [ ] `PARTITION BY`
- [ ] `ORDER BY` em janela

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Criar rankings.
- Numerar linhas por grupo.
- Comparar uma linha com a anterior ou próxima.
- Calcular totais acumulados.
- Calcular médias móveis simples.
- Fazer análises por partições sem agrupar a tabela final.

---

## Exemplos de perguntas que você deve conseguir responder

- Qual foi o primeiro pedido de cada cliente?
- Qual produto mais vendeu em cada categoria?
- Qual a diferença entre a venda atual e a venda anterior?
- Qual o faturamento acumulado por mês?
- Quais clientes estão no top 3 de compras por cidade?

---

# 9. Performance e Otimização

## Objetivo

Aprender a escrever consultas mais eficientes, legíveis e adequadas para bases maiores.

Performance em SQL não é apenas velocidade. Também envolve clareza, previsibilidade e uso correto das estruturas do banco.

---

## Checklist

- [ ] Índices
- [ ] `EXPLAIN`
- [ ] `EXPLAIN ANALYZE`
- [ ] Diferença entre Scan e Index Scan
- [ ] Filtros eficientes
- [ ] Evitar `SELECT *`
- [ ] Uso de tipos corretos
- [ ] Query legível e performática

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Entender a função básica dos índices.
- Ler planos simples de execução.
- Identificar consultas que fazem varreduras desnecessárias.
- Evitar buscar colunas que não serão usadas.
- Usar filtros de forma mais eficiente.
- Escrever consultas mais fáceis de revisar e manter.

---

# 10. Modelagem de Dados

## Objetivo

Aprender os fundamentos de estruturação de bancos relacionais e modelos analíticos.

Essa fase conecta SQL com projeto de banco de dados, engenharia de dados e BI.

---

## Checklist

- [ ] Primary Key — `PK`
- [ ] Foreign Key — `FK`
- [ ] `UNIQUE`
- [ ] `CHECK`
- [ ] `NOT NULL`
- [ ] Normalização
- [ ] Cardinalidade
- [ ] `OLTP` vs `OLAP`
- [ ] Tabela fato
- [ ] Tabela dimensão
- [ ] Star Schema

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Entender chaves primárias e estrangeiras.
- Aplicar restrições para manter integridade dos dados.
- Diferenciar sistemas transacionais e analíticos.
- Entender cardinalidade entre entidades.
- Compreender a base de um modelo dimensional.
- Identificar fatos e dimensões em um problema de negócio.

---

# 11. DDL e DML

## Objetivo

Aprender a criar, alterar, popular e modificar estruturas e dados em um banco relacional.

Essa fase é essencial para sair do papel de apenas consultar dados e começar a construir bases.

---

## Checklist

- [ ] `CREATE TABLE`
- [ ] `ALTER TABLE`
- [ ] `DROP TABLE`
- [ ] `INSERT`
- [ ] `UPDATE`
- [ ] `DELETE`
- [ ] `TRUNCATE`
- [ ] `UPSERT`
- [ ] `CREATE INDEX`

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Criar tabelas.
- Alterar estruturas existentes.
- Inserir registros.
- Atualizar dados.
- Remover dados.
- Criar índices básicos.
- Entender diferenças entre `DELETE`, `TRUNCATE` e `DROP`.

---

# 12. SQL Profissional

## Objetivo

Aprender recursos usados em ambientes mais próximos do trabalho real com bancos de dados.

---

## Checklist

- [ ] Views
- [ ] Materialized Views
- [ ] Procedures — conceito
- [ ] Transactions
- [ ] `COMMIT`
- [ ] `ROLLBACK`
- [ ] Controle de acesso básico
- [ ] Documentação de queries

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Criar consultas reutilizáveis com views.
- Entender quando usar materialized views.
- Compreender o papel de procedures.
- Usar transações para proteger alterações.
- Confirmar ou desfazer operações.
- Documentar consultas importantes.
- Ter noção básica de permissões e acesso.

---

# 13. SQL para Dados

## Objetivo

Aplicar SQL em problemas reais de análise, BI, ciência de dados e engenharia de dados.

Essa fase aproxima o estudo de SQL da prática profissional em dados.

---

## Checklist

- [ ] Limpeza de dados
- [ ] Deduplicação
- [ ] Tabelas staging
- [ ] Transformações analíticas
- [ ] KPIs
- [ ] Cohort analysis
- [ ] Retenção
- [ ] Receita acumulada
- [ ] Funil de conversão

---

## Esperado ao final

Ao final desta fase, você deve conseguir:

- Preparar dados para análise.
- Criar consultas de indicadores.
- Construir tabelas intermediárias.
- Remover duplicidades.
- Criar métricas de negócio.
- Analisar retenção de clientes.
- Criar análises de cohort.
- Calcular receita acumulada.
- Montar funis de conversão.

---

# 14. Portfólio

## Objetivo

Consolidar o conhecimento de SQL em projetos práticos e apresentáveis.

O portfólio deve demonstrar que você sabe consultar, modelar, transformar e analisar dados.

---

## Checklist

- [ ] Projeto de análise de vendas
- [ ] Dashboard SQL + BI
- [ ] Base e-commerce
- [ ] Queries de negócio
- [ ] ETL com SQL
- [ ] Data Warehouse simples
- [ ] Projeto final completo

---

## Projetos recomendados

### Projeto 1 — Análise de Vendas

Criar uma base de vendas e responder perguntas de negócio usando SQL.

Requisitos:

- [ ] Criar tabelas de clientes, produtos, pedidos e itens de pedido.
- [ ] Inserir dados fictícios coerentes.
- [ ] Criar queries de faturamento.
- [ ] Criar análises por cliente, produto, categoria e período.
- [ ] Usar `GROUP BY`, `JOIN`, `CASE WHEN` e funções de data.

---

### Projeto 2 — Dashboard SQL + BI

Criar consultas para alimentar um dashboard.

Requisitos:

- [ ] Criar KPIs principais.
- [ ] Criar consultas agregadas.
- [ ] Preparar dados por mês.
- [ ] Separar métricas por categoria.
- [ ] Conectar as queries a uma ferramenta de BI.

---

### Projeto 3 — Mini Data Warehouse

Modelar uma estrutura simples em estrela.

Requisitos:

- [ ] Criar tabela fato.
- [ ] Criar tabelas dimensão.
- [ ] Definir chaves.
- [ ] Popular as tabelas.
- [ ] Criar queries analíticas.
- [ ] Documentar o modelo.

---

### Projeto 4 — ETL com SQL

Criar um fluxo simples de transformação.

Requisitos:

- [ ] Criar tabela staging.
- [ ] Carregar dados brutos.
- [ ] Limpar dados.
- [ ] Deduplicar registros.
- [ ] Transformar para tabela final.
- [ ] Validar contagens antes e depois.

---

# 15. Critérios de Domínio

Este roadmap pode ser considerado bem avançado quando você conseguir:

- [ ] Ler e interpretar tabelas relacionais.
- [ ] Criar consultas com filtros claros.
- [ ] Usar funções agregadas corretamente.
- [ ] Trabalhar com datas em consultas reais.
- [ ] Manipular textos dentro do SQL.
- [ ] Agrupar dados por diferentes dimensões.
- [ ] Combinar múltiplas tabelas com segurança.
- [ ] Explicar a diferença entre os principais tipos de join.
- [ ] Usar subqueries e CTEs para organizar problemas complexos.
- [ ] Aplicar window functions em rankings, comparações e acumulados.
- [ ] Ler um plano simples com `EXPLAIN`.
- [ ] Criar tabelas com chaves e restrições.
- [ ] Entender diferença entre modelo transacional e analítico.
- [ ] Criar consultas para KPIs.
- [ ] Fazer deduplicação e limpeza de dados.
- [ ] Criar um projeto SQL documentado no GitHub.
- [ ] Explicar suas queries linha por linha.
- [ ] Escrever SQL legível, testável e revisável.

---

## Observação Final

SQL não deve ser estudado apenas como uma linguagem de consulta.

Para trabalhar com dados, é necessário saber transformar perguntas de negócio em consultas, entender o modelo das tabelas, validar resultados, identificar problemas de qualidade e documentar bem as decisões tomadas.

O domínio real começa quando você consegue olhar para um banco desconhecido, entender suas relações, montar hipóteses, consultar os dados e entregar respostas confiáveis.
