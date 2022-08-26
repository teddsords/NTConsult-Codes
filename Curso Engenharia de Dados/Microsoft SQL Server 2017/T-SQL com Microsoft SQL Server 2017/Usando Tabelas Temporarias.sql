-- Tabelas temporarias
-- Existem 3 tipos de tabelas temporarias?
	-- Seus nomes come�am com # --> Tabelas que valem para a conex�o vigente
	-- Seus nomes come�am com ## --> Tabelas que valem para varias conex�es
	-- Seus nomes come�am com @ --> Tabelas que valem para o procedimento que est� sendo executado

-- Criando uma tabela tempor�ria
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
			INSERT INTO @TABELA_NUMEROS (NUMERO, [STATUS]) VALUES (@LIMITE_MINIMO, '� NOTA FISCAL')
			INSERT INTO #TABELA_NUMEROS2 (NUMERO, [STATUS]) VALUES (@LIMITE_MINIMO, '� NOTA FISCAL')
		END
	ELSE
		BEGIN
			INSERT INTO @TABELA_NUMEROS (NUMERO, [STATUS]) VALUES (@LIMITE_MINIMO, 'N�O � NOTA FISCAL')
			INSERT INTO #TABELA_NUMEROS2 (NUMERO, [STATUS]) VALUES (@LIMITE_MINIMO, 'N�O � NOTA FISCAL')
		END

	SET @LIMITE_MINIMO = @LIMITE_MINIMO +1
	
END

-- Se executarmos esse comando sozinho, a tabela nao existira
SELECT
	*
FROM
	@TABELA_NUMEROS

-- Mas se rodar esse comando, ele existira porque � uma tabela tempor�ria por conex�o
SELECT
	*
FROM
	#TABELA_NUMEROS2
