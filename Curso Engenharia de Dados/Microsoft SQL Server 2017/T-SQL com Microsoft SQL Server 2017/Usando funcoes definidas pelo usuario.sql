-- Funções no SQL
-- Funções são rotinass que efetuam um determinado processamento e retornam um valorr (escalar ou uma tabela)
-- Podemos desenvolver funções em T-SQL ou em .NET e usá-las no SQL Server
-- Chamamos de funções UDF (User-Defined Functions) as funções definidias pelo usuário desenvolvedor no SQL Server

-- Características:
	-- O seu corpo deve ser delimitado por um BEGIN e END
	-- Deve sempre retornar um valor através do comando RETURN
	-- Após o nome da função devemos declarar as variáveis de entrada

-- CREATE FUNCTION <FUNCTIONS'S NAME> (<PARAMETERS>)
-- RETURNS <RETURN TYPE>
-- AS
-- BEGIN
--		BODY
--		RETURN <RETURN VARIABLE>
-- END


-- Vamos criar uma função que faça a seguinte consulta
SELECT
	SUM(QUANTIDADE * [PREÇO])
FROM
	[ITENS NOTAS FISCAIS]
WHERE
	NUMERO = 100

CREATE FUNCTION FaturamentoNota (@NUMERO AS INT) RETURNS FLOAT
AS
BEGIN
	DECLARE @FATURAMENTO FLOAT
	
	SELECT
		@FATURAMENTO = SUM(QUANTIDADE * [PREÇO])
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