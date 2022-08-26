-- Fun��es no SQL
-- Fun��es s�o rotinass que efetuam um determinado processamento e retornam um valorr (escalar ou uma tabela)
-- Podemos desenvolver fun��es em T-SQL ou em .NET e us�-las no SQL Server
-- Chamamos de fun��es UDF (User-Defined Functions) as fun��es definidias pelo usu�rio desenvolvedor no SQL Server

-- Caracter�sticas:
	-- O seu corpo deve ser delimitado por um BEGIN e END
	-- Deve sempre retornar um valor atrav�s do comando RETURN
	-- Ap�s o nome da fun��o devemos declarar as vari�veis de entrada

-- CREATE FUNCTION <FUNCTIONS'S NAME> (<PARAMETERS>)
-- RETURNS <RETURN TYPE>
-- AS
-- BEGIN
--		BODY
--		RETURN <RETURN VARIABLE>
-- END


-- Vamos criar uma fun��o que fa�a a seguinte consulta
SELECT
	SUM(QUANTIDADE * [PRE�O])
FROM
	[ITENS NOTAS FISCAIS]
WHERE
	NUMERO = 100

CREATE FUNCTION FaturamentoNota (@NUMERO AS INT) RETURNS FLOAT
AS
BEGIN
	DECLARE @FATURAMENTO FLOAT
	
	SELECT
		@FATURAMENTO = SUM(QUANTIDADE * [PRE�O])
	FROM
		[ITENS NOTAS FISCAIS]
	WHERE
		NUMERO = @NUMERO

	RETURN @FATURAMENTO
END

SELECT
	NUMERO,
	[dbo].[FaturamentoNota](NUMERO) as FATURAMENTO
FROM
	[NOTAS FISCAIS]