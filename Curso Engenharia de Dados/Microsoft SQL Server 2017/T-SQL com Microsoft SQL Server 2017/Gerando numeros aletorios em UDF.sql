-- Gerando n�meros aleat�rios

-- Criando fun��o para criar n�mero aleat�rios
-- Valor minimo= 100
-- Valor maximo= 500
-- Criando n�mero aleat�rio entre 100 e 500
SELECT ROUND(((500 - 100 - 1) * RAND() + 100), 0)


-- Criando fun��o para gera��o de n�mero aleat�rio
-- Gera erro, pois n�o � poss�vel utilizar a fun��o RAND() dentro de uma UDF
-- Para contornar isso, vamos criar uma VIEW praa pegar os n�meros aleat�rios
CREATE FUNCTION NumeroAleatorio (@VALINIC INT, @VALFINAL INT) RETURNS INT
AS
BEGIN
	DECLARE @ALEATORIO INT
	SET @ALEATORIO = ROUND(((@VALFINAL - @VALINIC - 1) * RAND() + @VALINIC), 0)
	RETURN @ALEATORIO
END

-- Criamos a view para gerar os n�meros aleat�rios
CREATE VIEW VW_ALETORIO AS SELECT RAND() AS VALUE

-- Testando a gera��o de n�meros aleat�rios
SELECT * FROM VW_ALETORIO

-- Arrumando a fun��o para que utilize a view ao inv�s de utilizar a fun��o RAND()
CREATE FUNCTION NumeroAleatorio (@VALINIC INT, @VALFINAL INT) RETURNS INT
AS
BEGIN
	DECLARE @ALEATORIO INT
	DECLARE @ALEATORIO_FLOAT FLOAT
	SELECT @ALEATORIO_FLOAT = VALUE FROM VW_ALETORIO
	SET @ALEATORIO = ROUND(((@VALFINAL - @VALINIC - 1) * @ALEATORIO_FLOAT + @VALINIC), 0)
	RETURN @ALEATORIO
END

SELECT dbo.NumeroAleatorio (100,1000)


-- Crie uma vari�vel TABELA com um campo INT, use um loop para gravar 100 n�meros aleat�rios 
-- entre 0 e 1000 nesta tabela. Depois, liste esta tabela em uma consulta.

-- Declarando a variavel do tipo tabela
DECLARE @TABELAALEATORIA TABLE (NUMERO INT)

-- Declarando variaveis para os limites
DECLARE @LIMITEINFERIOR INT,
		@LIMITESUPERIOR INT,
		@CONT INT

SET @LIMITEINFERIOR = 0
SET @LIMITESUPERIOR = 1000
SET @CONT = 0
WHILE @CONT < 100
BEGIN
	INSERT INTO 
		@TABELAALEATORIA (NUMERO)
	VALUES
		(dbo.NumeroAleatorio(@LIMITEINFERIOR, @LIMITESUPERIOR))

	SET @CONT = @CONT + 1
END

SELECT
	*
FROM @TABELAALEATORIA
