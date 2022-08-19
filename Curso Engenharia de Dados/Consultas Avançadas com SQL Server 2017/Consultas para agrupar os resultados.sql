-- Agrupando os resultados
-- SELECT CAMPOS FROM TABLE GROUP BY CAMPO

--EX: Queremos agurpar pelo campo X e somar os valores me Y
-- SELECT X, SUM(Y) FROM TAB GROUP BY X

-- Podemos usar
-- * SUM, MAX, MIN, AVG, COUNT

-- Quando omitimos os campos de agregação será agregado para toda a tabela
-- SELECT SUM(Y) FROM TABLE

-- Selecionando o estado e limite de crédito  de todos os registros da tabela de clientes
SELECT ESTADO, [LIMITE DE CREDITO] FROM [TABELA DE CLIENTES]


-- Selecionando o estado e limite de crédito de todos os registros da tabela
-- e agrupando por estado e somando o limite de crédito
SELECT ESTADO, SUM([LIMITE DE CREDITO]) FROM[TABELA DE CLIENTES] GROUP BY ESTADO

-- Mesma coisa de cima, mas fazendo a media
SELECT ESTADO, AVG([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] GROUP BY ESTADO

-- Selecionando a embalagem e o máximo do preço de lista da tabela de produtos
-- e agrupando por embalagem
SELECT EMBALAGEM, MAX([PREÇO DE LISTA]) FROM [TABELA DE PRODUTOS] GROUP BY EMBALAGEM

-- Mesma coisa de cima, mass selecionando o menor preço
SELECT EMBALAGEM, MIN([PREÇO DE LISTA]) FROM [TABELA DE PRODUTOS] GROUP BY EMBALAGEM


-- Selecionando a embalagem e contando quantos produtos tem por embalagem
SELECT EMBALAGEM, COUNT(*) FROM [TABELA DE PRODUTOS] GROUP BY EMBALAGEM


-- Mostrando o limite de credito por bairros de SP
-- O commando GROUP BY sempre vai vir depois de FROM  e WHERE
SELECT BAIRRO, SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES]
WHERE ESTADO = 'SP' GROUP BY BAIRRO
-- Interessante saber que o GROUP BY ja tem embutido um ORDER BY asc

-- Caso precisemos ordernar de maneira descendente faremos o seguinte
SELECT BAIRRO, SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES]
WHERE ESTADO = 'SP' GROUP BY BAIRRO ORDER BY BAIRRO DESC


-- IMPORTANTE MENCIONAR QUE O CAMPO UTILIZADO NO GROUP BY DEVE ESTAR PRESENTE
-- NA SELEÇÃO
-- Então se temos dois campos e um outro de soma, temos que usar os dois campos 
-- no GROUP BY

-- Por exemplo:
SELECT BAIRRO, ESTADO, SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES]
WHERE ESTADO = 'SP' GROUP BY BAIRRO

--Maneira correta de fazer
SELECT BAIRRO, ESTADO, SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES]
WHERE ESTADO = 'SP' GROUP BY BAIRRO, ESTADO


-- Quantos itens de venda existem com a maior quantidade de venda para o produto
SELECT COUNT(*) FROM [ITENS NOTAS FISCAIS]
WHERE [CODIGO DO PRODUTO] = '1101035'
AND QUANTIDADE = 99

