-- Usando Trigger
-- Um gatilho é um tipo especial de procedimento armazenado executado automaticamente
-- quando um evento ocorre no servidor de banco de dados

-- EX: Ao incluir dados em uma tabela, atualize um log com data e hora

-- CREATE TRIGGER <TRIGGER'S NAME>
-- ON <TABLE'S NAME>
-- [FOR/AFTER/INSTEOD OF] [INSERT/UPDATE/DELETE]
-- AS <TRIGGER'S BODY>

-- FOR --> Executa ao mesmo tempo que o comando
-- AFTER --> Executa depois do comando
-- INSTEAD --> executa no lugar do comando

-- Criando tabela para testes
CREATE TABLE
	FATURAMENTO
( DATA_VENDA DATE NULL,
  TOTAL_VENDA FLOAT NULL)

-- Criando o trigger, onde a tabela os registros serao apagados e logo sera criada atualizando o valor do faturamento
CREATE TRIGGER TG_ITENS_VENDIDOS
ON [ITENS VENDIDOS]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	DELETE FROM
		FATURAMENTO;

	INSERT INTO FATURAMENTO (DATA_VENDA, TOTAL_VENDA)
	SELECT
		NOTAS.DATA AS DATA, 
		SUM([ITENS VENDIDOS].QUANTIDADE * [ITENS VENDIDOS].PRECO) AS TOTAL_VENDA
	FROM
		NOTAS
	INNER JOIN
		[ITENS VENDIDOS]
	ON	NOTAS.NUMERO = [ITENS VENDIDOS].NUMERO
	GROUP BY
		NOTAS.DATA;
END;

-- Inserindo uma nova nota
INSERT INTO
	NOTAS
( NUMERO, DATA, CPF, MATRICULA, IMPOSTO)
VALUES
( '0100', '2018-05-15', '147115670', '235', 0.18)

-- Inserindo Itens vendidos
-- Ao executar esses dois comandos o trigger sera executado!
INSERT INTO
	[ITENS VENDIDOS]
( NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
( '0100', '1000889', 100, 1)

INSERT INTO
	[ITENS VENDIDOS]
( NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
( '0100', '1002334', 100, 1)

-- Verificando o estado da tabela apos a nova venda feita
SELECT
	*
FROM
	FATURAMENTO

-- Inserindo uma nova nota
INSERT INTO
	NOTAS
( NUMERO, DATA, CPF, MATRICULA, IMPOSTO)
VALUES
( '0101', '2018-05-15', '147115670', '235', 0.18)

-- Inserindo Itens vendidos
-- Ao executar esses dois comandos o trigger sera executado!
INSERT INTO
	[ITENS VENDIDOS]
( NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
( '0101', '1000889', 100, 1)

INSERT INTO
	[ITENS VENDIDOS]
( NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
( '0101', '1002334', 100, 1)

-- Verificando o estado da tabela apos a nova venda feita
SELECT
	*
FROM
	FATURAMENTO

-- Inserindo uma nova nota
INSERT INTO
	NOTAS
( NUMERO, DATA, CPF, MATRICULA, IMPOSTO)
VALUES
( '0102', '2018-05-16', '147115670', '235', 0.18)

-- Inserindo Itens vendidos
-- Ao executar esses dois comandos o trigger sera executado!
INSERT INTO
	[ITENS VENDIDOS]
( NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
( '0102', '1000889', 100, 1.5)

INSERT INTO
	[ITENS VENDIDOS]
( NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
( '0102', '1002334', 100, 1)

-- Verificando o estado da tabela apos a nova venda feita
SELECT
	*
FROM
	FATURAMENTO

-- Apagando um registro para verificar a execucao do trigger 
DELETE FROM
	[ITENS VENDIDOS]
WHERE
	NUMERO = '0102'
	AND
	CODIGO = '1002334'

-- Verificando o estado da tabela apos a nova venda feita
SELECT
	*
FROM
	FATURAMENTO

-- Fazendo um update para verificar o funcionamento do trigger no update
UPDATE 
	[ITENS VENDIDOS]
SET
	QUANTIDADE = 300
WHERE
	NUMERO = '0102'
	AND
	CODIGO = '1000889'

-- Verificando o estado da tabela apos a nova venda feita
SELECT
	*
FROM
	FATURAMENTO




-- Construa uma TRIGGER, de nome TG_CLIENTES_IDADE, que atualize as idades dos clientes,
-- na tabela de clientes, toda vez que a tabela sofrer uma inclusão, alteração ou exclusão.

CREATE TRIGGER TG_CLIENTES_IDADE
ON CLIENTES
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	UPDATE 
		CLIENTES
	SET
		CLIENTES.IDADE = DATEDIFF(YEAR, [DATA NASCIMENTO], GETDATE());
END;