-- Tratamento de erro
-- O erro pode se tratar de duas formas no T-SQL:
-- * Nao usando a estrutura TRY-CATCH
--		** Podemos usar @@ERROR = Retorna um inteira que representa a forma com que o comando anterior terminou. (Zero = sucesso, diferente de zero = erro)
--		** Podemos usar @@ROWCOUNT = Numero de linhas afetadas com o erro.
--	A obtenção destes dados devem ser feitas após o comando suspeito de erro


--	* Usando a estrutura TRY-CATCH
--		TRY
--			<COMMAND BLOCK>
--		CATCH
--			<COMMAND BLOCK FOR ERRO>
--		END TRY

-- Montando a tradicional consulta de faturamento
SELECT
	SUM(INF.QUANTIDADE * INF.[PREÇO]) AS FATURAMENTO,
	SUM(INF.QUANTIDADE * INF.[PREÇO]) / 10 AS COMISSAO
FROM
	[ITENS NOTAS FISCAIS] INF
	INNER JOIN
	[NOTAS FISCAIS] NF
	ON INF.NUMERO = NF.NUMERO
WHERE
	NF.CPF = '1471156710'
	AND
	YEAR(NF.DATA) = 2016

-- Declarando uma variavel para utilizar na consulta de cima e atribuindo valor a ela
DECLARE @DENOMINADOR INT
SET @DENOMINADOR = 10

SELECT
	SUM(INF.QUANTIDADE * INF.[PREÇO]) AS FATURAMENTO,
	SUM(INF.QUANTIDADE * INF.[PREÇO]) / @DENOMINADOR AS COMISSAO
FROM
	[ITENS NOTAS FISCAIS] INF
	INNER JOIN
	[NOTAS FISCAIS] NF
	ON INF.NUMERO = NF.NUMERO
WHERE
	NF.CPF = '1471156710'
	AND
	YEAR(NF.DATA) = 2016

-- Vamos criar uma SP que trate o erro de divisao por 0
CREATE PROCEDURE TrataErroZero 
@CPF VARCHAR(12),
@ANO INT,
@DENOMINADOR INT,
@NUMERRO INT OUTPUT,
@NUMLINHA INT OUTPUT
AS
BEGIN
	SELECT
		SUM(INF.QUANTIDADE * INF.[PREÇO]) AS FATURAMENTO,
		SUM(INF.QUANTIDADE * INF.[PREÇO]) / @DENOMINADOR AS COMISSAO
	FROM
		[ITENS NOTAS FISCAIS] INF
		INNER JOIN
		[NOTAS FISCAIS] NF
		ON INF.NUMERO = NF.NUMERO
	WHERE
		NF.CPF = @CPF
		AND
		YEAR(NF.DATA) = @ANO

-- Como sabemos que a query de cima pode dar erro, devemos atribuir o valor de @@ERROR & @@ROWCOUNT para as variaveis @NUMERRO e @NUMLINHA respectivamente
	SELECT @NUMERRO = @@ERROR, @NUMLINHA = @@ROWCOUNT

END

-- Declarando as variaveis a serem utilizadas na execucao da SP
DECLARE @DENOMINADOR INT,
		@CPF VARCHAR(12),
		@ANO INT,
		@NUMERRO INT,
		@NUMLINHA INT

-- Setando oas valores que desejamos testar
SET @CPF = '1471156710'
SET @ANO = 2016
SET @DENOMINADOR = 0

-- Testando a SP
EXEC TrataErroZero @CPF, @ANO, @DENOMINADOR, @NUMERRO OUTPUT, @NUMLINHA OUTPUT

-- Caso haja erro, sera printada a seguinte mensagem
IF @NUMERRO <> 0
	PRINT 'Houve um erro: ' + CONVERT(VARCHAR(30), @NUMERRO) + ' - ' + CONVERT(VARCHAR(3), @NUMLINHA)


-- Crie a seguinte Stored Procedure, conforme o código abaixo:
CREATE PROCEDURE InclusaoVendedor 
@MATRICULA AS VARCHAR(5), 
@NOME AS VARCHAR(100),
@PERCENTUAL AS FLOAT,
@DATAADMISSAO AS DATE, 
@FERIAS AS BIT, 
@BAIRRO AS VARCHAR(50)
AS
BEGIN
	INSERT INTO [TABELA DE VENDEDORES] 
	(MATRICULA, NOME, [PERCENTUAL COMISSÃO], [DATA ADMISSÃO], [DE FERIAS], BAIRRO)
	VALUES 
	(@MATRICULA, @NOME, @PERCENTUAL, @DATAADMISSAO, @FERIAS, @BAIRRO)
END

-- Ela irá incluir um vendedor na tabela de vendedores. Depois, execute o comando:
EXEC InclusaoVendedor '00238','Pericles Alves',0.11,'20160821',0,'Santo Amaro'

-- Ao incluir esses dados temos o erro de primary key duplicada! Para isso vamos criar uma outra SP tratando esse erro
-- Crie a seguinte Stored Procedure, conforme o código abaixo:
CREATE PROCEDURE InclusaoVendedor1 
@MATRICULA AS VARCHAR(5), 
@NOME AS VARCHAR(100),
@PERCENTUAL AS FLOAT,
@DATAADMISSAO AS DATE, 
@FERIAS AS BIT, 
@BAIRRO AS VARCHAR(50),
@CODERROR INT OUTPUT,
@LINHAERRO INT OUTPUT
AS
BEGIN
	INSERT INTO [TABELA DE VENDEDORES] 
	(MATRICULA, NOME, [PERCENTUAL COMISSÃO], [DATA ADMISSÃO], [DE FERIAS], BAIRRO)
	VALUES 
	(@MATRICULA, @NOME, @PERCENTUAL, @DATAADMISSAO, @FERIAS, @BAIRRO)

	-- Se ali encima tivermos um erro, vamos atribuir esse valor à saida
	SELECT
		@CODERROR = @@ERROR,
		@LINHAERRO = @@ROWCOUNT
END

-- Declarando as variaveis para utilizar
DECLARE @CODERROR INT,
		@LINHAERRO INT
-- Executando para ver como fica com o tratamento de erro
EXEC InclusaoVendedor1 '00238','Pericles Alves',0.11,'20160821',0,'Santo Amaro', @CODERROR OUTPUT, @LINHAERRO OUTPUT

IF @CODERROR <> 0
	PRINT 'Houve um erro na execucao da SP. O código é: ' + CONVERT(VARCHAR(30), @CODERROR) + ' - ' + CONVERT(VARCHAR(30), @LINHAERRO)