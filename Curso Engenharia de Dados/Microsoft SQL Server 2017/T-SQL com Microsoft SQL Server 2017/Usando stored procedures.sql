-- Stored Procedures
-- São rotinas executadas pelo servidor. Elas possuem grande poder
-- de performance para manipulação de tabelas do SQL Server

-- As SPs podem ser também definidas pelo usuário (UDF) ou podemos usar
-- uma série de SPs disponíveis pelo SQL server

-- Diferença entre SP e Function
-- * Função sempre vai retornar um valor: Escalar ou Tabela
-- * A SP vai executar um procedimento sem a necessidade de retornar um valor
--   A SP pode até voltar valor, mas na verdade o que ela faz é modificar o valor de uma variável enviada a ela.

-- Uma SP tem as seguintes caracterísiticas:
-- * O seu corpo deve ser delimitado por um BEGIN e END
-- * Devemos declarar as variáveis de entrada logo depois do nome da procedure
-- * Pode ter uma ou mais variáveis de retorno

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
-- com o mesmo código da de cima, mas acrescente a entidade PRODUTOS. Das entidades, liste apenas os seus identificadores e os seus nomes.

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