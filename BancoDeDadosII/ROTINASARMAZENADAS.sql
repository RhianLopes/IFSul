

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

-- L1 EX6 . Crie uma função que faça a comparação entre dois números inteiros. Caso os dois números sejam
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










