-- Gerando as notas com conteúdo aleatório

DECLARE @CLIENTE VARCHAR(12),	-- Cliente aleatorio
		@VENDEDOR VARCHAR(12),	-- Vendedor aleatorio
		@PRODUTO VARCHAR(12),	-- Produto aleatorio
		@DATA DATE,				-- Data da NF
		@NUMERO INT,			-- Numero da NF
		@IMPOSTO FLOAT,			-- Imposto da NF
		@NUM_ITENS INT,			-- Quantidade de itens diferentes da NF
		@CONTADOR INT,			-- Contador
		@QUANTIDADE INT,		-- Quantidade de cada produto
		@PRECO FLOAT,			-- Preco do produto
		@AUXPRODUTO INT			-- Codigo do produto selecionado (MELHORANDO O CODIGO)

DECLARE @LISTAPRODUTOS TABLE (PRODUTO VARCHAR(20))	-- TABELA PARA ARMAZENAR OS PRODUTOS QUE ESTÃO NA INF (MELHORANDO O CODIGO)
		 

SET @DATA = '20180521'
SET @CONTADOR = 1
SET @CLIENTE = [dbo].[EntidadeAleatoria]('CLIENTE')
SET @VENDEDOR = [dbo].[EntidadeAleatoria]('VENDEDOR')
SELECT @NUMERO = MAX(NUMERO) + 1 FROM [NOTAS FISCAIS]
SET @IMPOSTO = 0.18
SET @NUM_ITENS = [dbo].[NumeroAleatorio](2, 10)

-- Inserindo na tabela de NFs
INSERT INTO [NOTAS FISCAIS]
	(CPF, MATRICULA, DATA, NUMERO, IMPOSTO)
VALUES
	(@CLIENTE, @VENDEDOR, @DATA, @NUMERO, @IMPOSTO)

WHILE @CONTADOR <= @NUM_ITENS
BEGIN

	SET @PRODUTO = [dbo].[EntidadeAleatoria]('PRODUTO')

	SELECT @AUXPRODUTO = COUNT(*) FROM @LISTAPRODUTOS WHERE PRODUTO = @PRODUTO

	IF @AUXPRODUTO = 0
	BEGIN
	-- MELHORIA DO CODIGO
		SET @QUANTIDADE = [dbo].[NumeroAleatorio](5, 100)
		SELECT @PRECO  = [PREÇO DE LISTA] FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = @PRODUTO
		INSERT INTO [ITENS NOTAS FISCAIS]
			(NUMERO, [CODIGO DO PRODUTO], QUANTIDADE, PREÇO)
		VALUES
			(@NUMERO, @PRODUTO, @QUANTIDADE, @PRECO)

		SET @CONTADOR = @CONTADOR + 1
	END
	INSERT INTO @LISTAPRODUTOS (PRODUTO) VALUES(@PRODUTO)

	/* MELHORANDO O CODIGO
	SET @QUANTIDADE = [dbo].[NumeroAleatorio](5, 100)
	SELECT @PRECO  = [PREÇO DE LISTA] FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = @PRODUTO

	-- Inserindo na tabela de INFs
	INSERT INTO [ITENS NOTAS FISCAIS]
		(NUMERO, [CODIGO DO PRODUTO], QUANTIDADE, PREÇO)
	VALUES
		(@NUMERO, @PRODUTO, @QUANTIDADE, @PRECO)

	SET @CONTADOR = @CONTADOR + 1

	*/
END

-- Complemente a consulta criada no exercício anterior. Agora, obtenha os dados da nota fiscal, 
-- conforme o vídeo desta aula, e inclua na tabela de notas e de itens. Execute o script diversas vezes e veja se irá ocorrer um erro. Transcreva este erro.

-- Feito encima!

-- Esse código de cima gera erro, pois não garantimos que o Codigo do produto seja único numa nota! vamos melhorar o código

