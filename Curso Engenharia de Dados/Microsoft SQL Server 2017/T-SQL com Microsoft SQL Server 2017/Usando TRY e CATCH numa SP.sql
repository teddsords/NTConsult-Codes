-- Criando a SP utilizando o tratamento de TRY e CATCH
CREATE PROCEDURE [dbo].[TrataErroZeroTry] 
@CPF VARCHAR(12),
@ANO INT,
@DENOMINADOR INT,
@MENSAGEM VARCHAR(50) OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT
			SUM(INF.QUANTIDADE * INF.[PRE?O]) AS FATURAMENTO,
			SUM(INF.QUANTIDADE * INF.[PRE?O]) / @DENOMINADOR AS COMISSAO
		FROM
			[ITENS NOTAS FISCAIS] INF
			INNER JOIN
			[NOTAS FISCAIS] NF
			ON INF.NUMERO = NF.NUMERO
		WHERE
			NF.CPF = @CPF
			AND
			YEAR(NF.DATA) = @ANO
	END TRY

	BEGIN CATCH
		SET @MENSAGEM = 'Houve um erro n?mero: ' + CONVERT(VARCHAR(30), @@ERROR)

	END CATCH
END


-- Declarando variaveis
DECLARE @DENOMINADOR INT,
		@CPF VARCHAR(12),
		@ANO INT,
		@MENSAGEM VARCHAR(30)

-- Setando valores
SET @CPF = '1471156710'
SET @ANO = 2016
SET @DENOMINADOR = 0
SET @MENSAGEM = ''

--Executando a SP
EXEC TrataErroZeroTry @CPF, @ANO, @DENOMINADOR, @MENSAGEM OUTPUT

IF @MENSAGEM <> ''
	PRINT @MENSAGEM

