-- Fun��es matematicas

-- CEILING  --> Retorna o menor inteiro maior que ou igual a express�o num�rica especificada
			--> CEILING(numeric_expression)

-- FLOOR  --> Retorna o maior inteiro menor ou igual � express�o num�rica especificada
		  --> FLOOR (numeric_expression)

-- RAND  --> Retorna um valor float pseudoaleat�rio de 0 a 1, exclusivo
		 --> RAND (*seed)    *seed � opcional

-- ROUND  --> Retorna um valor num�rico, arredondado, para o comprimento ou precis�o especificados
		  --> ROUND(numeric_expression, length [,function])

SELECT CEILING(12.333333333)

SELECT FLOOR(12.333325)

SELECT RAND()

SELECT ROUND(12.3333235, 2)

SELECT * FROM [ITENS NOTAS FISCAIS]

-- Selecionando s� essas duas colunas
SELECT
	QUANTIDADE,
	PRE�O
FROM 
	[ITENS NOTAS FISCAIS]

-- Criando uma coluna com o total da nota fiscal
SELECT 
	QUANTIDADE,
	PRE�O,
	ROUND(QUANTIDADE * PRE�O, 1) AS FATURAMENTO
FROM 
	[ITENS NOTAS FISCAIS]

-- Na tabela de notas fiscais, temos o valor do imposto. J� na tabela de itens, temos a quantidade e o faturamento. Calcule o valor do imposto pago no ano de 2016, arredondando para o menor inteiro.
SELECT
	YEAR(DATA),
	FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRE�O)))
FROM
	[NOTAS FISCAIS] NF
	INNER JOIN
    [ITENS NOTAS FISCAIS] ITENS
	ON
	NF.NUMERO = ITENS.NUMERO
WHERE 
	YEAR(DATA) = 2016
GROUP BY
	YEAR(DATA)
