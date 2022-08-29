-- Fun��es dentro de um loop
DECLARE @TABELA_NUMEROS TABLE (NUMERO INT, [STATUS] VARCHAR(200), FATURAMENTO FLOAT)

DECLARE	@LIMITE_MINIMO INT,
		@LIMITE_MAXIMO INT,
		@CONTADOR_NOTAS INT

SET @LIMITE_MINIMO = 98
SET @LIMITE_MAXIMO = 102

WHILE @LIMITE_MINIMO <= @LIMITE_MAXIMO
BEGIN
	SELECT @CONTADOR_NOTAS = COUNT(*) FROM [NOTAS FISCAIS] WHERE NUMERO = @LIMITE_MINIMO

	IF @CONTADOR_NOTAS > 0
		BEGIN
			-- Dentro do mesmo insert temos a chamada da funcao, o qual esta dentro de um loop
			INSERT INTO @TABELA_NUMEROS (NUMERO, [STATUS], FATURAMENTO) VALUES (@LIMITE_MINIMO, '� NOTA FISCAL', [dbo].[FaturamentoNota](@LIMITE_MINIMO))
		END
	ELSE
		BEGIN
			INSERT INTO @TABELA_NUMEROS (NUMERO, [STATUS], FATURAMENTO) VALUES (@LIMITE_MINIMO, 'N�O � NOTA FISCAL', 0)
		END

	SET @LIMITE_MINIMO = @LIMITE_MINIMO +1
	
END

SELECT
	*
FROM
	@TABELA_NUMEROS


-- Modificando o script criado anteriormente para utilizar a fun��o para a inclus�o de dados na tabela
IF OBJECT_ID('TABELANOTAS','U') IS NOT NULL
	DROP TABLE TABELANOTAS
CREATE TABLE TABELANOTAS (DATA DATE, NUMNOTAS INT)

DECLARE @DATAINICIAL DATE, @DATAFINAL DATE, @NUMNOTAS INT

SET @DATAINICIAL = '20170101'
SET @DATAFINAL = '20170110'

WHILE @DATAINICIAL <= @DATAFINAL
BEGIN
   INSERT INTO 
	TABELANOTAS (DATA, NUMNOTAS) 
    VALUES 
		(@DATAINICIAL,[dbo].[NumeroNotas](@DATAINICIAL))
   SELECT @DATAINICIAL = DATEADD(DAY, 1, @DATAINICIAL)
END

SELECT * FROM TABELANOTAS