-- Usando DELETE

-- DELETE FROM <TABLE'S NAME> WHERER <CONDITION>

SELECT * from [PRODUTOS] WHERE SUBSTRING([DESCRITOR],1,15) = 'Sabor dos Alpes'

-- Apagando os produtos com o codigo 101000
DELETE FROM
	PRODUTOS
WHERE
	CODIGO = '1001000'

-- Vendo todos os produtos onde sabor dos alpes esta presente na descricao
SELECT * from [PRODUTOS] WHERE SUBSTRING([DESCRITOR],1,15) = 'Sabor dos Alpes'

-- Apagando produtos com tamanho de 1 litro e sabor dos alpes na descricao
DELETE FROM 
	PRODUTOS
WHERE
	TAMANHO = '1 Litro' AND SUBSTRING([DESCRITOR],1,15) = 'Sabor dos Alpes'

-- Vendo todos os produtos apos apagar
SELECT * from [PRODUTOS] WHERE SUBSTRING([DESCRITOR],1,15) = 'Sabor dos Alpes'

-- Vendo todos os produtos que estao na tabela fonte
SELECT
	*
FROM
	SUCOS_VENDAS.DBO.[TABELA DE PRODUTOS]

-- Vendo todos os produtos que estao na tabela de destino, mas nao estao na tabela fonte
SELECT
	*
FROM
	PRODUTOS
WHERE
	CODIGO COLLATE Latin1_General_CS_AS
	NOT IN(
	SELECT
		[CODIGO DO PRODUTO]
	FROM
		SUCOS_VENDAS.DBO.[TABELA DE PRODUTOS]) 

-- Apagando os registros que nao existem na tabela fonte
DELETE FROM
	PRODUTOS
WHERE
	CODIGO COLLATE LATIN1_GENERAL_CS_AS
	NOT IN (
	SELECT
		[CODIGO DO PRODUTO]
	FROM
		SUCOS_VENDAS.dbo.[TABELA DE PRODUTOS])

-- Exclua as notas fiscais (apenas o cabeçalho) cujos clientes tenham menos que 18 anos.

-- Vendo quais clientes tem idade igual a 18
SELECT
	*
FROM 
	CLIENTES
WHERE
	IDADE <= 18

-- Unindo os clientes com as suas notas
SELECT 
	NOTAS.NUMERO
FROM
	CLIENTES 
	INNER JOIN
	NOTAS
	ON CLIENTES.CPF = NOTAS.CPF
WHERE
	CLIENTES.IDADE <= 18

-- Apagando as notas dos clientes com idade menor ou igual a 18
DELETE 
	NOTAS 
FROM
	CLIENTES
	INNER JOIN
	NOTAS
	ON CLIENTES.CPF = NOTAS.CPF
WHERE
	CLIENTES.IDADE <= 18

-- Vendo as notas apos apagar
SELECT 
	NOTAS.NUMERO
FROM
	CLIENTES 
	INNER JOIN
	NOTAS
	ON CLIENTES.CPF = NOTAS.CPF
WHERE
	CLIENTES.IDADE <= 18