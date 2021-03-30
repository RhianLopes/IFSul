
-- 3 Mostre a quantidade de pedidos dos clientes que moram no RS ou em SC. Linhas: 1

SELECT 
	COUNT(p.CodPedido)
FROM pedido p 
WHERE p.CodCliente IN 
(SELECT c.CodCliente FROM cliente c WHERE c.Uf IN ('SC', 'RS'));

-- 6 Crie uma consulta que exiba o código do cliente, o nome do cliente
-- e o número dos seus pedidos ordenados pelo nome e posteriormente pelo
-- código do pedido. Somente devem ser exibidos os pedidos dos vendedores
-- que possuem a faixa de comissão “A”. Linhas: 1749

SELECT 
	p.CodCliente,
	c.Nome,
	p.CodPedido
FROM pedido p 
LEFT JOIN cliente c 
	ON p.CodCliente = c.CodCliente 
WHERE p.CodVendedor IN (SELECT v.CodVendedor FROM vendedor v WHERE v.FaixaComissao = 'A')
GROUP BY p.CodPedido
ORDER BY p.CodCliente, c.Nome, p.CodPedido;

-- 9 Crie uma consulta que exiba o código do pedido e o somatório da quantidade
-- de itens desse pedido. Devem ser exibidos somente os pedidos em que o somatório
-- das quantidades de itens de um pedido seja maior que a média da quantidade de
-- itens de todos os pedidos. Linhas: 2508

SELECT 
	p.CodPedido,
	p.Soma
FROM (SELECT 
		ip.CodPedido,
		COALESCE(SUM(ip.Quantidade), 0) AS Soma
	 FROM itempedido ip 
	 GROUP BY ip.CodPedido) AS p
WHERE p.Soma > (
	SELECT 
		AVG(p.Soma) AS MediaQuantidade
	FROM 
	(SELECT 
		COALESCE(SUM(ip.Quantidade), 0) AS Soma
	 FROM itempedido ip 
	 GROUP BY ip.CodPedido) AS p
)
GROUP BY p.CodPedido;













