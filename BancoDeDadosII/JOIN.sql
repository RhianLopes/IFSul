USE compubras;

-- 1 Mostrar a quantidade pedida para um determinado produto com um determinado
-- código a partir da tabela item de pedido.

SELECT 
	p.codproduto,
	p.descricao,
	COALESCE(SUM(ip.Quantidade ), 0) AS total
FROM itempedido ip 
RIGHT JOIN produto p ON ip.codproduto = p.codproduto 	
GROUP BY ip.codproduto, p.codproduto
ORDER BY ip.codproduto;

-- 2 Listar a quantidade de produtos que cada pedido contém

SELECT 
    p.codpedido,
    COALESCE(sum(ip.quantidade), 0)
FROM pedido p 
LEFT JOIN itempedido ip ON p.codpedido = ip.codpedido
GROUP BY p.codpedido
ORDER BY p.codpedido;

-- 3 Ver os pedidos de cada cliente, listando nome do cliente e número do pedido.

SELECT 
	c.codcliente,
	c.nome,
    p.codpedido
FROM pedido p 
INNER JOIN cliente c
	ON p.codcliente = c.codcliente
ORDER BY p.codpedido, c.codcliente;

-- 4 Listar todos os clientes com seus respectivos pedidos. Os clientes que não têm
-- pedidos também devem ser apresentados.
	
SELECT 
	c.codcliente,
    c.nome,
    p.codpedido
FROM cliente c 
LEFT JOIN pedido p
	ON c.codcliente = p.codcliente
ORDER BY p.codpedido, c.codcliente;

-- 5 Clientes com prazo de entrega superior a 10 dias e que pertençam aos estados do
-- Rio Grande do Sul ou Santa Catarina.

SELECT 
	c.codcliente,
    c.nome
FROM cliente c 
INNER JOIN pedido p 
	ON c.codcliente = p.codcliente
WHERE c.uf IN ('RS', 'SC') 
    AND datediff(p.prazoentrega, p.datapedido) > 10
GROUP BY c.codcliente;

-- 6 Mostrar os clientes e seus respectivos prazos de entrega, ordenando do maior para
-- o menor.

SELECT 
	c.codcliente, 
    c.nome, 
    p.prazoentrega
FROM cliente c 
INNER JOIN pedido p 
	ON c.codcliente = p.codcliente 
ORDER BY p.prazoentrega DESC, c.CodCliente;

-- 7 Apresentar os vendedores, em ordem alfabética, que emitiram pedidos com prazos
-- de entrega superiores a 15 dias e que tenham salários fixos iguais ou superiores a
-- R$ 1.000,00

SELECT
	v.codvendedor,
    v.nome
FROM pedido p 
INNER JOIN vendedor v
	ON p.codvendedor = v.codvendedor
WHERE datediff(p.prazoentrega, p.datapedido) > 15
	AND v.salariofixo >= 1000.00
GROUP BY v.codvendedor
ORDER BY v.nome, v.CodVendedor;

-- 8 Os vendedores têm seu salário fixo acrescido de 20% da soma dos valores dos
-- pedidos. Faça uma consulta que retorne o nome dos funcionários e o total de
-- comissão, desses funcionários

SELECT
	v.codvendedor,
    v.nome,
	COALESCE(sum(ip.quantidade * pr.valorunitario) * 0.2, 0) AS comissao
FROM vendedor v
LEFT JOIN pedido p
	ON v.codvendedor = p.codvendedor
LEFT JOIN itempedido ip
	ON ip.codpedido = p.codpedido
LEFT JOIN produto pr
	ON ip.codproduto = pr.codproduto
GROUP BY v.codvendedor
ORDER BY comissao;

-- 9 Os clientes e os respectivos vendedores que fizeram algum pedido para esse
-- cliente, juntamente com a data do pedido.

SELECT 
	c.CodCliente,
	c.nome AS cliente,
    v.CodVendedor,
    v.nome AS vendedor,
    p.datapedido
FROM cliente c
INNER JOIN pedido p 
	ON p.codcliente = c.codcliente
INNER JOIN vendedor v
	ON p.codvendedor = v.codvendedor
ORDER BY c.codcliente, v.CodVendedor;

-- 10  Liste o nome do cliente e a quantidade de pedidos de cada cliente.

SELECT 
	c.codcliente,
    c.nome,
    COUNT(p.codpedido) AS total
FROM cliente c 
LEFT JOIN pedido p 
	ON p.codcliente = c.codcliente
GROUP BY c.codcliente
ORDER BY total, c.codcliente;

-- 11  Liste o nome do cliente, o código do pedido e a quantidade total de produtos por
-- pedido.

SELECT 
	c.codcliente,
    c.nome,
    p.codpedido,
    COALESCE(SUM(ip.quantidade), 0) AS total
FROM cliente c
INNER JOIN pedido p 
	ON p.codcliente = c.codcliente
LEFT JOIN itempedido ip
	ON p.codpedido = ip.codpedido
GROUP BY p.codpedido
ORDER BY total, p.codpedido;

-- 12  Liste o nome do cliente, o código do pedido e o valor total do pedido

SELECT
	c.codcliente,
    c.nome,
    p.codpedido,
	COALESCE(SUM(ip.quantidade * pr.valorunitario), 0) AS total
FROM cliente c
INNER JOIN pedido p
	ON c.codcliente = p.codcliente
LEFT JOIN itempedido ip
	ON ip.codpedido = p.codpedido
LEFT JOIN produto pr
	ON ip.codproduto = pr.codproduto
GROUP BY p.codpedido
ORDER BY p.codpedido;

-- 13 Liste os produtos, a quantidade vendida e a data dos pedidos realizados no mês de
-- maio de 2015, começando pelos mais vendidos.

SELECT 
	pr.codproduto,
    pr.descricao,
    p.datapedido,
    COALESCE(SUM(ip.quantidade), 0) AS total
FROM produto pr
LEFT JOIN itempedido ip
	ON ip.codproduto = pr.codproduto
LEFT JOIN pedido p
	ON p.codpedido = ip.codpedido
WHERE MONTH(p.datapedido) = 5
	AND YEAR(p.datapedido) = 2015
GROUP BY pr.codproduto, p.codpedido
ORDER BY total DESC;

-- 14 Liste os produtos, do mais caro para o mais barato, dos pedidos no mês de junho
-- (considerando todos os anos)

SELECT  
	pr.codproduto,
    pr.descricao,
    pr.valorunitario
FROM produto pr
LEFT JOIN itempedido ip
	ON ip.codproduto = pr.codproduto
LEFT JOIN pedido p
	ON p.codpedido = ip.codpedido
WHERE MONTH(p.datapedido) = 6
GROUP BY pr.codproduto
ORDER BY pr.valorunitario DESC;

-- 15  Exiba a relação dos pedidos mais caros de todos os tempos. Esta relação deve
-- conter o nome do cliente, do vendedor, o código do pedido e o valor total do pedido.

SELECT
    c.nome AS cliente,
    v.nome AS vendedor,
    p.codpedido,
	COALESCE(SUM(ip.quantidade * pr.valorunitario), 0) AS total
FROM pedido p
LEFT JOIN cliente c
	on c.codcliente = p.codcliente
LEFT JOIN vendedor v
	on v.codvendedor = p.codvendedor
LEFT JOIN itempedido ip
	on ip.codpedido = p.codpedido
LEFT JOIN produto pr
	ON ip.codproduto = pr.codproduto
GROUP BY p.codpedido
ORDER BY total desc;

-- 16 Exiba a relação com os melhores vendedores (considerando apenas a quantidade
-- de pedidos) para o mês de setembro (incluindo todos os anos). Exiba o nome do
-- vendedor, o ano e o número total de pedidos daquele ano

SELECT
	v.nome,
    YEAR(p.datapedido) as year,
	COALESCE(COUNT(p.codpedido), 0) AS total
FROM vendedor v
LEFT JOIN pedido p 
	ON v.codvendedor = p.codvendedor
WHERE MONTH(p.datapedido) = 9
GROUP BY v.codvendedor, year
ORDER BY year DESC, total DESC, v.Nome;

-- 17 Liste o nome dos clientes e o total de pedidos de cada cliente, em ordem crescente
-- de pedidos. Os clientes sem pedidos também devem ser listados.

SELECT
	c.nome,
    COUNT(p.codpedido) AS total
FROM cliente c 
LEFT JOIN pedido p 
	ON c.codcliente = p.codcliente
GROUP BY c.codcliente
ORDER BY total, c.nome;

-- 18 Exiba uma relação em ordem alfabética do código do cliente e nome dos clientes
-- que nunca fizeram nenhum pedido

SELECT
	c.nome,
	c.codcliente
FROM cliente c 
LEFT JOIN pedido p 
	ON c.codcliente = p.codcliente
WHERE p.codpedido IS NULL
ORDER BY c.nome;

-- 19 Mostre o código do produto, a descrição e o valor total obtido por cada produto ao
-- longo da história da loja. Ordene a lista pelo valor total dos produtos. Observe que
-- mesmo os produtos que nunca foram vendidos devem ser exibidos.

SELECT 
	pr.codproduto,
    pr.descricao,
    COALESCE(SUM(pr.valorunitario * ip.quantidade), 0) AS total
FROM produto pr
LEFT JOIN itempedido ip
	ON ip.codproduto = pr.codproduto
GROUP BY pr.codproduto
ORDER BY total DESC;

-- 20 Mostre todos os dados dos vendedores e a quantidade total de pedidos efetuados
-- por cada vendedor. A relação deve contar apenas os vendedores de faixa de
-- comissão “A” e ordenados pela quantidade total de pedidos. Mesmo os vendedores
-- sem pedidos devem ser listados.

SELECT
	v.CodVendedor,
	v.Nome,
	v.FaixaComissao,
	v.SalarioFixo,
    COALESCE(COUNT(p.codpedido), 0) AS total
FROM vendedor v
LEFT JOIN pedido p 
	ON v.codvendedor = p.codvendedor
WHERE v.faixacomissao = 'A'
GROUP BY v.codvendedor
ORDER BY total;
