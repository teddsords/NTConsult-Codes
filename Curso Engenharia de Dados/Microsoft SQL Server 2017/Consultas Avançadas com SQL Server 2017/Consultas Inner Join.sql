-- Usando INNER JOIN

-- JOINS -> Possibilidade de unir uma ou mais tabelas através de campos em comum.

-- INNER JOIN -> Retorna somente quando temos chaves correspondentes
-- SELECT A.NOME, B.HOBBY FROM TABELA_ESQUERDA A INNER JOIN TABELA_DIREITA B
-- ON A.IDENTIFICADOR = B.IDENTIFICADOR

SELECT * FROM [TABELA DE VENDEDORES]

SELECT* FROM [NOTAS FISCAIS]

-- Unindo a tabela de venedores com as notas fiscais correspondentes, para isso utilizamos a matricula do vendedor
SELECT * FROM [TABELA DE VENDEDORES] VENDEDORES INNER JOIN [NOTAS FISCAIS] NOTAS
ON VENDEDORES.MATRICULA = NOTAS.MATRICULA


-- Selecionando a matricula, nome e contando
SELECT 
	VENDEDORES.MATRICULA, 
	VENDEDORES.[NOME], 
	COUNT(*)
FROM 
	[TABELA DE VENDEDORES] VENDEDORES 
	INNER JOIN 
	[NOTAS FISCAIS] NOTAS
	ON VENDEDORES.MATRICULA = NOTAS.MATRICULA
GROUP BY 
	VENDEDORES.MATRICULA, 
	VENDEDORES.NOME

-- Fazendo mesma coisa, mas juntando por ano
SELECT 
	VENDEDORES.MATRICULA, 
	VENDEDORES.[NOME], 
	YEAR(DATA) AS ANO,
	COUNT(*) AS NOTAS
FROM 
	[TABELA DE VENDEDORES] VENDEDORES 
	INNER JOIN 
	[NOTAS FISCAIS] NOTAS
	ON VENDEDORES.MATRICULA = NOTAS.MATRICULA
GROUP BY 
	VENDEDORES.MATRICULA, 
	VENDEDORES.NOME,
	YEAR(DATA)
ORDER BY
	YEAR(DATA),
	VENDEDORES.NOME

-- NEW SCHOOL
SELECT * FROM [TABELA DE VENDEDORES] VENDEDORES INNER JOIN [NOTAS FISCAIS] NOTAS
ON VENDEDORES.MATRICULA = NOTAS.MATRICULA

-- OLD SCHOOL
SELECT * FROM [TABELA DE VENDEDORES], [NOTAS FISCAIS]
WHERE [TABELA DE VENDEDORES].MATRICULA = [NOTAS FISCAIS].MATRICULA


-- Obtenha o faturamento anual da empresa. Leve em consideração que o valor financeiro das vendas consiste em multiplicar a quantidade pelo preço.
SELECT
	YEAR(DATA),
	SUM(ITEM.QUANTIDADE * ITEM.PREÇO) AS FATURAMENTO
FROM 
	[NOTAS FISCAIS] NF
	INNER JOIN
	[ITENS NOTAS FISCAIS] ITEM
	ON NF.NUMERO = ITEM.NUMERO
GROUP BY
	YEAR(DATA)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Left join --> Retorna todos da tabela da esquerda e somente os correspondentes na da direita
-- SELECT A.NOME, B.HOBBY FROM TABELA_ESQUERDA A LEFT JOIN TABELDA_DIREITA B ON A.ID = B.ID


-- Right join -->Retorno todos da tabela da direita e somente os correspondentes na da direita
-- SELECT A.NOME, B.HOBBY FROM TABELA_ESQUERDA A RIGHT JOIN TABELDA_DIREITA B ON A.ID = B.ID

-- Juntando as tabelas de clientes com as NF.
SELECT 
	* 
FROM 
	[TABELA DE CLIENTES] CLIENTES
	INNER JOIN
	[NOTAS FISCAIS] NF
	ON CLIENTES.CPF = NF.CPF

-- Juntando ambas tabelas e contando quantas NFs cada cliente tem
SELECT
	CLIENTES.NOME,
	COUNT(*) AS [TOTAL DE NFs]
FROM
	[TABELA DE CLIENTES] CLIENTES
	INNER JOIN 
	[NOTAS FISCAIS] NF
	ON CLIENTES.CPF = NF.CPF
GROUP BY
	CLIENTES.NOME
-- Só que podemos notar que o resultado nos retorna 14 linhas, no entanto há 15 clientes, porém um cliente ainda não comprou
-- Para isso podemos usar o LEFT JOIN para ele aparecer na tabela

SELECT 
	CLIENTES.NOME,
	COUNT(*)
FROM
	[TABELA DE CLIENTES] CLIENTES
	LEFT JOIN
	[NOTAS FISCAIS] NF
	ON CLIENTES.CPF = NF.CPF
GROUP BY
	CLIENTES.NOME
-- Note-se que no retorno da pesquisa há 1 para o Fábio, isso é devido ao COUNT, pois ele aparece uma vez.
-- Aí podemos verificar na tabela de NFs que ele não tem feito nenhuma compra

-- Verificando que ele consta como 1
SELECT 
	CLIENTES.NOME,
	CLIENTES.CPF,
	COUNT(*)
FROM
	[TABELA DE CLIENTES] CLIENTES
	LEFT JOIN
	[NOTAS FISCAIS] NF
	ON CLIENTES.CPF = NF.CPF
GROUP BY
	CLIENTES.CPF,
	CLIENTES.NOME

-- Pesquisando as NFs com esse CPF 95939180787
SELECT * FROM [NOTAS FISCAIS] WHERE CPF = '95939180787'
-- Retorna vazio confirmando a afirmação anterior


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FULL JOIN --> Retorna todos os registros de todas as tabelas
-- SELECT A.NOME, B.HOBBY FROM TABELA_ESQUERDA A FULL JOIN TABELA_DIREITA B
-- ON A.ID = B.ID


-- CROSS JOIN --> Retorna o produto cartesiano das duas tabelas
-- SELECT A.NOME, B.HOBBY FROM TABELA_ESQUERDA A, TABELA_DIREITA B

SELECT * FROM [TABELA DE VENDEDORES]

SELECT * FROM [TABELA DE CLIENTES]

-- Com o Inner Join notamos que nem todos os bairros dos clientes correspondem aos bairros dos vendedores
SELECT 
	VENDEDORES.BAIRRO,
	CLIENTES.BAIRRO
FROM
	[TABELA DE VENDEDORES] VENDEDORES
	INNER JOIN
	[TABELA DE CLIENTES] CLIENTES
	ON VENDEDORES.BAIRRO = CLIENTES.BAIRRO


-- Aqui podemos notar qual bairro os vendedores atendem e nao correponde a lista dos clientes
SELECT 
	VENDEDORES.BAIRRO,
	VENDEDORES.NOME,
	CLIENTES.BAIRRO,
	CLIENTES.NOME
FROM
	[TABELA DE VENDEDORES] VENDEDORES
	LEFT JOIN
	[TABELA DE CLIENTES] CLIENTES
	ON VENDEDORES.BAIRRO = CLIENTES.BAIRRO



-- Aqui podemos notar qual bairro os clientes moram e nao tem vendedor
SELECT 
	VENDEDORES.BAIRRO,
	VENDEDORES.NOME,
	CLIENTES.BAIRRO,
	CLIENTES.NOME
FROM
	[TABELA DE VENDEDORES] VENDEDORES
	RIGHT JOIN
	[TABELA DE CLIENTES] CLIENTES
	ON VENDEDORES.BAIRRO = CLIENTES.BAIRRO


-- Aqui podemos notar a junção de ambas as tabelas
SELECT 
	VENDEDORES.BAIRRO,
	VENDEDORES.NOME,
	CLIENTES.BAIRRO,
	CLIENTES.NOME
FROM
	[TABELA DE VENDEDORES] VENDEDORES
	FULL JOIN
	[TABELA DE CLIENTES] CLIENTES
	ON VENDEDORES.BAIRRO = CLIENTES.BAIRRO


-- Aqui podemos notar que todos os bairros se juntaram com todos os bairros
SELECT
	VENDEDORES.BAIRRO,
	CLIENTES.BAIRRO
FROM
	[TABELA DE VENDEDORES] VENDEDORES,
	[TABELA DE CLIENTES] CLIENTES


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UNION --> Faz a união de duas ou mais tabelas. Aplica o comando DISTINCT no resultado da consulta
-- Tem que se aplicar em campos que são do mesmo tipo.

-- UNION ALL --> Não aplica o DISTINCT sobre o resultado final da consulta

-- Mostrando todos os registros dos bairros de ambas as tabelas
SELECT DISTINCT [TABELA DE CLIENTES].BAIRRO FROM [TABELA DE CLIENTES]
SELECT DISTINCT [TABELA DE VENDEDORES].BAIRRO FROM [TABELA DE VENDEDORES]

-- Unindo os resultados, sem ter os repetidos entre os clientes e vendedores (SANTO AMARO APARECE UMA VEZ PORQUE O UNION APLICA O DISTINCT)
SELECT DISTINCT
	[TABELA DE CLIENTES].BAIRRO 
FROM 
	[TABELA DE CLIENTES]
UNION
SELECT DISTINCT
	[TABELA DE VENDEDORES].BAIRRO
FROM 
	[TABELA DE VENDEDORES]


-- Unindo os resultados, contendo os repetidos entre clientes e vendedores (POR EXEMPLO: SANTO AMARO, HA UM VENDEDOR E UM CLIENTES COM ESSE BAIRRO)
SELECT DISTINCT
	[TABELA DE CLIENTES].BAIRRO 
FROM 
	[TABELA DE CLIENTES]
UNION ALL
SELECT DISTINCT
	[TABELA DE VENDEDORES].BAIRRO
FROM 
	[TABELA DE VENDEDORES]


-- Tentando fazer UNION com campos de diferentes tipo gera um erro. Tipo de Data de nascimento e DATE e Nome e VARCHAR
SELECT DISTINCT
	[TABELA DE CLIENTES].BAIRRO,
	[TABELA DE CLIENTES].[DATA DE NASCIMENTO]
FROM 
	[TABELA DE CLIENTES]
UNION ALL
SELECT DISTINCT
	[TABELA DE VENDEDORES].BAIRRO,
	[TABELA DE VENDEDORES].NOME
FROM 
	[TABELA DE VENDEDORES]


-- Fazendo UNION com campos do mesmo tipo
SELECT DISTINCT
	[TABELA DE CLIENTES].BAIRRO,
	[TABELA DE CLIENTES].NOME
FROM 
	[TABELA DE CLIENTES]
UNION ALL
SELECT DISTINCT
	[TABELA DE VENDEDORES].BAIRRO,
	[TABELA DE VENDEDORES].NOME
FROM 
	[TABELA DE VENDEDORES]


