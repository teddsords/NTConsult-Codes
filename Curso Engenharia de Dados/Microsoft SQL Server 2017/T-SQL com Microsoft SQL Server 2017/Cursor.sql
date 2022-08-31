-- Cursor
-- Cursor é uma estrutura implementada no T-SQL que permite uma interatividade
-- linha a linha através de uma determinada ordem.

-- Fases para uso do Cursor:
--	* Declaração --> Onde definimos qual consulta SQL estará sendo carregada ao Cursor
--	* Abertura --> Abrimos o Cursos para percorrê-lo linha a linha
--	* Posiciona na primeira linha do Cursor
--	* Percorre linha a linha até o seu final
--	* Fecha o Cursor
--	* Limpa o Cursor da memória

-- Declarando a variavel nome
DECLARE @NOME VARCHAR(200)

-- Declarando o Cursor para pegar os primeiros 4 nomes da tabela
DECLARE CURSOR1 CURSOR FOR
SELECT TOP 4 
	NOME
FROM 
	[TABELA DE CLIENTES]

OPEN CURSOR1
FETCH NEXT FROM CURSOR1 INTO @NOME
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @NOME
	FETCH NEXT FROM CURSOR1 INTO @NOME
END

-- Crie um script usando um cursor para achar o valor total de todos os créditos de todos os clientes.
-- Dicas:
--	* Declare duas variáveis: uma que receba o limite de crédito do cursor e outra o limite de crédito total;
--	* Faça um loop no cursor e vá somando o valor do limite de cada cliente na variável de limite de crédito total;
--	* Exiba o valor total do limite.

-- Essa sera a coluna a ser utilizada
SELECT
	[LIMITE DE CREDITO]
FROM
	[TABELA DE CLIENTES]

-- Declarando as variaveis auxiliares
DECLARE @AUX INT,
		@CREDITOTOTAL INT

-- Zerando o credito total
SET @CREDITOTOTAL = 0

-- Declarando o cursor
DECLARE CURSORLIMITE CURSOR FOR
SELECT
	[LIMITE DE CREDITO]
FROM
	[TABELA DE CLIENTES]

-- Abrindo o cursor
OPEN CURSORLIMITE

-- Pegando o seguinte do cursor
FETCH NEXT FROM CURSORLIMITE INTO @AUX
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @CREDITOTOTAL = @CREDITOTOTAL + @AUX
	FETCH NEXT FROM CURSORLIMITE INTO @AUX
END

PRINT 'Total de limite: ' + CONVERT(VARCHAR(20), @CREDITOTOTAL)