

-- Seleciona os produtos que tem o sabor de manga ou tamaho 700ml
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] = 'Manga' OR [TAMANHO] = '700 ml' 


-- Seleciona o registro donde o sabor é manga  e o tamanho é 700ml
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] = 'Manga' AND [TAMANHO] = '700 ml' 


--Seleciona os registros que não tem sabor de manga de tamanho 700ml
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
NOT ([SABOR] = 'Manga' AND [TAMANHO] = '700 ml')


-- Seleciona os registros onde não se cumprem as regras, ou seja, nenhum é de 700 ml e nenhum é de sabor de manga
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
NOT ([SABOR] = 'Manga' OR [TAMANHO] = '700 ml')


-- Seleciona os registros onde o sabor é manga e o tamanho não é 700 ml
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] = 'Manga' AND NOT ( [TAMANHO] = '700 ml')

-- Seleciona os registros onde o sabor é manga ou laranja
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] IN ('Manga', 'Laranja')

-- Outra maneira de fazer o comando de cima
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] = 'Manga' OR [SABOR] ='Laranja'

-- Seleciona os registros onde o sabor não é nem manga nem laranja
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] NOT IN ('Manga', 'Laranja')

-- Outra maneira de fazer o comando de cima
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
NOT ([SABOR] = 'Manga' OR [SABOR] = 'Laranja')

-- Seleciona os registros onde o sabor é manga ou laranja, mas o valor é maior que 10
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] IN ('Manga', 'Laranja') AND [PREÇO DE LISTA] > 10


-- Seleciona os registros onde o sabor é manga ou laranja e o preço de lista está entre 10 e 13
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] IN ('Manga', 'Laranja') AND [PREÇO DE LISTA] BETWEEN 10 AND 13

-- Outra maneira de fazer o comando de cima
SELECT * FROM [TABELA DE PRODUTOS] WHERE 
[SABOR] IN ('Manga', 'Laranja') AND [PREÇO DE LISTA] >= 10 AND [PREÇO DE LISTA] <= 13

-- Selecionando os registros onde a quantidade é maior que 60 e o preço menor ou igual a 3
SELECT *  FROM [ITENS NOTAS FISCAIS] 
WHERE [QUANTIDADE] > 60 AND [PREÇO] <= 3