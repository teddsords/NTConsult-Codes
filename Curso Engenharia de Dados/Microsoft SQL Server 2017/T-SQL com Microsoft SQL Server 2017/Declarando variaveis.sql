-- Declarando variaveis

-- DECLARE <VARIABLE'S NAME> <VARIABLE TYPE>
	-- O nome dever ser unico e iniciado com um @
	-- O tipo da variavel pode ser qualquer um existente no SQL SERVER, inclusive podemos ter variaveis do tipo tabelas
	-- O valor da variavel pode ser atribuido pelo comando SET
	-- ou atraves do comando SELECT

-- Declarando variaveis
DECLARE @IDADE INT
DECLARE @NOME VARCHAR(200)
DECLARE @DATA DATE

-- A declaracao das variaveis tambem pode ser feita numa unica linha
DECLARE @IDADE2 INT, @NOME2 VARCHAR(200), @DATA2 DATE

-- Setando valor para a variavel
SET @IDADE = 20

-- Assim podemos printar as variaveis
--PRINT @IDADE

SET @NOME = 'JOAO DA SILVA'
--PRINT @NOME

SET @DATA = '20180517'
--PRINT @DATA


-- Podemos declarar as variaveis e utilizar nos comandos
DECLARE @CPF VARCHAR(12)
SET @CPF = '1471156710'

/*SELECT 
	NOME,
	[DATA DE NASCIMENTO],
	IDADE
FROM 
	[TABELA DE CLIENTES]
WHERE
	@CPF = CPF*/

-- E podemos usar os comandos para colocar valores nas variaveis
SELECT
	@NOME2 = NOME,		-- Atribuindo para a variavel o valor retornado pelo SELECT
	@DATA2 = [DATA DE NASCIMENTO],
	@IDADE2 = IDADE
FROM
	[TABELA DE CLIENTES]
WHERE
	@CPF = CPF

PRINT @NOME2
PRINT @DATA2
PRINT @IDADE2


