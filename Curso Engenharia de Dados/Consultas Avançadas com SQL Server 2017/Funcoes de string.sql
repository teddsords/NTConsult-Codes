-- FUNÇÕES
-- É aqui onde temos a diferenciação entre os bancos de dados. 
-- As funções vistas aqui só aplicam para o SQL Server

-- LTRIM --> Retorna uma expressão de caractere depois de remover espaços em branco à esquerda
		 --> LTRIM (character_expression)

-- LTRIM --> Retorna uma expressão de caractere depois de remover espaços em branco à direita
		 --> RTRIM (character_expression)

-- LEFT --> Retorna a parte da esquerda de uma cadeia de caracteres com o número de caracteres especificado
		--> LEFT (character_expression, integer_expression)

-- RIGHT --> Retorna a parte da direita de uma cadeia de caracteres com o número de caracteres especificado
		 --> RIGHT (character_expression, integer_expression)

-- CONCAT --> Retorna uma cadeia de caracteres que é o resultado da concatenação de dois ou mais valores 
		  --> CONCAT( string_value_1, strin_value_2 [, strin_value_N])

-- SUBSTRING --> Retorna parte de uma expressão de caractere, binária, de texto ou de imagem no SQL Server
		     --> SUBSTRING(expression, start, length)

-- LEN	--> Retorna o número de caracteres da expressão da cadeia de caracteres especificada, excluindo espaços em branco à direita
		--> LEN(string_expression)

-- UPPER --> Retorna uma expressão de caractere com dados de caractere em minúsculas convertidos em maiúsculas
		 --> UPPER(character_expression)

-- LOWER --> Retorna uma expressão de caractere com dados de caractere em maiúsculas convertidos em minúsculas
		 --> LOWER(character_expression)

SELECT LTRIM ('            OLA')

SELECT RTRIM('OLA             ')

SELECT CONCAT('OLA ', 'TUDO BEM')

-- Podemos substituir a função CONCAT pelo +
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


-- Faça uma consulta que lista o nome do cliente e o endereço completo (com rua, bairro, cidade e estado).

SELECT
	NOME,
	CONCAT([ENDERECO 1], '. ', BAIRRO, '. ', CIDADE, ',', ESTADO)
FROM
	[TABELA DE CLIENTES]
