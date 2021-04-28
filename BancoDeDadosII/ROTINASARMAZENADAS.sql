

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


-- L1 EX3 Retorne o número mais o nome do dia da semana (0 - Segunda) em português, como parâmetro de
-- entrada receba uma data. Para testar, crie uma consulta que retorne o número do pedido, nome do
-- cliente e dia da semana para entrega (função criada).






