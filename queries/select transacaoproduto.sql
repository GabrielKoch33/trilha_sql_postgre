SELECT idtransacaoproduto,
       idtransacao,
       idproduto,
       qtdeproduto,
       vlproduto
FROM public.transacao_produto
LIMIT 1000;