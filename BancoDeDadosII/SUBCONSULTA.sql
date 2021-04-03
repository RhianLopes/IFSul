-- L1 EX1 Mostre o nome dos Clientes e seu endereço completo, dos clientes que realizaram
-- um pedido no ano de 2015. ordene pela ordem alfabética. Linhas: 1291

SELECT 
	c.Nome,
	c.Endereco,
	c.Cidade,
	c.Uf,
	c.Cep 
FROM cliente c
WHERE c.CodCliente IN (SELECT 
		p.CodCliente
	FROM pedido p
	WHERE YEAR(p.DataPedido) = 2015)
ORDER BY c.Nome;

-- L1 EX2 Mostre o nome do produto e seu valor unitário. Somente devem ser exibidos os
-- produtos que tiveram pelo menos 5 e no máximo 7 itens em um único pedido. Ordene em
-- ordem decrescente pelo valor unitário dos produtos. Linhas: 1928

SELECT 
	p.Descricao,
	p.ValorUnitario 
FROM produto p 
WHERE p.CodProduto IN (SELECT 
		DISTINCT ip.CodProduto 
	FROM itempedido ip
	WHERE ip.Quantidade >= 5
	AND ip.Quantidade <= 7)
ORDER BY p.ValorUnitario DESC;

-- L1 EX3 Mostre a quantidade de pedidos dos clientes que moram no RS ou em SC. Linhas: 1

SELECT 
	COUNT(p.CodPedido)
FROM pedido p 
WHERE p.CodCliente IN 
(SELECT c.CodCliente FROM cliente c WHERE c.Uf IN ('SC', 'RS'));

-- L1 EX4 Mostre o código do produto, o nome e o valor unitário dos produtos 
-- que possuam pedidos para serem entregues entre os dias 01/12/2014 e 31/01/2015. 
-- Ordene a lista pelo valor unitário decrescente dos produtos. Linhas: 625

SELECT 
	p.CodProduto, 
	p.Descricao,
	p.ValorUnitario 
FROM produto p 
WHERE p.CodProduto IN (SELECT 
		DISTINCT ip.CodProduto 
	FROM itempedido ip
	INNER JOIN pedido p
	ON ip.CodPedido = p.CodPedido
	WHERE (p.PrazoEntrega BETWEEN '2014-12-01' AND '2015-01-31'))
ORDER BY p.ValorUnitario DESC;

-- L1 EX5 Exiba os dados dos clientes que fizeram pedidos com mais de 60 itens, 
-- observe que esta é a quantidade total de itens, independentemente de serem
-- produtos iguais ou diferentes. Linhas: 10

SELECT 
	c.* 
FROM cliente c
WHERE c.CodCliente IN (SELECT 
		DISTINCT p.CodCliente
	FROM pedido p 
	INNER JOIN itempedido ip 
	ON p.CodPedido = ip.CodPedido 
	GROUP BY ip.CodPedido
	HAVING SUM(ip.Quantidade) > 60);

-- L1 EX6 Crie uma consulta que exiba o código do cliente, o nome do cliente
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
ORDER BY c.Nome, p.CodPedido;

-- L1 EX7 Crie uma consulta que exiba o nome do cliente, endereço, cidade, UF, CEP,
-- código do pedido e prazo de entrega dos pedidos que NÃO sejam de vendedores que ganham
-- menos de R$ 1500,00. Linhas: 5109

SELECT 
	c.Nome,
	c.Endereco,
	c.Cidade,
	c.Uf,
	c.Cep,
	p.CodPedido,
	p.PrazoEntrega 
FROM cliente c 
INNER JOIN pedido p 
ON c.CodCliente = p.CodCliente 
WHERE p.CodVendedor IN (SELECT 
		v.CodVendedor 
	FROM vendedor v 
	WHERE v.SalarioFixo >= 1500);

-- L1 EX8 Crie uma consulta que exiba o nome do cliente, cidade e estado, dos clientes
-- que fizeram algum pedido no ano de 2015. Ordene os resultados pelos nomes dos clientes
-- em ordem alfabética. Linhas: 1291

SELECT 
	c.Nome,
	c.Cidade,
	c.Uf 
FROM cliente c 
WHERE c.CodCliente IN (SELECT 
		p.CodCliente 
	FROM pedido p
	WHERE YEAR(p.DataPedido) = 2015
	GROUP BY p.CodCliente)
ORDER BY c.Nome;

-- L1 EX9 Crie uma consulta que exiba o código do pedido e o somatório da quantidade
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

-- L1 EX10 Crie uma consulta que exiba o nome do cliente, o nome do vendedor de
-- seu último pedido e o estado do cliente. Devem ser exibidos apenas os clientes 
-- do Rio Grande do Sul e apenas o último vendedor. Linhas: 55

SELECT 
	c.Nome as NomeCliente,
	vp.Nome as NomeVendedor,
	c.Uf
FROM cliente c 
INNER JOIN (SELECT
		p.CodCliente,
		p.CodPedido,
		v.Nome
	FROM pedido p 
	INNER JOIN vendedor v 
	ON p.CodVendedor = v.CodVendedor
	GROUP BY p.CodPedido
	ORDER BY p.DataPedido DESC) as vp
ON c.CodCliente = vp.CodCliente
WHERE c.Uf = 'RS'
GROUP BY c.CodCliente
ORDER BY NomeCliente;

-- L1 EX11 Selecione o nome do produto e o valor unitário dos produtos que possuem
-- o valor unitário maior que todos os produtos que comecem com a letra L. A lista
-- deve ser ordenada em ordem alfabética. Linhas: 192

SELECT 
	p.Descricao,
	p.ValorUnitario 
FROM produto p 
WHERE p.ValorUnitario > (SELECT 
		MAX(p.ValorUnitario)
	FROM produto p
	WHERE SUBSTRING(p.Descricao, 1, 1) = 'L' )
	GROUP BY p.CodProduto
ORDER BY p.Descricao;

-- L1 EX12 Selecione o código do produto, o nome do produto e o valor unitário dos
-- produtos que possuam pelo menos um pedido com mais de 9 itens em sua quantidade.
-- A lista deve ser ordenada pelo valor unitário em ordem decrescente. Linhas: 3063

SELECT 
	pr.*
FROM produto pr
INNER JOIN (
	SELECT 
		ip.CodProduto,
		COALESCE(MAX(ip.Quantidade), 0) as QuantidadeMaxima
	FROM itempedido ip
	GROUP BY ip.CodProduto) AS p
ON pr.CodProduto = p.CodProduto
WHERE p.QuantidadeMaxima > 9
ORDER BY pr.ValorUnitario DESC;

-- L1 EX13 Selecione o código do vendedor e o nome dos vendedores que não tenham
-- vendido nenhum pedido com prazo de entrega em Agosto de 2015. A lista deve ser ordenada
-- pelo nome dos vendedores em ordem alfabética. Linhas: 101

SELECT 
	v.CodVendedor,
	v.Nome
FROM vendedor v 
WHERE v.CodVendedor NOT IN (SELECT 
		DISTINCT p.CodVendedor 
	FROM pedido p
	WHERE YEAR(p.PrazoEntrega) = 2015 
	AND MONTH(p.PrazoEntrega) = 8)
ORDER BY v.Nome;

-- L1 EX14 Selecione o código do cliente e o nome dos clientes que tenham feitos pedidos
-- em Abril de 2014. A lista deve ser ordenada pelo nome dos clientes em ordem alfabética.
-- Linhas:  208

SELECT 
	c.CodCliente,
	c.Nome
FROM cliente c 
WHERE c.CodCliente IN (SELECT 
		DISTINCT p.CodCliente
	FROM pedido p
	WHERE YEAR(p.DataPedido) = 2014
	AND MONTH(p.DataPedido) = 4)
ORDER BY c.Nome;	

-- L2 EX1 Crie uma consulta que exiba o código do cliente, o nome do cliente e o número
-- dos seus pedidos ordenados pelo nome e posteriormente pelo código do pedido. Somente
-- devem ser exibidos os pedidos dos vendedores que possuem a faixa de comissão “A”. 
-- Linhas: 1749

SELECT 
	c.CodCliente,
	c.Nome,
	p.CodPedido
FROM cliente c
INNER JOIN (SELECT
		p.CodPedido,
		p.CodCliente 
	FROM pedido p
	INNER JOIN vendedor v 
	ON p.CodVendedor = v.CodVendedor
	WHERE v.FaixaComissao = 'A') AS p
ON c.CodCliente = p.CodCliente
ORDER BY c.Nome, p.CodPedido;

-- L2 EX2 Crie uma consulta que exiba o nome do cliente, endereço, cidade, UF, CEP,
-- código do pedido e prazo de entrega dos pedidos que NÃO sejam de vendedores que
-- ganham menos de R$ 1500,00. Linhas: 5109

SELECT 
	c.Nome,
	c.Endereco,
	c.Cidade,
	c.Uf,
	c.Cep,
	p.CodPedido,
	p.PrazoEntrega 
FROM cliente c 
INNER JOIN pedido p 
ON c.CodCliente = p.CodCliente 
WHERE p.CodVendedor IN (SELECT 
		v.CodVendedor 
	FROM vendedor v 
	WHERE v.SalarioFixo >= 1500);

-- L2 EX3 Crie uma consulta que exiba o nome do cliente, cidade e estado, dos clientes 
-- que fizeram algum pedido no ano de 2015. Ordene os resultados pelos nomes dos clientes
-- em ordem alfabética. Linhas: 1291

SELECT 
	c.Nome,
	c.Cidade,
	c.Uf 
FROM cliente c 
WHERE c.CodCliente IN (SELECT 
		p.CodCliente 
	FROM pedido p
	WHERE YEAR(p.DataPedido) = 2015
	GROUP BY p.CodCliente)
ORDER BY c.Nome;

-- L2 EX4 Crie uma consulta que exiba o código do pedido e o somatório da quantidade de
-- itens desse pedido. Devem ser exibidos somente os pedidos em que o somatório das 
-- quantidades de itens de um pedido seja maior que a média da quantidade de itens 
-- de todos os pedidos. Linhas: 2508

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

-- L2 EX5 Anulada.

-- L2 EX6* Crie uma consulta que exiba o nome do cliente, o nome do vendedor de seu
-- primeiro pedido e o estado do cliente. Devem ser exibidos apenas os clientes de 
-- Santa Cataria e apenas o primeiro vendedor. Linhas: 55 

SELECT 
	c.Nome as NomeCliente,
	vp.Nome as NomeVendedor,
	c.Uf
FROM cliente c 
INNER JOIN (SELECT
		p.CodCliente,
		p.CodPedido,
		v.Nome
	FROM pedido p 
	INNER JOIN vendedor v 
	ON p.CodVendedor = v.CodVendedor
	GROUP BY p.CodPedido
	ORDER BY p.DataPedido DESC) as vp
ON c.CodCliente = vp.CodCliente
WHERE c.Uf = 'SC'
GROUP BY c.CodCliente
ORDER BY NomeCliente;

-- L2 EX7 Selecione o nome do produto e o valor unitário dos produtos que possuem o 
-- valor unitário maior que todos os produtos que comecem com a letra L. A lista deve
-- ser ordenada em ordem alfabética. Linhas: 192

SELECT 
	p.Descricao,
	p.ValorUnitario 
FROM produto p 
WHERE p.ValorUnitario > (SELECT 
		MAX(p.ValorUnitario)
	FROM produto p
	WHERE SUBSTRING(p.Descricao, 1, 1) = 'L' )
	GROUP BY p.CodProduto
ORDER BY p.Descricao;

-- L2 EX8 Selecione o código do produto, o nome do produto e o valor unitário dos produtos
-- que possuam pelo menos um pedido com mais de 9 itens em sua quantidade. A lista deve ser
-- ordenada pelo valor unitário em ordem decrescente. Linhas: 3063

SELECT 
	pr.*
FROM produto pr
INNER JOIN (
	SELECT 
		ip.CodProduto,
		COALESCE(MAX(ip.Quantidade), 0) as QuantidadeMaxima
	FROM itempedido ip
	GROUP BY ip.CodProduto) AS p
ON pr.CodProduto = p.CodProduto
WHERE p.QuantidadeMaxima > 9
ORDER BY pr.ValorUnitario DESC;

-- L2 EX9 Selecione o código do vendedor e o nome dos vendedores que não tenham vendido nenhum
-- pedido com prazo de entrega em Agosto de 2015. A lista deve ser ordenada pelo nome dos vendedores
-- em ordem alfabética. Linhas: 101

SELECT 
	v.CodVendedor,
	v.Nome
FROM vendedor v 
WHERE v.CodVendedor NOT IN (SELECT 
		DISTINCT p.CodVendedor 
	FROM pedido p
	WHERE YEAR(p.PrazoEntrega) = 2015 
	AND MONTH(p.PrazoEntrega) = 8)
ORDER BY v.Nome;

-- L2 EX10 Selecione o código do cliente e o nome dos clientes que tenham feitos pedidos
-- em Abril de 2014. A lista deve ser ordenada pelo nome dos clientes em ordem alfabética. 
-- Linhas: 208

SELECT 
	c.CodCliente,
	c.Nome
FROM cliente c 
WHERE c.CodCliente IN (SELECT 
		DISTINCT p.CodCliente
	FROM pedido p
	WHERE YEAR(p.DataPedido) = 2014
	AND MONTH(p.DataPedido) = 4)
ORDER BY c.Nome;

-- L3 EX1 Exiba o nome, endereço, cidade e o CEP dos clientes que moram em Santa Catarina 
-- e que tenham pelo menos um pedido feito onde o prazo de entrega é entre 16 e 20 dias. Linhas: 59

SELECT 
	c.Nome,
	c.Endereco,
	c.Cidade,
	c.Cep
FROM cliente c
WHERE c.CodCliente IN (SELECT 
		DISTINCT p.CodCliente 
	FROM pedido p
	WHERE DATEDIFF(p.PrazoEntrega, p.DataPedido) >= 16
	AND DATEDIFF(p.PrazoEntrega, p.DataPedido) <= 20)
AND c.Uf = 'SC';

-- L3 EX2 Exiba o nome, endereço, cidade e o CEP dos clientes que moram no Rio Grande do Sul e
-- tenham pedidos realizados por algum vendedor que tenha o nome iniciando com a letra A. 
-- Além disso deve ser exibido apenas os clientes que tiveram pedidos no ano de 2015. 
-- A lista deve estar ordenada em ordem alfabética e sem clientes repetidos. Linhas: 9

SELECT 
	c.Nome,
	c.Endereco,
	c.Cidade,
	c.Cep
FROM cliente c
WHERE c.CodCliente IN (SELECT 
		DISTINCT p.CodCliente
	FROM pedido p
	INNER JOIN vendedor v 
	ON p.CodVendedor = v.CodVendedor 
	WHERE YEAR(p.DataPedido) = 2015
	AND SUBSTRING(v.Nome, 1, 1) = 'A')
AND c.Uf = 'RS'
ORDER BY c.Nome;














