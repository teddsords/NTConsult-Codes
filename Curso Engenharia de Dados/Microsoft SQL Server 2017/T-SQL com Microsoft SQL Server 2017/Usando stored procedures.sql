-- Stored Procedures
-- S�o rotinas executadas pelo servidor. Elas possuem grande poder
-- de performance para manipula��o de tabelas do SQL Server

-- As SPs podem ser tamb�m definidas pelo usu�rio (UDF) ou podemos usar
-- uma s�rie de SPs dispon�veis pelo SQL server

-- Diferen�a entre SP e Function
-- * Fun��o sempre vai retornar um valor: Escalar ou Tabela
-- * A SP vai executar um procedimento sem a necessidade de retornar um valor
--   A SP pode at� voltar valor, mas na verdade o que ela faz � modificar o valor de uma vari�vel enviada a ela.

-- Uma SP tem as seguintes caracter�siticas:
-- * O seu corpo deve ser delimitado por um BEGIN e END
-- * Devemos declarar as vari�veis de entrada logo depois do nome da procedure
-- * Pode ter uma ou mais vari�veis de retorno

-- CREATE PROCEDURE <PROCEDURE NAME> <VARIABLE DECLARATION>
-- AS
-- BEGIN
--		PROCEDURE'S BODY
-- END

-- Criando uma SP
CREATE PROCEDURE BuscaPorEntidade @ENTIDADE AS VARCHAR(10)
AS
BEGIN
	IF @ENTIDADE = 'CLIENTES'
		SELECT
			CPF AS IDENTIFICADOR,
			NOME AS DESCRITOR,
			BAIRRO AS BAIRRO
		FROM
			[TABELA DE CLIENTES]
	ELSE IF @ENTIDADE = 'VENDEDORES'
		SELECT 
			MATRICULA AS IDENTIFICADOR,
			NOME AS DESCRITOR,
			BAIRRO AS BAIRRO
		FROM
			[TABELA DE VENDEDORES]
END

-- Executando a SP criada acima
EXEC BuscaPorEntidade @ENTIDADE = 'VENDEDORES'


-- Crie uma segunda stored procedure chamada BuscaPorEntidadesCompleta 
-- com o mesmo c�digo da de cima, mas acrescente a entidade PRODUTOS. Das entidades, liste apenas os seus identificadores e os seus nomes.

CREATE PROCEDURE BuscaPorEntidadesCompleta @ENTIDADE AS VARCHAR(10)
AS
BEGIN
	IF @ENTIDADE = 'CLIENTES'
		SELECT
			CPF AS IDENTIFICADOR,
			NOME AS DESCRITOR
		FROM
			[TABELA DE CLIENTES]
	
	ELSE IF @ENTIDADE = 'VENDEDORES'
		SELECT
			MATRICULA AS IDENTIFICADOR,
			NOME AS DESCRITOR
		FROM
			[TABELA DE VENDEDORES]

	ELSE IF @ENTIDADE = 'PRODUTOS'
		SELECT
			[CODIGO DO PRODUTO] AS IDENTIFICADOR,
			[NOME DO PRODUTO] AS DESCRITOR
		FROM
			[TABELA DE PRODUTOS]
END

-- Executando a SP criada acima
EXEC BuscaPorEntidadesCompleta @ENTIDADE = 'CLIENTES'
EXEC BuscaPorEntidadesCompleta @ENTIDADE = 'VENDEDORES'
EXEC BuscaPorEntidadesCompleta @ENTIDADE = 'PRODUTOS'