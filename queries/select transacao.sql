SELECT idtransacao,
       idcliente,
       dtcriacao,
       qtdepontos,
       descsistemaorigem
FROM public.transacoes
LIMIT 1000;