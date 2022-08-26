-- Tabelas temporarias
-- Existem 3 tipos de tabelas temporarias?
	-- Seus nomes começam com # --> Tabelas que valem para a conexão vigente
	-- Seus nomes começam com ## --> Tabelas que valem para varias conexões
	-- Seus nomes começam com @ --> Tabelas que valem para o procedimento que está sendo executado

-- Criando uma tabela temporária
CREATE TABLE #TABELA01
	(ID VARCHAR(10) NULL,
	 NOME VARCHAR(200) NULL)

INSERT INTO #TABELA01 (ID, NOME) VALUES (1, 'JOAO')

-- Executando aqui na mesma consulta, ira funcionar, mas ao trocar de consulta ira retornar erro porque uma nova contulsa = nova conexao
SELECT * FROM #TABELA01

INSERT INTO #TABELA01 (ID, NOME) VALUES (2, 'PEDRO')


SELECT  * FROM ##TABELA02

-- Criando tabela temporaria para procedimento
DECLARE @TABELA_NUMEROS TABLE (NUMERO INT, [STATUS] VARCHAR(200))
CREATE TABLE #TABELA_NUMEROS2 (NUMERO INT, [STATUS] VARCHAR(200))
DECLARE	@LIMITE_MINIMO INT,
		@LIMITE_MAXIMO INT,
		@CONTADOR_NOTAS INT

SET @LIMITE_MINIMO = 1
SET @LIMITE_MAXIMO = 1000

WHILE @LIMITE_MINIMO <= @LIMITE_MAXIMO
BEGIN
	SELECT @CONTADOR_NOTAS = COUNT(*) FROM [NOTAS FISCAIS] WHERE NUMERO = @LIMITE_MINIMO

	IF @CONTADOR_NOTAS > 0
		BEGIN
			INSERT INTO @TABELA_NUMEROS (NUMERO, [STATUS]) VALUES (@LIMITE_MINIMO, 'É NOTA FISCAL')
			INSERT INTO #TABELA_NUMEROS2 (NUMERO, [STATUS]) VALUES (@LIMITE_MINIMO, 'É NOTA FISCAL')
		END
	ELSE
		BEGIN
			INSERT INTO @TABELA_NUMEROS (NUMERO, [STATUS]) VALUES (@LIMITE_MINIMO, 'NÃO É NOTA FISCAL')
			INSERT INTO #TABELA_NUMEROS2 (NUMERO, [STATUS]) VALUES (@LIMITE_MINIMO, 'NÃO É NOTA FISCAL')
		END

	SET @LIMITE_MINIMO = @LIMITE_MINIMO +1
	
END

-- Se executarmos esse comando sozinho, a tabela nao existira
SELECT
	*
FROM
	@TABELA_NUMEROS

-- Mas se rodar esse comando, ele existira porque é uma tabela temporária por conexão
SELECT
	*
FROM
	#TABELA_NUMEROS2
