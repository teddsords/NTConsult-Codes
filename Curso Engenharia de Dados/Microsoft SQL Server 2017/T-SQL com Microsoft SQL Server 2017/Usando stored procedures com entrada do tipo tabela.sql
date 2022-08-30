-- SPs com variaveis do tipo tabela de entrada

SELECT
	CLIENTES.CPF AS CPF,
	CLIENTES.NOME AS NOME,
	SUM(INF.QUANTIDADE * INF.PREÇO) AS FATURAMENTO
FROM
	[TABELA DE CLIENTES] CLIENTES
	INNER JOIN
	[NOTAS FISCAIS] NF
	ON CLIENTES.CPF = NF.CPF
	AND YEAR(NF.DATA) = 2016
	INNER JOIN
	[ITENS NOTAS FISCAIS] INF
	ON NF.NUMERO = INF.NUMERO
GROUP BY
	CLIENTES.CPF, CLIENTES.NOME

-- Podemos criar um LABEL para o tipo da variavel para nao precisar trocar em todos os lugares onde seja utilizado
CREATE TYPE ListaClientes AS TABLE
(CPF VARCHAR (12) NOT NULL)

-- Declarando uma variavel do tipo ListaClientes
DECLARE @Lista as ListaClientes 

-- Inserindo dados para testar a funcionalidade
INSERT INTO @Lista (CPF)
VALUES ('8502682733'), ('8719655770'),('9283760794')

-- Verificando a insercao dos dados
SELECT
	*
FROM
	@Lista

-- Declarando novamente a variavel para utiliza-la na query
DECLARE @Lista as ListaClientes 

-- Inserindo dados para testar a funcionalidade
INSERT INTO @Lista (CPF)
VALUES ('8502682733'), ('8719655770'),('9283760794')

-- Usando a variavel criada anteriormente para selecionar a lista de CPFs dentro da variavel
-- Assim so trazemos os dados dos clientes listados nessa tabela e nao de todos
SELECT
	CLIENTES.CPF AS CPF,
	CLIENTES.NOME AS NOME,
	SUM(INF.QUANTIDADE * INF.PREÇO) AS FATURAMENTO
FROM
	[TABELA DE CLIENTES] CLIENTES
	INNER JOIN
	[NOTAS FISCAIS] NF
	ON CLIENTES.CPF = NF.CPF
	AND YEAR(NF.DATA) = 2016
	INNER JOIN
	[ITENS NOTAS FISCAIS] INF
	ON NF.NUMERO = INF.NUMERO
	INNER JOIN
	@Lista Lista
	ON Lista.CPF = CLIENTES.CPF
GROUP BY
	CLIENTES.CPF, CLIENTES.NOME

-- Quando pasamos por parametro uma variavel do tipo table, devemos colocar o atributo de READONLY
-- Como o corpo da SP é de uma linha só, não é preciso colocar o BEGIN & END
CREATE PROCEDURE FaturamentoClientes2016
@LISTA AS ListaClientes READONLY
AS
	SELECT
		CLIENTES.CPF AS CPF,
		CLIENTES.NOME AS NOME,
		SUM(INF.QUANTIDADE * INF.PREÇO) AS FATURAMENTO
	FROM
		[TABELA DE CLIENTES] CLIENTES
		INNER JOIN
		[NOTAS FISCAIS] NF
		ON CLIENTES.CPF = NF.CPF
		AND YEAR(NF.DATA) = 2016
		INNER JOIN
		[ITENS NOTAS FISCAIS] INF
		ON NF.NUMERO = INF.NUMERO
		INNER JOIN
		@LISTA Lista
		ON Lista.CPF = CLIENTES.CPF
	GROUP BY
	CLIENTES.CPF, CLIENTES.NOME

-- Declarando novamente a variavel para utiliza-la na execucao da SP
DECLARE @Lista as ListaClientes 

-- Inserindo dados para testar a funcionalidade
INSERT INTO @Lista (CPF)
VALUES ('8502682733'), ('8719655770'),('9283760794')

EXEC FaturamentoClientes2016 @LISTA = @Lista

-- Temos a seguinte consulta que nos retorna o número de notas fiscais por dia, onde @ListaDatas é uma variável do tipo tabela, com a lista de datas a serem exibidas:
-- SELECT DATA, COUNT(*) AS NUMERO FROM [NOTAS FISCAIS]
-- WHERE DATA IN (SELECT DATANOTA FROM @ListaDatas)
-- GROUP BY DATA
-- Construa uma SP que retorne o número de notas fiscais por dia, baseada na lista de dias passada como parâmetro.
-- Dicas:
--	* Crie um estrutura do tipo TYPE, onde iremos inserir as datas;
--	* Passe este tipo para a SP como parâmetro, representando a lista de datas. O nome da SP deve ser ListaNumeroNotas;
--	* Utilize o SELECT mencionado acima, usando a variável @ListaDatas como sendo a lista de datas passada como parâmetro;
--	* Crie a SP;
--	* Inicialize algumas datas em uma variável do tipo definido no passo inicial;
--	* Execute a SP.

-- Criando o tipo
CREATE TYPE ListaDatas AS TABLE
(DATA DATE NOT NULL)

-- Criando a SP
CREATE PROCEDURE ListaNumeroNotas 
@ListaData AS ListaDatas READONLY 
AS
	SELECT 
		DATA,
		COUNT(*) AS NUMERO 
	FROM 
		[NOTAS FISCAIS]
	WHERE 
		DATA IN (SELECT DATA FROM @ListaData)
	GROUP BY 
		DATA

-- Declarando a variavel a ser pasada por parametro
DECLARE @ListaData as ListaDatas

-- Inserindo dados
INSERT INTO @ListaData (DATA)
VALUES ('2015-01-01'), ('2015-01-02'),('2015-01-03')

-- Executando a SP
EXEC ListaNumeroNotas @ListaData = @LISTADATA


