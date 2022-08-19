-- SUB CONSULTAS

-- Podemos fazer isto para sempre ter a nossa consulta atualizada
-- Por exemplo temos a tabela 1 com coluna X com valores A,B,C e com a coluna Y com valores 1,2,3
-- e uma segunda tabela 2 com uma unica coluna com valores 1,2. Quando vamos selecionar aqueles valores da tabela 1,
-- cujo valor em Y seja igual ao valor da tabela 2 podemos fazer o seguinte:
-- SELECT X,Y FROM TAB1 WHERE Y IN (1,2). No entanto temos um problema com este comando, cuando na tabela 2 chegar um novo valor (3)
-- teriamos que atualizar a query para estar de acordo com os valores  da tabela 2.
-- Para evitar isso, podemos fazer uma sub consulta e assim pegar automaticamente todos os valores da tabela 2.
-- SELECT X,Y FROM TAB1 WHERE Y IN (SELECT Y FROM TAB2)

-- Podemos ter uma sub consulta dentro do FROM para assim obter o resultado de uma consulta e logo filtra-lo. Isto e como se aplicassemos um HAVING

-- Mostrando os registros com os nomes e bairros
SELECT NOME, BAIRRO FROM [TABELA DE CLIENTES]


-- Agora so quero obter aqueles nomes e bairros que tambem estao presentes na tabela de vendedores
SELECT
	NOME,
	BAIRRO
FROM
	[TABELA DE CLIENTES]
WHERE
	BAIRRO
	IN(
	SELECT
		BAIRRO
	FROM 
		[TABELA DE VENDEDORES])


-- Selecionando a embalagem e o maior preço desse tipo de embalagem
SELECT EMBALAGEM, MAX([PREÇO DE LISTA]) FROM [TABELA DE PRODUTOS] GROUP BY EMBALAGEM


-- Podemos usar essa consulta anterior para filtrar os valores que desejamos obter como resultado
-- Iremos selecionar a embalagem e o preço menor ou igual a 5
SELECT NOVA_CONSULTA.EMBALAGEM, NOVA_CONSULTA.MAX_PREÇO 
FROM (SELECT EMBALAGEM, MAX([PREÇO DE LISTA]) AS MAX_PREÇO FROM [TABELA DE PRODUTOS] GROUP BY EMBALAGEM)
NOVA_CONSULTA
WHERE NOVA_CONSULTA.MAX_PREÇO <= 5


-- Qual seria a consulta, usando sub-consulta, que seria equivalente a:
-- SELECT CPF, COUNT(*) FROM [NOTAS FISCAIS]
-- WHERE YEAR(DATA) = 2016
-- GROUP BY CPF
-- HAVING COUNT(*) > 2000

SELECT 
	CONSULTA.CPF, 
	CONSULTA.TOTAL
FROM 
	(SELECT 
		CPF, 
		COUNT(*) AS TOTAL 
	FROM 
		[NOTAS FISCAIS] 
	WHERE 
		YEAR(DATA) = 2016 
	GROUP BY 
		CPF) CONSULTA 
WHERE
	CONSULTA.TOTAL > 2000