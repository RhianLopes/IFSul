use compubras;

-- 1 Mostrar a quantidade pedida para um determinado produto com um determinado
-- código a partir da tabela item de pedido.

select 
	p.codproduto,
	p.descricao,
	coalesce(SUM(ip.Quantidade ), 0) as total
from itempedido ip 
right join produto p on ip.codproduto = p.codproduto 	
group by ip.codproduto, p.codproduto
order by ip.codproduto;

-- 2 Listar a quantidade de produtos que cada pedido contém

select 
    p.codpedido,
    coalesce(sum(ip.quantidade), 0)
from pedido p 
left join itempedido ip on p.codpedido = ip.codpedido
group by p.codpedido
order by p.codpedido;

-- 3 Ver os pedidos de cada cliente, listando nome do cliente e número do pedido.

select 
	c.codcliente,
	c.nome,
    p.codpedido
from pedido p 
inner join cliente c
	on p.codcliente = c.codcliente
order by p.codpedido, c.codcliente;

-- 4 Listar todos os clientes com seus respectivos pedidos. Os clientes que não têm
-- pedidos também devem ser apresentados.
	
select 
	c.codcliente,
    c.nome,
    p.codpedido
from cliente c 
left join pedido p
	on c.codcliente = p.codcliente
order by c.codcliente, p.codpedido;

-- 5 Clientes com prazo de entrega superior a 10 dias e que pertençam aos estados do
-- Rio Grande do Sul ou Santa Catarina.

select 
	c.codcliente,
    c.nome
from cliente c 
inner join pedido p 
	on c.codcliente = p.codcliente
where c.uf = 'RS' 
    or c.uf = 'SC'
    and datediff(p.prazoentrega, p.datapedido) > 10
group by c.codcliente;

-- 6 Mostrar os clientes e seus respectivos prazos de entrega, ordenando do maior para
-- o menor.

select 
	c.codcliente, 
    c.nome, 
    p.prazoentrega
from cliente c 
inner join pedido p 
	on c.codcliente = p.codcliente 
order by p.prazoentrega desc;

-- 7 Apresentar os vendedores, em ordem alfabética, que emitiram pedidos com prazos
-- de entrega superiores a 15 dias e que tenham salários fixos iguais ou superiores a
-- R$ 1.000,00

select
	v.codvendedor,
    v.nome
from pedido p 
inner join vendedor v
	on p.codvendedor = v.codvendedor
where datediff(p.prazoentrega, p.datapedido) > 15
	and v.salariofixo >= 1000.00
group by v.codvendedor
order by v.nome;

-- 8 Os vendedores têm seu salário fixo acrescido de 20% da soma dos valores dos
-- pedidos. Faça uma consulta que retorne o nome dos funcionários e o total de
-- comissão, desses funcionários

select
	v.codvendedor,
    v.nome,
	coalesce(sum(ip.quantidade * pr.valorunitario) * 0.2, 0) as comissao
from vendedor v
left join pedido p
	on v.codvendedor = p.codvendedor
left join itempedido ip
	on ip.codpedido = p.codpedido
left join produto pr
	on ip.codproduto = pr.codproduto
group by v.codvendedor
order by comissao, v.codvendedor;

-- 9 Os clientes e os respectivos vendedores que fizeram algum pedido para esse
-- cliente, juntamente com a data do pedido.

select 
	c.codcliente,
	c.nome as cliente,
    v.codvendedor,
    v.nome as vendedor,
    p.datapedido
from cliente c
inner join pedido p 
	on p.codcliente = c.codcliente
inner join vendedor v
	on p.codvendedor = v.codvendedor
order by c.codcliente;

-- 10  Liste o nome do cliente e a quantidade de pedidos de cada cliente.

select 
	c.codcliente,
    c.nome,
    count(p.codpedido) as total
from cliente c 
left join pedido p 
	on p.codcliente = c.codcliente
group by c.codcliente
order by count(p.codpedido), c.codcliente;

-- 11  Liste o nome do cliente, o código do pedido e a quantidade total de produtos por
-- pedido.

select 
	c.codcliente,
    c.nome,
    p.codpedido,
    coalesce(sum(ip.quantidade), 0) as total
from cliente c
inner join pedido p 
	on p.codcliente = c.codcliente
left join itempedido ip
	on p.codpedido = ip.codpedido
group by p.codpedido
order by total, p.codpedido;

-- 12  Liste o nome do cliente, o código do pedido e o valor total do pedido

select
	c.codcliente,
    c.nome,
    p.codpedido,
	coalesce(sum(ip.quantidade * pr.valorunitario), 0) as total
from cliente c
inner join pedido p
	on c.codcliente = p.codcliente
left join itempedido ip
	on ip.codpedido = p.codpedido
left join produto pr
	on ip.codproduto = pr.codproduto
group by p.codpedido
order by p.codpedido;

-- 13 Liste os produtos, a quantidade vendida e a data dos pedidos realizados no mês de
-- maio de 2015, começando pelos mais vendidos.

select 
	pr.codproduto,
    pr.descricao,
    p.datapedido,
    coalesce(sum(ip.quantidade), 0) as total
from produto pr
left join itempedido ip
	on ip.codproduto = pr.codproduto
left join pedido p
	on p.codpedido = ip.codpedido
where month(p.datapedido) = 5
	and year(p.datapedido) = 2015
group by pr.codproduto, p.codpedido
order by total desc;

-- 14 Liste os produtos, do mais caro para o mais barato, dos pedidos no mês de junho
-- (considerando todos os anos)

select 
	pr.codproduto,
    pr.descricao,
    pr.valorunitario
from produto pr
left join itempedido ip
	on ip.codproduto = pr.codproduto
left join pedido p
	on p.codpedido = ip.codpedido
where month(p.datapedido) = 6
group by pr.codproduto
order by pr.valorunitario desc;

-- 15  Exiba a relação dos pedidos mais caros de todos os tempos. Esta relação deve
-- conter o nome do cliente, do vendedor, o código do pedido e o valor total do pedido.

select
    c.nome as cliente,
    v.nome as vendedor,
    p.codpedido,
	coalesce(sum(ip.quantidade * pr.valorunitario), 0) as total
from pedido p
left join cliente c
	on c.codcliente = p.codcliente
left join vendedor v
	on v.codvendedor = p.codvendedor
left join itempedido ip
	on ip.codpedido = p.codpedido
left join produto pr
	on ip.codproduto = pr.codproduto
group by p.codpedido
order by total desc;

-- 16 Exiba a relação com os melhores vendedores (considerando apenas a quantidade
-- de pedidos) para o mês de setembro (incluindo todos os anos). Exiba o nome do
-- vendedor, o ano e o número total de pedidos daquele ano

select
	v.nome,
    year(p.datapedido) as year,
	coalesce(count(p.codpedido), 0)  as total
from vendedor v
left join pedido p 
	on v.codvendedor = p.codvendedor
where month(p.datapedido) = 9
group by v.codvendedor, year
order by total desc, year desc;

-- 17 Liste o nome dos clientes e o total de pedidos de cada cliente, em ordem crescente
-- de pedidos. Os clientes sem pedidos também devem ser listados.
-- *** verificar resultado de 1576 da lista de respostas para 1575

select
	c.nome,
    coalesce(sum(p.codpedido), 0) as total
from cliente c 
inner join pedido p 
	on c.codcliente = p.codcliente
group by c.codcliente
order by total, c.nome;

-- 18 Exiba uma relação em ordem alfabética do código do cliente e nome dos clientes
-- que nunca fizeram nenhum pedido

select
	c.codcliente,
	c.nome
from cliente c 
left join pedido p 
	on c.codcliente = p.codcliente
where p.codpedido is null;

-- 19 Mostre o código do produto, a descrição e o valor total obtido por cada produto ao
-- longo da história da loja. Ordene a lista pelo valor total dos produtos. Observe que
-- mesmo os produtos que nunca foram vendidos devem ser exibidos.

select 
	pr.codproduto,
    pr.descricao,
    coalesce(sum(pr.valorunitario * ip.quantidade), 0) as total
from produto pr
left join itempedido ip
	on ip.codproduto = pr.codproduto
left join pedido p
	on p.codpedido = ip.codpedido
group by pr.codproduto
order by total desc;

-- 20 Mostre todos os dados dos vendedores e a quantidade total de pedidos efetuados
-- por cada vendedor. A relação deve contar apenas os vendedores de faixa de
-- comissão “A” e ordenados pela quantidade total de pedidos. Mesmo os vendedores
-- sem pedidos devem ser listados.

select
	v.*,
    coalesce(count(p.codpedido), 0) as total
from vendedor v
left join pedido p 
	on v.codvendedor = p.codvendedor
where v.faixacomissao = 'A'
group by v.codvendedor
order by total;

    





