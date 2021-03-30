
-- 3 Mostre a quantidade de pedidos dos clientes que moram no RS ou em SC. Linhas: 1

SELECT 
	COUNT(p.CodPedido)
FROM pedido p 
WHERE p.CodCliente IN 
(SELECT c.CodCliente FROM cliente c WHERE c.Uf IN ('SC', 'RS'));

