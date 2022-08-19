-- Ordenando as saidas
-- SELECT * FROM TABLE ORDER BY CAMPO

-- Ordenando por ASC ou DESC
-- SELECT * FROM TABLE ORDER BY CAMPO ASC/DESC
-- Se omitido o padr�o ser� ASC

-- Podemos ordenar por v�rios campos
-- SELECT * FROM TABLE ORDER BY CAMPO1, CAMPO2
-- E ainda podemos colocar ASC/DESC no final do comando

SELECT * FROM [TABELA DE PRODUTOS]

-- Mostrando todos os produtos e ordenando por ordem ascendente do pre�o
SELECT * FROM [TABELA DE PRODUTOS] ORDER BY [PRE�O DE LISTA]

-- Mostrando todos os produtos e ordenando por ordem descendente do pre�o
SELECT * FROM [TABELA DE PRODUTOS] ORDER BY [PRE�O DE LISTA] DESC

-- Mostrando todos os produtos e ordenando por ordem alf�betica
SELECT * FROM [TABELA DE PRODUTOS] ORDER BY [NOME DO PRODUTO]

-- Mostrando a embalagem e nome do produto e ordenando pela embalagem primeiro e logo pelo nome
SELECT EMBALAGEM, [NOME DO PRODUTO] FROM [TABELA DE PRODUTOS]
ORDER BY EMBALAGEM, [NOME DO PRODUTO]

-- Mostrando embalagem e nomes do produtos e ordenando pela embalagem ASC e nome DESC
SELECT EMBALAGEM, [NOME DO PRODUTO] FROM [TABELA DE PRODUTOS]
ORDER BY EMBALAGEM, [NOME DO PRODUTO] DESC

-- Mostrando embalagem e nomes do produtos e ordenando pela embalagem DESC e nome DESC
SELECT EMBALAGEM, [NOME DO PRODUTO] FROM [TABELA DE PRODUTOS]
ORDER BY EMBALAGEM DESC, [NOME DO PRODUTO] DESC

-- Mostrando embalagem e nomes do produtos e ordenando pela embalagem DESC e nome ASC
SELECT EMBALAGEM, [NOME DO PRODUTO] FROM [TABELA DE PRODUTOS]
ORDER BY EMBALAGEM DESC, [NOME DO PRODUTO]

-- Obtendo a maior venda em quantidade do produto especificado
SELECT [CODIGO DO PRODUTO] FROM [TABELA DE PRODUTOS] 
WHERE [NOME DO PRODUTO] = 'Linha Refrescante - 1 Litro - Morango/Lim�o'

SELECT QUANTIDADE FROM [ITENS NOTAS FISCAIS] 
WHERE [CODIGO DO PRODUTO] = '1101035'
ORDER BY QUANTIDADE DESC