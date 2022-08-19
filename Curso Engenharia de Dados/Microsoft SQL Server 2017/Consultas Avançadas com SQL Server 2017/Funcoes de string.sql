-- FUN��ES
-- � aqui onde temos a diferencia��o entre os bancos de dados. 
-- As fun��es vistas aqui s� aplicam para o SQL Server

-- LTRIM --> Retorna uma express�o de caractere depois de remover espa�os em branco � esquerda
		 --> LTRIM (character_expression)

-- LTRIM --> Retorna uma express�o de caractere depois de remover espa�os em branco � direita
		 --> RTRIM (character_expression)

-- LEFT --> Retorna a parte da esquerda de uma cadeia de caracteres com o n�mero de caracteres especificado
		--> LEFT (character_expression, integer_expression)

-- RIGHT --> Retorna a parte da direita de uma cadeia de caracteres com o n�mero de caracteres especificado
		 --> RIGHT (character_expression, integer_expression)

-- CONCAT --> Retorna uma cadeia de caracteres que � o resultado da concatena��o de dois ou mais valores 
		  --> CONCAT( string_value_1, strin_value_2 [, strin_value_N])

-- SUBSTRING --> Retorna parte de uma express�o de caractere, bin�ria, de texto ou de imagem no SQL Server
		     --> SUBSTRING(expression, start, length)

-- LEN	--> Retorna o n�mero de caracteres da express�o da cadeia de caracteres especificada, excluindo espa�os em branco � direita
		--> LEN(string_expression)

-- UPPER --> Retorna uma express�o de caractere com dados de caractere em min�sculas convertidos em mai�sculas
		 --> UPPER(character_expression)

-- LOWER --> Retorna uma express�o de caractere com dados de caractere em mai�sculas convertidos em min�sculas
		 --> LOWER(character_expression)

SELECT LTRIM ('            OLA')

SELECT RTRIM('OLA             ')

SELECT CONCAT('OLA ', 'TUDO BEM')

-- Podemos substituir a fun��o CONCAT pelo +
SELECT 'OLA ' + 'TUDO BEM'

SELECT LEFT('RUA AUGUSTA', 3)

SELECT RIGHT('RUA AUGUSTA', 7)

SELECT UPPER('augusta')

SELECT LOWER('AUGUSTA')

SELECT REPLACE('R. AUGUSTA', 'R.', 'RUA')

SELECT SUBSTRING('RUA AUGUSTA', 2,4)

SELECT LEN('RUA AUGUSTA')


SELECT * FROM [TABELA DE CLIENTES]

SELECT CONCAT(NOME, ' (', CPF, ')') FROM [TABELA DE CLIENTES]


-- Fa�a uma consulta que lista o nome do cliente e o endere�o completo (com rua, bairro, cidade e estado).

SELECT
	NOME,
	CONCAT([ENDERECO 1], '. ', BAIRRO, '. ', CIDADE, ',', ESTADO)
FROM
	[TABELA DE CLIENTES]
