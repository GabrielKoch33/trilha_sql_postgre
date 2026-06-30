SELECT * FROM products;

SELECT COUNT(product_id)
FROM products;
--semelhante ao count(*), pois estamos
--contando PK, e cada uma é unica

SELECT DISTINCT category
FROM products; 
--mostra todas as categorias de produtos diferentes

SELECT COUNT(DISTINCT category)
FROM products;
--mostra a quantidade de categorias diferentes que há na tabela

-- SELECT
--    category, COUNT(category)
-- FROM products
-- GROUP BY category