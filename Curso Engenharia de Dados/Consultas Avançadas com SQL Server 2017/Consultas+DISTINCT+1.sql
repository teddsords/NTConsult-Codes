-- Secionamdo todos os registros mostrandod embalagem e tamanho
SELECT EMBALAGEM, TAMANHO FROM [TABELA DE PRODUTOS]

-- Mostrandod os registros evitando assim mostrar aqueles registros repetidos
SELECT DISTINCT EMBALAGEM, TAMANHO FROM [TABELA DE PRODUTOS]

-- Mostrando a embalagem e tamanho dos registros onde o sabor é igual a laranja, sem duplicações
SELECT DISTINCT EMBALAGEM, TAMANHO FROM [TABELA DE PRODUTOS] WHERE
[SABOR] = 'Laranja'


-- Mostrando a embalagem, tamanho e sabor.
SELECT DISTINCT EMBALAGEM, TAMANHO, SABOR FROM [TABELA DE PRODUTOS]

-- Pesquisando para saber quantos bairros diferentes há na cidade do RJ
SELECT DISTINCT Bairro FROM [TABELA DE CLIENTES] WHERE CIDADE = 'Rio de Janeiro'

-- Usar o comando TOP NUMERO para selecionar os registros da consulta começando do topo até o número específicado
SELECT * FROM [TABELA DE PRODUTOS]	-- Tem 30+ registros

-- Selecionando os primeiros 3 registros da tabela de produtos
SELECT TOP 3 * FROM [TABELA DE PRODUTOS]	-- So mostra os primeiros 3 registros

-- Mostrando todos os registros da tabela de produtos cujo sabor é laranja
SELECT * FROM [TABELA DE PRODUTOS] WHERE SABOR = 'Laranja' -- Tem 5 registros


-- Selecionando os primeiros 3 registros da consulta dos produtos com sabor Laranja
SELECT TOP 3 * FROM [TABELA DE PRODUTOS] WHERE SABOR = 'Laranja'

-- O comando TOP também pode ser utilizado com o comando DISTINCT
SELECT DISTINCT EMBALAGEM, TAMANHO FROM [TABELA DE PRODUTOS]

-- Vamos selecionar unicamente os primeiros 3 registros
SELECT DISTINCT TOP 3 EMBALAGEM, TAMANHO FROM [TABELA DE PRODUTOS]

-- Ainda sobre o comando TOP, vamos pegar as primeiras 10 vendas do 1/01/2017
SELECT TOP 10 * FROM [NOTAS FISCAIS] WHERE DATA = '2017-01-01'