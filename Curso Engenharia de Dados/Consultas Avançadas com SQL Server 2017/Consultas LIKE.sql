SELECT * FROM [TABELA DE PRODUTOS]

-- Selecionando registros que tem a palavra Litros no meio do nome do produto
SELECT * FROM [TABELA DE PRODUTOS] WHERE [NOME DO PRODUTO] LIKE '%Litros%'

-- Selecionando os registros que começam com Litros no nome do produto (não há)
SELECT * FROM [TABELA DE PRODUTOS] WHERE [NOME DO PRODUTO] LIKE 'Litros%'


-- Selecionando registros que contém a palavra Litros e são de sabor laranja
SELECT * FROM [TABELA DE PRODUTOS] WHERE [NOME DO PRODUTO] LIKE '%Litros%' AND [SABOR] = 'Laranja'


-- Selecionando os registros que tem como último sobrenome Mattos
SELECT * FROM [TABELA DE CLIENTES] WHERE NOME LIKE '%Mattos'
