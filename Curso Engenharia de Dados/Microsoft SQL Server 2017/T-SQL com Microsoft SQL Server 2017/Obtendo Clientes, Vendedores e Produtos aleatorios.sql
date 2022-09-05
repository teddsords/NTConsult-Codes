-- Pegando clientes  e vendedores aleatorios

-- Declarando variaveis 
DECLARE @CLIENTE_ALEATORIO VARCHAR(12),
		@VENDEDOR_ALEATORIO VARCHAR(12),
		@VALOR_INICIAL INT,
		@VALOR_FINAL INT,
		@ALEATORIO INT,
		@CONTADOR INT


-- Setando valores das variaveis
SET @VALOR_INICIAL = 1
SET @CONTADOR = 1
SELECT @VALOR_FINAL = COUNT(*) FROM [TABELA DE CLIENTES]	-- Utilizamos um SELECT para pegar sempre o numero atualizado da tabela
SET @ALEATORIO = [dbo].[NumeroAleatorio](@VALOR_INICIAL, @VALOR_FINAL)

-- Declarando um cursor para pegar todos os CPFs e logo poder selecionar de acordo com @ALEATORIO
DECLARE CURSOR1 CURSOR FOR SELECT CPF FROM [TABELA DE CLIENTES]

-- Abrindo o Cursor
OPEN CURSOR1

-- Pegando o primeiro elemento do Cursor
FETCH NEXT FROM CURSOR1 INTO @CLIENTE_ALEATORIO

-- Percorrendo o Cursor
WHILE @CONTADOR < @ALEATORIO
BEGIN
	FETCH NEXT FROM CURSOR1 INTO @CLIENTE_ALEATORIO
	SET @CONTADOR = @CONTADOR + 1
END

CLOSE CURSOR1
DEALLOCATE CURSOR1

SELECT @CLIENTE_ALEATORIO

-- Pegando o vendedor aleatorio

-- Declarando variaveis 
DECLARE @VENDEDOR_ALEATORIO VARCHAR(12),
		@VALOR_INICIAL INT,
		@VALOR_FINAL INT,
		@ALEATORIO INT,
		@CONTADOR INT

-- Setando valores das variaveis
SET @VALOR_INICIAL = 1
SET @CONTADOR = 1
SELECT @VALOR_FINAL = COUNT(*) FROM [TABELA DE VENDEDORES]	-- Utilizamos um SELECT para pegar sempre o numero atualizado da tabela
SET @ALEATORIO = [dbo].[NumeroAleatorio](@VALOR_INICIAL, @VALOR_FINAL)

-- Declarando um cursor para pegar todos os matriculas e logo poder selecionar de acordo com @ALEATORIO
DECLARE CURSOR1 CURSOR FOR SELECT MATRICULA FROM [TABELA DE VENDEDORES]

OPEN CURSOR1

-- Pegando o primeiro elemento do Cursor
FETCH NEXT FROM CURSOR1 INTO @VENDEDOR_ALEATORIO

-- Percorrendo o Cursor
WHILE @CONTADOR < @ALEATORIO
BEGIN
	FETCH NEXT FROM CURSOR1 INTO @VENDEDOR_ALEATORIO
	SET @CONTADOR = @CONTADOR + 1
END

CLOSE CURSOR1
DEALLOCATE CURSOR1

SELECT @VENDEDOR_ALEATORIO

-- No vídeo desta aula, criamos um script para obter o cliente e vendedor através da função de número aleatório.
-- Neste exercício, crie o script para obter o produto também usando a função de número aleatório.

-- Obtendo quantos produtos existem
SELECT
	*
FROM
	[TABELA DE PRODUTOS]

-- Declarando variaveis 
DECLARE @PRODUTO_ALEATORIO VARCHAR(12),
		@VALOR_INICIAL INT,
		@VALOR_FINAL INT,
		@ALEATORIO INT,
		@CONTADOR INT

-- Definindo os valores das variaveis
SET @VALOR_INICIAL = 1
SET @CONTADOR = 1
SELECT @VALOR_FINAL = COUNT(*) FROM [TABELA DE PRODUTOS]
SET @ALEATORIO = [dbo].[NumeroAleatorio](@VALOR_INICIAL, @VALOR_FINAL)

-- Declarando o Cursor
DECLARE CURSOR1 CURSOR FOR SELECT [CODIGO DO PRODUTO] FROM [TABELA DE PRODUTOS]

-- Abrindo o cursor e pegando o proximo
OPEN CURSOR1 
FETCH NEXT FROM CURSOR1 INTO @ALEATORIO 

WHILE @CONTADOR < @ALEATORIO
BEGIN
	FETCH NEXT FROM CURSOR1 INTO @ALEATORIO 
	SET @CONTADOR = @CONTADOR +1
END

CLOSE CURSOR1
DEALLOCATE CURSOR1

SELECT @ALEATORIO


