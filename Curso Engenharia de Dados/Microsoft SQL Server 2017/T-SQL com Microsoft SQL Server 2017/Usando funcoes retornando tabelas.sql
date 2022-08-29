-- Usando funcoes com retorno de tabela

-- Verificamos um cliente na tabela de clientes
SELECT
	*
FROM 
	[TABELA DE CLIENTES]

-- CPF selecionado: 1471156710

-- Vamos ver quantas NFs tem essa pessoa
SELECT
	*
FROM
	[NOTAS FISCAIS]
WHERE
	CPF = '1471156710'

-- Criando a funçao
CREATE FUNCTION ListaNotasClientes (@CPF AS VARCHAR(12)) RETURNS TABLE
AS
	RETURN 
		SELECT
			*
		FROM
			[NOTAS FISCAIS]
		WHERE
			CPF = @CPF

-- Chamando a funcao
SELECT
	*
FROM 
	dbo.ListaNotasClientes('1471156710')


-- Podemos contar tambem quantas NFs tem o cliente
SELECT
	COUNT(*)
FROM 
	dbo.ListaNotasClientes('1471156710')

-- Podemos contar quantas NFs tem todos os clientes da tabela de clientes
SELECT
	CPF,
	(SELECT COUNT(*) FROM dbo.ListaNotasClientes(CPF)) AS NUM_NOTA
FROM
	[TABELA DE CLIENTES]

-- Vendo quanto foi o faturamento de cada cliente
SELECT
	CPF,
	SUM(dbo.FaturamentoNota(NUMERO)) AS TOTAL_FATURAMENTO
FROM
	[NOTAS FISCAIS]
GROUP BY
	CPF

-- Agora juntando ambas as consultas, podemos obter o numero total de NFs e o faturamento total delas
SELECT
	A.CPF,
	A.NUM_NOTA,
	B.TOTAL_FATURAMENTO
FROM 
	(SELECT
		CPF,
		(SELECT COUNT(*) FROM dbo.ListaNotasClientes(CPF)) AS NUM_NOTA
	FROM
		[TABELA DE CLIENTES]) A
INNER JOIN
	(SELECT
		CPF,
		SUM(dbo.FaturamentoNota(NUMERO)) AS TOTAL_FATURAMENTO
	FROM
		[NOTAS FISCAIS]
	GROUP BY
		CPF) B
ON
	A.CPF = B.CPF

-- Ela irá retornar o número de notas fiscais entre duas datas. Transforme isto em uma função chamada FuncTabelaNotas, 
-- onde o resultado é a consulta acima. Lembrando que a data inicial e final serão parâmetros desta função. Depois, teste a função através de um SELECT.
CREATE FUNCTION FuncTabelaNotas (@DATAINICIO AS DATE, @DATAFINAL AS DATE) RETURNS TABLE
AS
RETURN
	SELECT
		DISTINCT DATA,
		dbo.NumeroNotas(DATA) AS NUMERO
	FROM
		[NOTAS FISCAIS]
	WHERE
		DATA >= @DATAINICIO 
		AND
		DATA <= @DATAFINAL

-- Testando a funcao criada acima
SELECT
	*
FROM
	dbo.FuncTabelaNotas('20170101', '20170110')