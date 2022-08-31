-- Cursor de v�rios campos

-- Declarando variaveis
DECLARE @NOME VARCHAR(200),
		@ENDERECO VARCHAR(MAX)

-- Declarando o cursor
DECLARE CURSOR1 CURSOR FOR
SELECT
	NOME,
	([ENDERECO 1] + ' - ' + BAIRRO + ' - ' + CIDADE + ' - ' + ESTADO + ' - ' + CEP) ENDCOMPLETO
FROM
	[TABELA DE CLIENTES]

OPEN CURSOR1
-- Como estamos pegando duas colunas no select, devemos atribuir esses valores
-- para as variaveis no fetch
FETCH NEXT FROM CURSOR1 INTO @NOME, @ENDERECO

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @NOME + ' ENDERCO: ' + @ENDERECO
	FETCH NEXT FROM CURSOR1 INTO @NOME, @ENDERECO
END

DEALLOCATE CURSOR1


-- Crie um script usando um cursor para achar o valor total do faturamento para um m�s e um ano.
-- Dicas: 
--	* Declare tr�s vari�veis: uma que recebe a quantidade, outra o pre�o e uma terceira que ir� acumular o faturamento;
--	* Fa�a um loop no cursor e v� somando o faturamento de cada nota;
--	* Exiba o valor total do limite.

-- Declarando as variaveis
DECLARE @QUANTIDADE INT,
		@PRECO FLOAT,
		@FATURAMENTO FLOAT

-- Declarando o cursor
DECLARE ITENSNF CURSOR FOR
SELECT
	INF.QUANTIDADE,
	INF.PRE�O
FROM
	[ITENS NOTAS FISCAIS] INF
	INNER JOIN
	[NOTAS FISCAIS] NF
	ON INF.NUMERO = NF.NUMERO
WHERE
	MONTH(NF.DATA) = 1
	AND
	YEAR(NF.DATA) = 2017

-- Inicializando o cursor
OPEN ITENSNF

-- Zerando o Faturamento
SET @FATURAMENTO = 0

FETCH NEXT FROM ITENSNF INTO @QUANTIDADE, @PRECO
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @FATURAMENTO = @FATURAMENTO + (@QUANTIDADE * @PRECO)
	FETCH NEXT FROM ITENSNF INTO @QUANTIDADE, @PRECO
END

PRINT @FATURAMENTO

CLOSE ITENSNF
DEALLOCATE ITENSNF