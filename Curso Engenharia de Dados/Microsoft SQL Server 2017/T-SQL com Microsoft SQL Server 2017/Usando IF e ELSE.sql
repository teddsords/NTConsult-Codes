-- IF and ELSE commands 

-- VAMOS VERIFICAR SE A TABELA EXISTE, CASO EXISTA VAMOS FAZER O DROP
-- Quando o comando dentro do IF for de uma linha so podemos omitir o BEGIN & END
IF OBJECT_ID('TABELA_TESTE', 'U') IS NOT NULL
BEGIN
	DROP TABLE TABELA_TESTE
END

CREATE TABLE TABELA_TESTE
(ID VARCHAR(10))


-- Pegando a Data atual
SELECT GETDATE()

-- Pegando o dia que seria com o incremento de dias a partir de hoje
SELECT DATENAME(WEEKDAY, DATEADD(DAY, 6, GETDATE()))

DECLARE @DIA_SEMANA VARCHAR(20),
		@NUMERO_DIAS INT

-- Setando o valor de numero dias antes para logo usar no seguinte SET
SET @NUMERO_DIAS = 10

-- Vamos fazer o deslocamento de dias baseado no valor dentro da variavel NUMERO_DIAS
SET @DIA_SEMANA = DATENAME(WEEKDAY, DATEADD(DAY, @NUMERO_DIAS, GETDATE()))

PRINT @DIA_SEMANA
-- Verificamos se @DIA_SEMANA e dia de semana
IF @DIA_SEMANA = 'SUNDAY' OR @DIA_SEMANA = 'SATURDAY'
	PRINT 'WEEKEND' 
ELSE
	PRINT 'WEEKDAY'

-- Crie um script que, baseado em uma data, conte o número de notas fiscais. 
-- Se houver mais de 70 notas, exiba a mensagem "Muita nota". Se não, exiba a mensagem "Pouca nota". Exiba também o número de notas.
-- 2015-02-14 < 70
-- 2017-11-06 > 70

-- Declarando as variaveis necessarias para o script
DECLARE @QUANTIDADE_NOTAS INT
DECLARE @DATA DATE

-- Colocando o valor da data com muitas notas
SET @DATA = '2017-11-06'

-- Fazendo a contagem de quantas notas existem apra essa data
SELECT
	@QUANTIDADE_NOTAS = COUNT(*)
FROM
	[NOTAS FISCAIS]
WHERE 
	DATA = @DATA

-- Printando a quantidade de notas para claridade do exercicio
PRINT @QUANTIDADE_NOTAS

-- Verificacao da quantidade de notas
IF @QUANTIDADE_NOTAS > 70
	PRINT 'MUITA NOTA'
ELSE
	PRINT 'POUCA NOTA'


-- Usando SELECT dentro do bloco de IF
DECLARE @LIMITE_MAXIMO FLOAT,
		@LIMITE_ATUAL FLOAT,
		@BAIRRO VARCHAR(20)

SET @BAIRRO = 'JARDINS'
SET @LIMITE_MAXIMO = 400000

-- Podemos fazer assim
SELECT
	@LIMITE_ATUAL = SUM([LIMITE DE CREDITO])
FROM
	[TABELA DE CLIENTES]
WHERE
	BAIRRO = @BAIRRO

-- Ou assim
IF @LIMITE_MAXIMO <= (SELECT SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = @BAIRRO)
BEGIN
	PRINT 'VALOR ESTOROU. NAO EH POSSIVEL ABRIR NOVOS CREDITOS'
END
ELSE
BEGIN
	PRINT 'VALOR NAO ESTOROU. EH POSSIVEL ABRIR NOVOS CREDITOS'
END

-- Com base no exercicio anterior, verificar o resultado do SELECT e nao da variavel
DECLARE @DATA2 DATE
SET @DATA2 = '2015-02-14'

IF (SELECT COUNT(*) FROM [NOTAS FISCAIS] WHERE DATA = @DATA2) > 70
BEGIN
	PRINT 'MUITA NOTA'
END
ELSE
BEGIN
	PRINT 'POUCA NOTA'
END
