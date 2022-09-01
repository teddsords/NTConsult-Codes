-- Gerando números aleatórios

-- Criando função para criar número aleatórios
-- Valor minimo= 100
-- Valor maximo= 500
-- Criando número aleatório entre 100 e 500
SELECT ROUND(((500 - 100 - 1) * RAND() + 100), 0)


-- Criando função para geração de número aleatório
-- Gera erro, pois não é possível utilizar a função RAND() dentro de uma UDF
-- Para contornar isso, vamos criar uma VIEW praa pegar os números aleatórios
CREATE FUNCTION NumeroAleatorio (@VALINIC INT, @VALFINAL INT) RETURNS INT
AS
BEGIN
	DECLARE @ALEATORIO INT
	SET @ALEATORIO = ROUND(((@VALFINAL - @VALINIC - 1) * RAND() + @VALINIC), 0)
	RETURN @ALEATORIO
END

-- Criamos a view para gerar os números aleatórios
CREATE VIEW VW_ALETORIO AS SELECT RAND() AS VALUE

-- Testando a geração de números aleatórios
SELECT * FROM VW_ALETORIO

-- Arrumando a função para que utilize a view ao invés de utilizar a função RAND()
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


-- Crie uma variável TABELA com um campo INT, use um loop para gravar 100 números aleatórios 
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
