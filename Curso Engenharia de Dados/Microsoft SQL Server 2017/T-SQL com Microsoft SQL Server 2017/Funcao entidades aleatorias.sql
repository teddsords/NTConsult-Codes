-- Passando a funcionalidade de selecionar clientes, vendedores e produtos aleatoriamente
-- Para um unico script 

CREATE FUNCTION EntidadeAleatoria (@TIPO VARCHAR(12)) RETURNS VARCHAR(20)
AS
BEGIN
	-- Declarando variaveis 
	DECLARE @ENTIDADE_ALEATORIO VARCHAR(12),
			@VALOR_INICIAL INT,
			@VALOR_FINAL INT,
			@ALEATORIO INT,
			@CONTADOR INT
	DECLARE @TABELA TABLE (CODIGO VARCHAR(20))

	-- Verificando o tipo recebido pela funcao
	IF @TIPO = 'CLIENTE'
	BEGIN
		INSERT INTO @TABELA (CODIGO) SELECT CPF AS CODIGO FROM [TABELA DE CLIENTES]
	END

	ELSE IF @TIPO = 'VENDEDOR'
	BEGIN
		INSERT INTO @TABELA (CODIGO) SELECT MATRICULA AS CODIGO FROM [TABELA DE VENDEDORES]
	END

	ELSE IF @TIPO = 'PRODUTO'
	BEGIN
		INSERT INTO @TABELA (CODIGO) SELECT [CODIGO DO PRODUTO] AS CODIGO FROM [TABELA DE PRODUTOS]
	END

	SET @VALOR_INICIAL = 1
	SET @CONTADOR = 1
	SELECT @VALOR_FINAL = COUNT(*) FROM @TABELA	-- Utilizamos um SELECT para pegar sempre o numero atualizado da tabela
	SET @ALEATORIO = [dbo].[NumeroAleatorio](@VALOR_INICIAL, @VALOR_FINAL)

	-- Declarando um cursor para pegar todos os CPFs e logo poder selecionar de acordo com @ALEATORIO
	DECLARE CURSOR1 CURSOR FOR SELECT CODIGO FROM @TABELA

	-- Abrindo o Cursor
	OPEN CURSOR1

	-- Pegando o primeiro elemento do Cursor
	FETCH NEXT FROM CURSOR1 INTO @ENTIDADE_ALEATORIO

	-- Percorrendo o Cursor
	WHILE @CONTADOR < @ALEATORIO
	BEGIN
		FETCH NEXT FROM CURSOR1 INTO @ENTIDADE_ALEATORIO
		SET @CONTADOR = @CONTADOR + 1
	END

	CLOSE CURSOR1
	DEALLOCATE CURSOR1

	RETURN @ENTIDADE_ALEATORIO
END

SELECT [dbo].[EntidadeAleatoria]('VENDEDOR')

-- Crie uma consulta no Management Studio; declare três variáveis que recebem o produto,
-- cliente e vendedor; e obtenha os valores destas variáveis através da função EntidadeAleatoria, criada no vídeo desta aula.

DECLARE @CLIENTE VARCHAR(12),
		@VENDEDOR VARCHAR(12),
		@PRODUTO VARCHAR(12)

SET @CLIENTE = [dbo].[EntidadeAleatoria]('CLIENTE')
SET @VENDEDOR = [dbo].[EntidadeAleatoria]('VENDEDOR')
SET @PRODUTO = [dbo].[EntidadeAleatoria]('PRODUTO')

PRINT @CLIENTE
PRINT @VENDEDOR
PRINT @PRODUTO
