SELECT * FROM [TABELA DE PRODUTOS]

-- Selecionando registros que tem a palavra Litros no meio do nome do produto
SELECT * FROM [TABELA DE PRODUTOS] WHERE [NOME DO PRODUTO] LIKE '%Litros%'

-- Selecionando os registros que come�am com Litros no nome do produto (n�o h�)
SELECT * FROM [TABELA DE PRODUTOS] WHERE [NOME DO PRODUTO] LIKE 'Litros%'


-- Selecionando registros que cont�m a palavra Litros e s�o de sabor laranja
SELECT * FROM [TABELA DE PRODUTOS] WHERE [NOME DO PRODUTO] LIKE '%Litros%' AND [SABOR] = 'Laranja'


-- Selecionando os registros que tem como �ltimo sobrenome Mattos
SELECT * FROM [TABELA DE CLIENTES] WHERE NOME LIKE '%Mattos'
