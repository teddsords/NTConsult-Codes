

-- Seleciona os produtos que tem o sabor de manga ou tamaho 700ml
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] = 'Manga' OR [TAMANHO] = '700 ml' 


-- Seleciona o registro donde o sabor � manga  e o tamanho � 700ml
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] = 'Manga' AND [TAMANHO] = '700 ml' 


--Seleciona os registros que n�o tem sabor de manga de tamanho 700ml
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
NOT ([SABOR] = 'Manga' AND [TAMANHO] = '700 ml')


-- Seleciona os registros onde n�o se cumprem as regras, ou seja, nenhum � de 700 ml e nenhum � de sabor de manga
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
NOT ([SABOR] = 'Manga' OR [TAMANHO] = '700 ml')


-- Seleciona os registros onde o sabor � manga e o tamanho n�o � 700 ml
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] = 'Manga' AND NOT ( [TAMANHO] = '700 ml')

-- Seleciona os registros onde o sabor � manga ou laranja
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] IN ('Manga', 'Laranja')

-- Outra maneira de fazer o comando de cima
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] = 'Manga' OR [SABOR] ='Laranja'

-- Seleciona os registros onde o sabor n�o � nem manga nem laranja
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] NOT IN ('Manga', 'Laranja')

-- Outra maneira de fazer o comando de cima
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
NOT ([SABOR] = 'Manga' OR [SABOR] = 'Laranja')

-- Seleciona os registros onde o sabor � manga ou laranja, mas o valor � maior que 10
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] IN ('Manga', 'Laranja') AND [PRE�O DE LISTA] > 10


-- Seleciona os registros onde o sabor � manga ou laranja e o pre�o de lista est� entre 10 e 13
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] IN ('Manga', 'Laranja') AND [PRE�O DE LISTA] BETWEEN 10 AND 13

-- Outra maneira de fazer o comando de cima
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] IN ('Manga', 'Laranja') AND [PRE�O DE LISTA] >= 10 AND [PRE�O DE LISTA] <= 13

-- Selecionando os registros onde a quantidade � maior que 60 e o pre�o menor ou igual a 3
SELECT *  FROM [ITENS NOTAS FISCAIS] 
WHERE [QUANTIDADE] > 60 AND [PRE�O] <= 3