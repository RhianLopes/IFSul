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