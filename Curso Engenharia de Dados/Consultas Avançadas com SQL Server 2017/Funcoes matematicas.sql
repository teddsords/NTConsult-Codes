-- Funções matematicas

-- CEILING  --> Retorna o menor inteiro maior que ou igual a expressão numérica especificada
			--> CEILING(numeric_expression)

-- FLOOR  --> Retorna o maior inteiro menor ou igual à expressão numérica especificada
		  --> FLOOR (numeric_expression)

-- RAND  --> Retorna um valor float pseudoaleatório de 0 a 1, exclusivo
		 --> RAND (*seed)    *seed é opcional

-- ROUND  --> Retorna um valor numérico, arredondado, para o comprimento ou precisão especificados
		  --> ROUND(numeric_expression, length [,function])

SELECT CEILING(12.333333333)

SELECT FLOOR(12.333325)

SELECT RAND()

SELECT ROUND(12.3333235, 2)

SELECT * FROM [ITENS NOTAS FISCAIS]

-- Selecionando só essas duas colunas
SELECT
	QUANTIDADE,
	PREÇO
FROM 
	[ITENS NOTAS FISCAIS]

-- Criando uma coluna com o total da nota fiscal
SELECT 
	QUANTIDADE,
	PREÇO,
	ROUND(QUANTIDADE * PREÇO, 1) AS FATURAMENTO
FROM 
	[ITENS NOTAS FISCAIS]

-- Na tabela de notas fiscais, temos o valor do imposto. Já na tabela de itens, temos a quantidade e o faturamento. Calcule o valor do imposto pago no ano de 2016, arredondando para o menor inteiro.
SELECT
	YEAR(DATA),
	FLOOR(SUM(IMPOSTO * (QUANTIDADE * PREÇO)))
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
