

-- L1 EX1 Retorne o número mais o nome do mês em português (1 - Janeiro) de acordo com o parâmetro
-- informado que deve ser uma data. Para testar, crie uma consulta que retorne o cliente e mês de
-- venda (número e nome do mês).

DELIMITER $$
CREATE FUNCTION mes(d DATE) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
CASE MONTH(d)
WHEN 1 THEN RETURN '1 - Janeiro';
WHEN 2 THEN RETURN '2 - Fevereiro';
WHEN 3 THEN RETURN '3 - Março';
WHEN 4 THEN RETURN '4 - Abril';
WHEN 5 THEN RETURN '5 - Maio';
WHEN 6 THEN RETURN '6 - Junho';
WHEN 7 THEN RETURN '7 - Julho';
WHEN 8 THEN RETURN '8 - Agosto';
WHEN 9 THEN RETURN '9 - Setembro';
WHEN 10 THEN RETURN '10 - Outubro';
WHEN 11 THEN RETURN '11 - Novembro';
WHEN 12 THEN RETURN '12 - Dezembro';
ELSE RETURN '';
END CASE;
END;
DELIMITER ;

SELECT 
	p.CodPedido,
	c.Nome,
	mes(p.DataPedido) AS mes_pedido
FROM pedido p 
INNER JOIN cliente c 
ON p.CodCliente = c.CodCliente;

-- L1 EX2 Retorne o número mais o nome do dia da semana (0 - Segunda) em português, como parâmetro de
-- entrada receba uma data. Para testar, crie uma consulta que retorne o número do pedido, nome do
-- cliente e dia da semana para entrega (função criada).

DELIMITER $$
CREATE FUNCTION dia(d DATE) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
CASE DAYOFWEEK(d)
WHEN 2 THEN RETURN '0 - Segunda';
WHEN 3 THEN RETURN '1 - Terça';
WHEN 4 THEN RETURN '2 - Quarta';
WHEN 5 THEN RETURN '3 - Quinta';
WHEN 6 THEN RETURN '4 - Sexta';
WHEN 7 THEN RETURN '5 - Sábado';
WHEN 1 THEN RETURN '6 - Domingo';
ELSE RETURN '';
END CASE;
END;
DELIMITER ;


SELECT 
	p.CodPedido,
	c.Nome,
	dia(p.PrazoEntrega) AS dia_semana_entrega
FROM pedido p 
INNER JOIN cliente c 
ON p.CodCliente = c.CodCliente;


-- L1 EX3 Crie uma função para retornar o gentílico dos clientes de acordo com o estado onde moram
-- (gaúcho, catarinense ou paranaense), o parâmetro de entrada deve ser a sigla do estado. Para
-- testar a função crie uma consulta que liste o nome do cliente e gentílico (função criada).

DELIMITER $$
CREATE FUNCTION estado(uf VARCHAR(2)) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
CASE uf
WHEN 'RS' THEN RETURN 'Gaúcho';
WHEN 'SC' THEN RETURN 'Catarinense';
WHEN 'PR' THEN RETURN 'Paranaense';
ELSE RETURN 'N/A';
END CASE;
END;
DELIMITER ;

SELECT 
	c.Nome, 
	estado(c.Uf) AS gentilico
FROM cliente c;

SELECT 
	c.Nome, 
	estado(c.Uf) AS gentilico
FROM cliente c
WHERE c.Uf IN ('RS', 'SC', 'PR');

-- L1 EX4 Crie uma função que retorne a Inscrição Estadual no formato #######-##. Para testar a função
-- criada exiba os dados do cliente com a IE formatada corretamente utilizando a função criada.

DELIMITER $$
CREATE FUNCTION ie(ie VARCHAR(10)) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
RETURN CONCAT(SUBSTRING(ie, 1, 7), '-', SUBSTRING(ie, 8, 2));
END;
DELIMITER ;

SELECT 
	c.Nome,
	ie(c.Ie) AS ie
FROM cliente c;
	
-- L1 EX5 Crie uma função que retorne o tipo de envio do pedido, se for até 3 dias será enviado por SEDEX,
-- se for entre 3 e 7 dias deverá ser enviado como encomenda normal, caso seja maior que este prazo
-- deverá ser utilizado uma encomenda não prioritária. Como dados de entrada recebe a data do
-- pedido e o prazo de entrega e o retorno será um varchar. Note que para criar esta função você
-- deverá utilizar a cláusula IF.

DELIMITER $$
CREATE FUNCTION delivery(dp DATE, pe DATE) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
DECLARE e VARCHAR(20); 
IF DATEDIFF(pe, dp) < 3 THEN
	SET e = 'SEDEX';
ELSEIF DATEDIFF(pe, dp) >= 3 AND DATEDIFF(pe, dp) <= 7 THEN
	SET e = 'NORMAL';
ELSE 
	SET e = 'NÃO PRIORITÁRIA';
END IF;
RETURN e;
END;
DELIMITER ;

SELECT 
	p.CodPedido,
	p.DataPedido,
	p.PrazoEntrega,
	delivery(p.DataPedido, p.PrazoEntrega) AS tipo_envio
FROM pedido p;

-- L1 EX6 Crie uma função que faça a comparação entre dois números inteiros. Caso os dois números sejam
-- iguais a saída deverá ser “x é igual a y”, no qual x é o primeiro parâmetro e y o segundo parâmetro.
-- Se x for maior, deverá ser exibido “x é maior que y”. Se x for menor, deverá ser exibido “x é menor
-- que y”.

DELIMITER $$
CREATE FUNCTION comparexy(x INT, y INT) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
DECLARE e VARCHAR(20); 
IF x > y THEN
	SET e = 'x é maior que y';
ELSEIF y > x THEN
	SET e = 'x é menor que y';
ELSE 
	SET e = 'x é igual a y';
END IF;
RETURN e;
END;
DELIMITER ;

SELECT comparexy(2, 1);
-- x é maior que y

SELECT comparexy(1, 2);
-- x é menor que y

SELECT comparexy(1, 1);
-- x é menor que y

-- L1 EX7 Crie uma função que calcule a fórmula de bhaskara. Como parâmetro de entrada devem ser
-- recebidos 3 valores (a, b e c). Ao final a função deve retornar “Os resultados calculados são x e y”,
-- no qual x e y são os valores calculados.

DELIMITER $$
CREATE FUNCTION bask(a INT, b INT, c INT) RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN 
DECLARE x1 DOUBLE;
DECLARE x2 DOUBLE;
DECLARE x3 DOUBLE;
DECLARE x4 DOUBLE;
DECLARE x5 DOUBLE;
DECLARE x6 DOUBLE;
DECLARE x7 DOUBLE;
DECLARE x DOUBLE;
DECLARE y1 DOUBLE;
DECLARE y2 DOUBLE;
DECLARE y3 DOUBLE;
DECLARE y4 DOUBLE;
DECLARE y5 DOUBLE;
DECLARE y6 DOUBLE;
DECLARE y7 DOUBLE;
DECLARE y DOUBLE;
SET x3 = POW(b, 2); 
SET x2 = 4 * a * c;
SET x4 = x3 - x2;
SET x5 = SQRT(x4); 
SET x1 = -1 * ABS(b);
SET x7 = 2 * a;
SET x6 = x1 - x5; 
SET x = x6 / x7;
SET y3 = POW(b, 2); 
SET y2 = 4 * a * c;
SET y4 = y3 - y2;
SET y5 = SQRT(y4); 
SET y1 = -1 * ABS(b);
SET y7 = 2 * a;
SET y6 = y1 + y5; 
SET y = y6 / y7;
RETURN CONCAT("x: ", x, " y: ", y);
END;
DELIMITER ;

SELECT bask(1, 12, -13);
-- x: -13 y: 1

-- L1 EX8 Crie uma função que retorne o valor total do salário de um vendedor (salário fixo + comissão
-- calculada). Note que esta função deve receber 3 valores de entrada, salário fixo, faixa de comissão
-- e o valor total vendido. Para testar essa função crie uma consulta que exiba o nome do vendedor e
-- o salário total.

DELIMITER $$
CREATE FUNCTION salario(salario DOUBLE, faixa VARCHAR(1), total DOUBLE) RETURNS DOUBLE
DETERMINISTIC
BEGIN 
DECLARE comissao DOUBLE;	
CASE faixa
WHEN 'A' THEN SET comissao = total * 0.2;
WHEN 'B' THEN SET comissao = total * 0.15;
WHEN 'C' THEN SET comissao = total * 0.1;
WHEN 'D' THEN SET comissao = total * 0.05;
END CASE;
RETURN salario + comissao;
END;
DELIMITER ;

SELECT salario(1000.0, 'C', 10000.0);

-- L2 EX1 Crie uma função para calcular um aumento de 10% no salário dos vendedores de faixa de comissão
-- 'A’. Considere o valor do salário fixo para calcular este aumento. Faça uma consulta select
-- utilizando essa função.

DELIMITER $$
CREATE FUNCTION salario10A(salario DOUBLE, faixa VARCHAR(1)) RETURNS DOUBLE
DETERMINISTIC
BEGIN 
DECLARE sal DOUBLE; 
IF faixa = 'A' THEN
	SET sal = salario * 1.1;
ELSE 
	SET sal = salario;
END IF;
RETURN sal;
END;
DELIMITER ;

SELECT 
	v.Nome,
	v.SalarioFixo,
	salario10A(v.SalarioFixo, v.FaixaComissao) AS SalarioComComissao,
	v.FaixaComissao
FROM vendedor v;

-- L2 EX2 Crie uma função que retorne o código do produto com maior valor unitário.

DELIMITER $$
CREATE PROCEDURE produtoMaiorValor()
BEGIN 
SELECT p.CodProduto FROM produto p ORDER BY p.ValorUnitario DESC LIMIT 1;
END;
DELIMITER ;

CALL produtoMaiorValor();

-- L2 EX3 Crie uma função que retorne o código, a descrição e o valor do produto com maior valor unitário. Os
-- valores devem ser retornados em uma expressão: “O produto com código XXX – XXXXXXXXX
-- (descrição) possui o maior valor unitário R$XXXX,XX”. Crie um select que utiliza esta função

DELIMITER $$
CREATE PROCEDURE produtoCompletoMaiorValor()
BEGIN 
SELECT 
	CONCAT('O produto com código ', p.CodProduto, ' - ', p.Descricao, ' possui o maior valor unitário R$ ', p.ValorUnitario) AS produto_completo_maior_valor
FROM produto p 
ORDER BY p.ValorUnitario DESC 
LIMIT 1;
END;
DELIMITER ;

CALL produtoCompletoMaiorValor();

-- L2 EX4 Crie uma função que receba como parâmetros o código do produto com maior valor unitário e o
-- código do produto com menor valor unitário. Retorne a soma dos dois.

DELIMITER $$
CREATE PROCEDURE somaMaiorEMenorValorProduto(CodMaior INT, CodMenor INT)
BEGIN 
SELECT 
	SUM(p.ValorUnitario) AS soma_valor_maior_e_menor_valor_produtos
FROM produto p 
WHERE p.CodProduto IN (CodMaior, CodMenor);
END;
DELIMITER ;

CALL somaMaiorEMenorValorProduto(1470, 632);

-- L2 EX5 Crie uma função que retorne a média do valor unitário dos produtos. Crie uma consulta que utilize
-- esta função.

DELIMITER $$
CREATE PROCEDURE mediaValorProdutos()
BEGIN 
SELECT 
	AVG(p.ValorUnitario) AS media_valor_produtos
FROM produto p;
END;
DELIMITER ;

CALL mediaValorProdutos();

-- L2 EX6 Faça uma função que retorna o código do cliente com a maior quantidade de pedidos um ano/mês.
-- Observe que a função deverá receber como parâmetros um ano e um mês. Deve ser exibido a
-- seguinte expressão: “O cliente XXXXXXX (cód) – XXXXXXX (nome) foi o cliente que fez a maior
-- quantidade de pedidos no ano XXXX mês XX com um total de XXX pedidos”.

DELIMITER $$
CREATE PROCEDURE maiorQuantidadePedidosPorCliente(ano INT, mes INT)
BEGIN 
SELECT 
 CONCAT('O cliente ', c.CodCliente, ' (cód) – ', c.Nome, ' (nome) foi o cliente que fez a maior quantidade de pedidos no ano ', ano, ' mês ', mes, ' com um total de ', p.Total, ' pedidos') AS maior_quantidade_pedidos_por_cliente 
FROM cliente c
INNER JOIN (SELECT
		p.CodCliente,
		COUNT(p.CodPedido) AS Total
	FROM pedido p
	WHERE YEAR(p.DataPedido) = ano
	AND MONTH(p.DataPedido) = mes
	GROUP BY p.CodCliente
	ORDER BY Total DESC
	LIMIT 1) AS p
ON p.CodCliente = c.CodCliente;
END;
DELIMITER ;

CALL maiorQuantidadePedidosPorCliente(2014, 4);

-- L2 EX7 Faça uma função que retorna a soma dos valores dos pedidos feitos por um determinado cliente.
-- Note que a função recebe por parâmetro o código de uma cliente e retorna o valor total dos pedidos
-- deste cliente. Faça a consulta utilizando Joins.

DELIMITER $$
CREATE PROCEDURE somaValorPedidoPorCodCliente(codCliente INT)
BEGIN 
SELECT
	SUM(ip.Quantidade * pr.ValorUnitario) AS Total
FROM pedido p
INNER JOIN itempedido ip
ON p.CodPedido = ip.CodPedido
INNER JOIN produto pr
ON pr.CodProduto = ip.CodProduto
WHERE p.CodCliente = codCliente;
END;
DELIMITER ;

CALL somaValorPedidoPorCodCliente(207);

-- L2 EX8 Crie 3 funções. A primeira deve retornar a soma da quantidade de produtos de todos os pedidos. A
-- segunda, deve retornar o número total de pedidos e a terceira a média dos dois valores. Por fim,
-- crie uma quarta função que chama as outras três e exibe todos os resultados concatenados.

DELIMITER $$
CREATE FUNCTION quantidadeProdutos() RETURNS INT
DETERMINISTIC
BEGIN 
DECLARE total INT; 
SET total = (SELECT SUM(ip.Quantidade) FROM itempedido ip);
RETURN total;
END;
DELIMITER ;

DELIMITER $$
CREATE FUNCTION quantidadePedidos() RETURNS INT
DETERMINISTIC
BEGIN 
DECLARE total INT; 
SET total = (SELECT COUNT(*) FROM pedido);
RETURN total;
END;
DELIMITER ;

DELIMITER $$
CREATE FUNCTION mediaProdutosXPedidos() RETURNS INT
DETERMINISTIC
BEGIN 
DECLARE totalProduto INT;
DECLARE totalPedido INT;
DECLARE total INT;
SET totalProduto = (SELECT quantidadeProdutos());
SET totalPedido = (SELECT quantidadePedidos());
SET total = totalProduto + totalPedido;
RETURN total / 2;
END;
DELIMITER ;

DELIMITER $$
CREATE FUNCTION mostrarMedias() RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN 
DECLARE totalProduto INT;
DECLARE totalPedido INT;
DECLARE total INT;
SET totalProduto = (SELECT quantidadeProdutos());
SET totalPedido = (SELECT quantidadePedidos());
SET total = (SELECT mediaProdutosXPedidos());
RETURN CONCAT('O total de produtos é ', totalProduto, ', o total de pedidos é ', totalPedido, ' e a média é ', total);
END;
DELIMITER ;

SELECT mostrarMedias();

-- L2 EX9 Crie uma função que retorna o código do vendedor com maior número de pedidos para um
-- determinado ano/mês. Observe que a função deverá receber como parâmetros um ano e um mês.
-- Deve ser exibido a seguinte expressão: “O vendedor XXXXXXX (cód) – XXXXXXX (nome) foi o
-- vendedor que efetuou a maior quantidade de vendas no ano XXXX mês XX com um total de XXX
-- pedidos”.

DELIMITER $$
CREATE PROCEDURE maiorVendasVendedorPorAnoEMes(ano INT, mes INT)
BEGIN 
SELECT 
	CONCAT('O vendedor ', v.CodVendedor, ' (cód) – ', v.Nome, ' (nome) foi o vendedor que efetuou a maior quantidade de vendas no ano ', ano, ' mês ', mes, ' com um total de ', p.Total, ' pedidos') AS maior_vendas_vendedor_por_ano_e_mes
FROM vendedor v
INNER JOIN (SELECT
		p.CodVendedor,
		COUNT(*) AS Total
	FROM pedido p 
	WHERE YEAR(p.DataPedido) = ano
	AND MONTH(p.DataPedido) = mes
	GROUP BY p.CodVendedor
	ORDER BY Total DESC
	LIMIT 1) AS p
ON v.CodVendedor = p.CodVendedor;
END;
DELIMITER ;

CALL maiorVendasVendedorPorAnoEMes(2014, 4);

-- L2 EX10 Crie uma função que retorne o nome e o endereço completo do cliente que fez o último
-- pedido na loja. (Pedido com a data mais recente).

DELIMITER $$
CREATE PROCEDURE nomeEEnderecoUltimoCliente()
BEGIN 
SELECT 
	CONCAT(c.Nome, ' - ', c.Endereco) AS nome_endereco_ultimo_cliente
FROM cliente c
WHERE c.CodCliente = (SELECT
		p.CodCliente
	FROM pedido p
	ORDER BY p.DataPedido DESC
	LIMIT 1);
END;
DELIMITER ;

CALL nomeEEnderecoUltimoCliente();

-- L2 EX11 Crie uma função que retorne a quantidade de pedidos realizados para clientes do Estado informado
-- (receber o estado como parâmetro).

DELIMITER $$
CREATE PROCEDURE totalPedidosPorEstado(uf VARCHAR(2))
BEGIN 
SELECT
	COUNT(*) AS total_pedidos_por_estado
FROM pedido p
INNER JOIN cliente c
ON p.CodCliente = c.CodCliente
WHERE c.Uf = 'RS';
END;
DELIMITER ;

CALL totalPedidosPorEstado('RS');

-- L2 EX12 Crie uma função que retorne o valor total que é gasto com os salários dos vendedores de certa faixa
-- de comissão. (Receber a faixa de comissão por parâmetro). Note que deve ser considerado o valor
-- total dos salários, incluindo a comissão.

DELIMITER $$
CREATE FUNCTION calcularComissaoPorFaixa(salario DOUBLE, faixa VARCHAR(1), total DOUBLE) RETURNS DOUBLE
DETERMINISTIC
BEGIN 
DECLARE comissao DOUBLE;	
CASE faixa
WHEN 'A' THEN SET comissao = total * 0.2;
WHEN 'B' THEN SET comissao = total * 0.15;
WHEN 'C' THEN SET comissao = total * 0.1;
WHEN 'D' THEN SET comissao = total * 0.05;
END CASE;
RETURN salario + comissao;
END;
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE totalGastoComSalarios(faixa VARCHAR(1))
BEGIN 
SELECT
	SUM(calcularComissaoPorFaixa(v.SalarioFixo, v.FaixaComissao, p.Total)) AS total_gasto_com_salarios
FROM vendedor v
INNER JOIN (SELECT
		p.CodVendedor,
		SUM(ip.Quantidade * pr.ValorUnitario) AS Total
	FROM pedido p
	INNER JOIN itempedido ip
	ON p.CodPedido = ip.CodPedido
	INNER JOIN produto pr
	ON pr.CodProduto = ip.CodProduto
	GROUP BY p.CodVendedor) AS p
ON v.CodVendedor = p.CodVendedor
WHERE v.FaixaComissao = faixa;
END;
DELIMITER ;

CALL totalGastoComSalarios('A');

-- L2 EX13 Crie uma função que mostre o cliente que fez o pedido mais caro da loja. O retorno da função
-- deverá ser: “O cliente XXXXXX efetuou o pedido XXXX (cód) em XXXX (data), o qual é o mais caro
-- registrado até o momento no valor total de R$XXXX,XX”.

DELIMITER $$
CREATE PROCEDURE maiorPedidoEfetuadoPorCliente()
BEGIN 
SELECT 
 CONCAT('O cliente ', c.Nome, ' efetuou o pedido ', p.CodPedido, ' (cód) em ', p.DataPedido, ' (data), o qual é o mais caro registrado até o momento no valor total de R$ ', p.Total) AS maior_pedido_efetuado_por_cliente
FROM cliente c
INNER JOIN (SELECT
		p.CodCliente,
		p.CodPedido,
		p.DataPedido,
		SUM(ip.Quantidade * pr.ValorUnitario) AS Total
	FROM pedido p
	INNER JOIN itempedido ip
	ON p.CodPedido = ip.CodPedido
	INNER JOIN produto pr
	ON pr.CodProduto = ip.CodProduto
	GROUP BY p.CodPedido
	ORDER BY Total DESC
	LIMIT 1) AS p
ON p.CodCliente = c.CodCliente;
END;
DELIMITER ;

CALL maiorPedidoEfetuadoPorCliente();


-- L2 EX14 Crie uma função que mostre o valor total arrecadado com apenas um determinado produto em toda
-- a história da loja. Esta função deverá receber como parâmetro o código do produto e retornar a
-- seguinte expressão: “O valor total arrecadado com o produto XXXXXX (descrição) foi de
-- R$XXXX,XX”.

DELIMITER $$
CREATE PROCEDURE valorArrecadadoPorProduto(CodProduto INT) 
BEGIN 
SELECT
	SUM(pr.ValorUnitario * ip.Quantidade) AS valor_arrecadado_por_produto
FROM produto pr
INNER JOIN itempedido ip 
ON ip.CodProduto = pr.CodProduto
WHERE ip.CodProduto = CodProduto;
END;
DELIMITER ;

CALL valorArrecadadoPorProduto(25);

-- L2 EX15 Crie uma função que mostre a quantidade total vendida para um determinado produto. A função
-- deverá receber como parâmetro o código do produto e retornar a quantidade total de itens que
-- foram vendidos para este produto.

DELIMITER $$
CREATE PROCEDURE quantidadeVendidaPorProduto(CodProduto INT) 
BEGIN 
SELECT
	SUM(ip.Quantidade) AS quantidade_vendida_por_produto
FROM itempedido ip
WHERE ip.CodProduto = CodProduto;
END;
DELIMITER ;

CALL quantidadeVendidaPorProduto(25);












