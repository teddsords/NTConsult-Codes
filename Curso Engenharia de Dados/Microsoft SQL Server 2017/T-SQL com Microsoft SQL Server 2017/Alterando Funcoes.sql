-- Criando funcao para retornar o endereco completo
CREATE FUNCTION EnderecoCompleto
	(@ENDERECO VARCHAR(100),
	 @CIDADE VARCHAR(50),
	 @ESTADO VARCHAR(50),
	 @CEP VARCHAR(20))
RETURNS VARCHAR (250)
AS
BEGIN
	DECLARE @ENDERECO_COMPLETO VARCHAR(250)
	SET @ENDERECO_COMPLETO = @ENDERECO + '-' + @CIDADE + '-' + @ESTADO + '-' + @CEP
	RETURN @ENDERECO_COMPLETO
END

-- Verificando o funcionamento da funcao criada acima
SELECT
	CPF,
	dbo.EnderecoCompleto([Endereco 1], CIDADE, ESTADO, CEP) AS END_COMPLETO
FROM
[TABELA DE CLIENTES]

-- No entanto, se o cliente quiser mudar a funcao podemos utilizar o seguinte comando
-- Copiando o codigo inteiro da funcao
-- Tambem é possível obter o código para alterar a função usando o assistente
ALTER FUNCTION EnderecoCompleto
	(@ENDERECO VARCHAR(100),
	 @CIDADE VARCHAR(50),
	 @ESTADO VARCHAR(50),
	 @CEP VARCHAR(20))
RETURNS VARCHAR (250)
AS
BEGIN
	DECLARE @ENDERECO_COMPLETO VARCHAR(250)
	SET @ENDERECO_COMPLETO = @ENDERECO + ', ' + @CIDADE + ', ' + @ESTADO + ', ' + @CEP
	RETURN @ENDERECO_COMPLETO
END

-- Verificando o resultado da alteracao realizada acima
SELECT
	CPF,
	dbo.EnderecoCompleto([Endereco 1], CIDADE, ESTADO, CEP) AS END_COMPLETO
FROM
[TABELA DE CLIENTES]

-- Alteraremos a funcao FuncTabelaNotas para uma nova consulta mais simples
ALTER FUNCTION FuncTabelaNotas (@DATAINICIO AS DATE, @DATAFINAL AS DATE) RETURNS TABLE
AS
RETURN
	SELECT
		DATA,
		COUNT(*) AS NUMERO
	FROM
		[NOTAS FISCAIS]
	WHERE
		DATA >= @DATAINICIO 
		AND
		DATA <= @DATAFINAL
	GROUP BY
		DATA

SELECT
	*
FROM
	dbo.FuncTabelaNotas('20170101', '20170110')