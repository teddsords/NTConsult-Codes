-- SPs com variavel de saida

-- Montando as queries
-- Pegando o total de NFs no ano por um cliente em especifico
SELECT
	COUNT(*) AS TOTAL
FROM
	[NOTAS FISCAIS]
WHERE
	CPF= '19290992743'
	AND
	YEAR(DATA) = 2016

-- Pegando o faturaramento desse cliente no ano
SELECT
	SUM(INF.QUANTIDADE * INF.[PREÇO]) AS FATURAMENTO
FROM
	[ITENS NOTAS FISCAIS] INF
	INNER JOIN
	[NOTAS FISCAIS] NF
	ON NF.NUMERO = INF.NUMERO
WHERE
	CPF = '19290992743'
	AND
	YEAR(DATA) = 2016

-- Criando a SP
CREATE PROCEDURE RetornaValores
@CPF AS VARCHAR(12),
@ANO AS INT,
@NUM_NOTAS AS INT OUTPUT,		-- Ao colocar OUTPUT estamos dizendo que quem chamou a funcao podera utilizar esse valor por referencia
@FATURAMENTO AS FLOAT OUTPUT
AS
BEGIN
	SELECT
		@NUM_NOTAS = COUNT(*)
	FROM
		[NOTAS FISCAIS]
	WHERE
		CPF= @CPF
		AND
		YEAR(DATA) = @ANO
		
	SELECT
		@FATURAMENTO = SUM(INF.QUANTIDADE * INF.[PREÇO])
	FROM
		[ITENS NOTAS FISCAIS] INF
		INNER JOIN
		[NOTAS FISCAIS] NF
		ON NF.NUMERO = INF.NUMERO
	WHERE
		CPF = @CPF
		AND
		YEAR(DATA) = @ANO
END


-- Declarando variaveis
DECLARE @NUMERO_NOTAS INT,
		@FATURAMENTO FLOAT,
		@CPF AS VARCHAR(12),
		@ANO INT

-- Definindo o valor das variaveis
SET @CPF = '19290992743'
SET @ANO = 2016

-- Executando a SP
-- Como a variavel @NUMERO_NOTAS esta sendo pasada como referencia tem que se colocar OUTPUT tambem
EXEC RetornaValores @CPF = @CPF, @ANO = @ANO, @NUM_NOTAS = @NUMERO_NOTAS OUTPUT, @FATURAMENTO = @FATURAMENTO OUTPUT


SELECT
	@NUMERO_NOTAS,
	@FATURAMENTO

