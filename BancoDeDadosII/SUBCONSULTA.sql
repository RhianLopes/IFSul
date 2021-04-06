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

-- L3 EX3 Exiba o nome, salário e a faixa de comissão dos vendedores que recebem mais
-- que R$ 1800,00 que tenham realizado algum pedido em Dezembro de 2014 para clientes
-- que moram ou em Santa Catarina ou no Rio Grande do Sul. (2 sub-consultas). Linhas: 7

SELECT 
	v.Nome,
	v.SalarioFixo,
	v.FaixaComissao
FROM vendedor v 
WHERE v.CodVendedor IN (
	SELECT 
		DISTINCT p.CodVendedor 
	FROM pedido p 
	WHERE p.CodCliente IN (SELECT 
			c.CodCliente
		FROM cliente c  
		WHERE c.Uf IN ('SC', 'RS'))
	AND YEAR(p.DataPedido) = 2014
	AND MONTH(p.DataPedido) = 12)
AND v.FaixaComissao IN ('B', 'A');

-- L3 EX4 Exiba um ranking contendo o nome e o total de vendas efetuadas por vendedor
-- durante o ano de 2015. Note que não devem aparecer vendedores que efetuaram nenhuma 
-- venda no ano. Linhas: 244

SELECT 
	v.Nome,
	p.Total
FROM vendedor v 
INNER JOIN (SELECT
		COUNT(*) AS Total,
		p.CodVendedor
	FROM pedido p
	WHERE YEAR(p.DataPedido) = 2015
	GROUP BY p.CodVendedor) AS p
ON v.CodVendedor = p.CodVendedor
ORDER BY p.Total DESC;

-- L3 EX5 Anulado.

-- L3 EX6 Exiba o nome e a comissão dos vendedores. A consulta externa deverá ser na tabela
-- vendedor e existem duas sub-consultas (uma dentro da outra). A lista deve ser ordenada pelo
-- valor das comissões. Além disso, as comissões devem ter o valor exibido arredondado
-- (2 números depois da vírgula), a comissão para todos os vendedores é 10% do total vendido.
-- Linhas: 246

SELECT 
	v.Nome,
	COALESCE(p.Total, ROUND(0.00, 2)) AS comissao_dos_vendedores
FROM vendedor v 
LEFT JOIN (SELECT 
		p.CodVendedor,
		ROUND(SUM(COALESCE(((pr.ValorUnitario * ip.Quantidade) * 0.1), 0.00)), 2) as Total
	FROM pedido p
	INNER JOIN itempedido ip 
		ON p.CodPedido = ip.CodPedido
	INNER JOIN produto pr 
		ON ip.CodProduto = pr.CodProduto
	GROUP BY p.CodVendedor) as p
ON v.CodVendedor = p.CodVendedor
ORDER BY comissao_dos_vendedores ASC;

-- L3 EX7 Exiba um ranking com o nome do cliente e o total comprado por este cliente no ano
-- de 2015. Os clientes que devem integrar o ranking devem morar no Rio Grande do Sul ou
-- em Santa Catarina. Além disso, o total devem ter o valor exibido arredondado (2 números 
-- depois da vírgula). A consulta externa é em cliente. Linhas: 117

SELECT 
	c.Nome,
	COALESCE(p.Total, ROUND(0.00, 2)) AS total_comprado
FROM cliente c 
LEFT JOIN (SELECT 
		p.CodCliente,
		ROUND(SUM(COALESCE((pr.ValorUnitario * ip.Quantidade), 0.00)), 2) as Total
	FROM pedido p
	INNER JOIN itempedido ip 
		ON p.CodPedido = ip.CodPedido
	INNER JOIN produto pr 
		ON ip.CodProduto = pr.CodProduto
	WHERE YEAR(p.DataPedido) = 2015
	GROUP BY p.CodCliente) as p
ON c.CodCliente = p.CodCliente
WHERE c.Uf IN ('SC', 'RS');

-- L3 EX8 Exiba um ranking com o nome do vendedor e o total vendido por ele no ano de 2014.
-- Além disso, o total devem ter o valor exibido arredondado (2 números depois da vírgula).
-- A consulta externa é em vendedor. Linhas: 246

SELECT 
	v.Nome,
	COALESCE(p.Total, 0)
FROM vendedor v 
LEFT JOIN (SELECT 
		p.CodVendedor,
		ROUND(SUM(pr.ValorUnitario * ip.Quantidade), 2) as Total
	FROM pedido p
	INNER JOIN itempedido ip 
		ON p.CodPedido = ip.CodPedido
	INNER JOIN produto pr 
		ON ip.CodProduto = pr.CodProduto
	WHERE YEAR(p.DataPedido) = 2014
	GROUP BY p.CodVendedor) AS p 
ON v.CodVendedor = p.CodVendedor
ORDER BY v.Nome;

-- L3 EX9 Exiba o código do produto, nome e a quantidade vendida dos produtos que tiveram 
-- pedidos entre os dias 12/08/2014 e 27/10/2014. Os resultados devem ser ordenados pela 
-- quantidade e a consulta externa é na tabela produto. Linhas: 770

SELECT 
	pr.CodProduto,
	pr.Descricao,
	p.Total
FROM produto pr
INNER JOIN (SELECT
		ip.CodProduto,
		SUM(ip.Quantidade) AS Total
	FROM itempedido ip 
	INNER JOIN pedido p 
	ON ip.CodPedido = p.CodPedido
	WHERE (p.DataPedido BETWEEN '2014-08-12' AND '2014-10-27')
	GROUP BY ip.CodProduto) AS p
ON pr.CodProduto = p.CodProduto
ORDER BY p.Total DESC;
	
-- L3 EX10 Crie uma consulta que retorne o nome do cliente e o total comprado por este
-- no ano de 2014 e no ano de 2015. A consulta também deve retornar o saldo da diferença
-- entre o total comprado no ano de 2015 e o total de 2014, ordenada por este saldo. 
-- Não preocupe-se com os saldos que por eventualidade possuam o valor null. 
-- DICA: a sub-consulta será no lugar de uma tabela, ademais podem haver várias sub-consultas 
-- para as colunas desta tabela. Linhas: 1576

SELECT 
	c.Nome,
	COALESCE(p2.Total, 0) AS t_2014,
	COALESCE(p1.Total, 0) AS t_2015,
	ABS(COALESCE(p1.Total, 0) - COALESCE(p2.Total, 0)) AS Diferenca
FROM cliente c 
LEFT JOIN (SELECT 
		p.CodCliente,
		COALESCE(SUM(ip.Quantidade * pr.ValorUnitario), 0) AS Total
	FROM pedido p
	INNER JOIN itempedido ip 
	ON p.CodPedido = ip.CodPedido
	INNER JOIN produto pr 
	ON ip.CodProduto = pr.CodProduto
	WHERE YEAR(p.DataPedido) = 2015
	GROUP BY p.CodCliente) AS p1
ON c.CodCliente = p1.CodCliente
LEFT JOIN (SELECT 
		p.CodCliente,
		COALESCE(SUM(ip.Quantidade * pr.ValorUnitario), 0) AS Total
	FROM pedido p
	INNER JOIN itempedido ip 
	ON p.CodPedido = ip.CodPedido
	INNER JOIN produto pr 
	ON ip.CodProduto = pr.CodProduto
	WHERE YEAR(p.DataPedido) = 2014
	GROUP BY p.CodCliente) AS p2
ON c.CodCliente = p2.CodCliente
ORDER BY Diferenca DESC;

-- L4 EX1 Exiba o código, o nome e o valor unitário dos produtos que tiveram mais que 9 
-- unidades vendidas em apenas um pedido (note que não é o somatório total de unidades
-- vendidas é apenas em um único pedido). Linhas: 3063

SELECT 
	pr.CodProduto,
	pr.Descricao,
	pr.ValorUnitario
FROM produto pr
WHERE pr.CodProduto IN (SELECT
		DISTINCT ip.CodProduto 
	FROM itempedido ip
	WHERE ip.Quantidade > 9
	GROUP BY ip.CodPedido);

-- L4 EX2 Exiba o código, o nome do cliente, o endereço, a cidade, o cep, o estado e a
-- IE dos clientes que efetuaram pedidos entre 25/09/2014 e 05/10/2015. Linhas: 1312

SELECT 
	c.CodCliente,
	c.Nome,
	c.Endereco,
	c.Cidade,
	c.Cep,
	c.Uf,
	c.Ie
FROM cliente c
WHERE c.CodCliente IN (SELECT
		DISTINCT p.CodCliente
	FROM pedido p
	WHERE p.DataPedido BETWEEN '2014-09-25' AND '2015-10-05')
	
-- L4 EX3 Exiba o código, o nome do cliente, o endereço, a cidade, o estado e a quantidade de 
-- pedidos de todos os clientes ao longo do histórico da loja. Ordene a lista pela quantidade 
-- de pedidos efetuados pelos clientes. Linhas: 1576

SELECT
	c.CodCliente,
	c.Nome,
	c.Endereco,
	c.Cidade,
	c.Uf,
	COALESCE(p.Total, 0) AS Total
FROM cliente c
LEFT JOIN (SELECT 
		p.CodCliente,
		COUNT(*) AS Total
	FROM pedido p
	GROUP BY p.CodCliente) AS p
ON c.CodCliente = p.CodCliente
ORDER BY Total DESC;

-- L4 EX4 Mostre o código do pedido, a data de entrega, a data do pedido, o código do cliente,
-- o código do vendedor e a quantidade total de unidades em cada pedido. Note que não é necessário
-- diferenciar os produtos. Ordene a lista pela quantidade total de unidades nos pedidos. Linhas: 8432

SELECT 
	p.CodPedido,
	p.PrazoEntrega,
	p.DataPedido,
	p.CodCliente,
	p.CodVendedor,
	COALESCE(ip.Total, 0) AS Total
FROM pedido p
LEFT JOIN (SELECT 
		ip.CodPedido,
		SUM(ip.Quantidade) AS Total
	FROM itempedido ip
	GROUP BY ip.CodPedido) AS ip
ON ip.CodPedido = p.CodPedido
ORDER BY Total DESC;

-- L4 EX5 Mostre todos os dados (código, descrição e valor unitário) dos produtos que nunca foram 
-- vendidos. Ordene pela ordem alfabética da descrição dos produtos. Linhas: 356

SELECT 
	pr.*
FROM produto pr
WHERE pr.CodProduto NOT IN (SELECT
		ip.CodProduto
	FROM itempedido ip
	GROUP BY ip.CodProduto)
ORDER BY pr.Descricao;

-- L4 EX6 Exiba o código, a descrição, o valor unitário e a quantidade de unidades vendidas de 
-- cada produto desde que a loja abriu. Ordene pelo somatório total de unidades vendidas. Linhas: 4407

SELECT 
	pr.*,
	COALESCE(ip.Total, 0) AS Total
FROM produto pr
INNER JOIN (SELECT
		ip.CodProduto,
		SUM(ip.Quantidade) AS Total
	FROM itempedido ip
	GROUP BY ip.CodProduto) AS ip
ON ip.CodProduto = pr.CodProduto
ORDER BY Total DESC;

-- L4 EX7 Exiba o código, o nome do cliente, o endereço, a cidade, o cep, o estado e a IE dos
-- clientes que efetuaram pedidos que contenham pelo menos um produto que custe menos de R$ 10,00. 
-- Linhas: 32

SELECT 
	c.CodCliente,
	c.Nome,
	c.Endereco,
	c.Cidade,
	c.Cep,
	c.Uf,
	c.Ie
FROM cliente c 
WHERE c.CodCliente IN (SELECT 
		DISTINCT p.CodCliente
	FROM pedido p
	INNER JOIN itempedido ip 
		ON p.CodPedido = ip.CodPedido
	INNER JOIN produto pr 
		ON ip.CodProduto = pr.CodProduto
	WHERE pr.ValorUnitario < 10
	GROUP BY p.CodPedido);

-- L4 EX8 Mostre os dados (código, nome, salário e faixa de comissão) dos vendedores que venderam 
-- algum produto que a descrição inicie com IPHONE 6 PLUS. Linhas: 22

SELECT 
	v.CodVendedor,
	v.Nome,
	v.SalarioFixo,
	v.FaixaComissao 
FROM vendedor v
WHERE v.CodVendedor IN (SELECT 
		DISTINCT p.CodVendedor 
	FROM pedido p
	INNER JOIN itempedido ip 
		ON p.CodPedido = ip.CodPedido
	INNER JOIN produto pr 
		ON ip.CodProduto = pr.CodProduto
	WHERE pr.Descricao LIKE 'IPHONE 6 PLUS%'
	GROUP BY p.CodPedido);

-- L4 EX9 Mostre os dados (código, descrição, valor unitário) dos produtos, bem como a quantidade
-- de pedidos que solicitaram esses produtos. Ordene a lista pela quantidade de pedidos de cada
-- produto (do maior para o menor). Linhas: 4763

SELECT 
	pr.*,
	COALESCE(p.Total, 0) AS Total
FROM produto pr
LEFT JOIN (SELECT
		DISTINCT ip.CodProduto,
		COUNT(*) as Total
	FROM itempedido ip
	GROUP BY ip.CodProduto) AS p
ON pr.CodProduto = p.CodProduto
ORDER BY Total DESC;

-- L4 EX10 Mostre o código, prazo de entrega, data do pedido, código do cliente, do vendedor e o
-- valor total (em reais) de todos os pedidos. Ordene a lista em ordem decrescente pelo valor total. 
-- Linhas: 8432



-- L4 EX12 Crie um ranking contendo o nome dos vendedores o valor total gasto por cada cliente na loja. 
-- Note que o valor total não é por pedido e sim por cliente (se um cliente efetuou mais de um pedido 
-- os valores devem ser somados). Ordene a lista pelo total gasto por cada cliente. Linhas: 6460

SELECT 
	v.Nome as NomeVendedor,
	p.Nome as NomeCliente,
	p.Total as Total
FROM vendedor v 
INNER JOIN (SELECT 
		p.CodVendedor,
		c.Nome,
		COALESCE(SUM(ip.Quantidade * pr.ValorUnitario), 0) as Total
	FROM cliente c
	LEFT JOIN pedido p 
		ON c.CodCliente = p.CodCliente
	INNER JOIN itempedido ip
		ON p.CodPedido = ip.CodPedido
	INNER JOIN produto pr 
		ON ip.CodProduto = pr.CodProduto
	GROUP BY p.CodCliente, p.CodVendedor) as p
ON p.CodVendedor = v.CodVendedor
ORDER BY Total DESC;



















