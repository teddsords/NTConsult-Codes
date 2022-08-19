CREATE TABLE [TABELA DE CLIENTES]	-- Comando para criar tabela com o nome "Tabela de Cleintes"
(	[CPF] [VARCHAR] (11),			-- Criando o campo CPF com tamanho de 11
	[NOME] [VARCHAR] (100),			-- Nome com tamanho de 100
	[ENDERECO 1] [VARCHAR] (150),	-- Parte 1 do endereço
	[ENDERECO 2] [VARCHAR] (150),
	[BAIRRO] [VARCHAR] (50),
	[CIDADE] [VARCHAR] (50),
	[ESTADO] [VARCHAR] (2),
	[CEP] [VARCHAR] (8),			-- Utilizamos varchar, pois há CEPs que começam com 0 e se o tipo fosse número ele acabaria tirando
	[DATA DE NASCIMENTO] [DATE],	-- Data de nascimento utilizamos date, pois só precisamos do ano, mês e dia
	[IDADE] [SMALLINT],				-- Para idade usamos small int, pois a idade não chega a ser um valor muito alto
	[SEXO] [VARCHAR] (1),			-- Usamos um único caracter para descrever o sexo
	[LIMITE DE CREDITO] [MONEY],	-- Para o limite de crédito usamos money, pois representa dinheiro
	[VOLUME DE COMPRA] [FLOAT],		-- Volume de compra pode ser quebrado e para isso usamos float
	[PRIMEIRA COMPRA] [BIT])		-- Para descrever se é a primeira compra ou não, utilizamos BIT para representar verdadeiro (1) e falso (0)



ALTER TABLE [TABELA DE CLIENTES]
ALTER COLUMN [CPF]
VARCHAR(11) NOT NULL

ALTER TABLE [TABELA DE CLIENTES]
ADD CONSTRAINT PK_CLIENTES
PRIMARY KEY CLUSTERED (CPF)

USE [SUCOS_VENDAS]
GO

INSERT INTO [dbo].[TABELA DE CLIENTES]
           ([CPF]
           ,[NOME]
           ,[ENDERECO 1]
           ,[ENDERECO 2]
           ,[BAIRRO]
           ,[CIDADE]
           ,[ESTADO]
           ,[CEP]
           ,[DATA DE NASCIMENTO]
           ,[IDADE]
           ,[SEXO]
           ,[LIMITE DE CREDITO]
           ,[VOLUME DE COMPRA]
           ,[PRIMEIRA COMPRA])
     VALUES
           ('00300000001'
           ,'Joao da Silva'
           ,'Rua Projetada A numero 10'
           ,''
           ,'Centro'
           ,'Rio de Janeiro'
           ,'RJ'
           ,'20000000'
           ,'1990-10-25'
           ,27
           ,'M'
           ,120000.5
           ,1000
           ,1)
GO

-- Selecionando os primeiros 1k registros
SELECT TOP (1000) [CPF]
      ,[NOME]
      ,[ENDERECO 1]
      ,[ENDERECO 2]
      ,[BAIRRO]
      ,[CIDADE]
      ,[ESTADO]
      ,[CEP]
      ,[DATA DE NASCIMENTO]
      ,[IDADE]
      ,[SEXO]
      ,[LIMITE DE CREDITO]
      ,[VOLUME DE COMPRA]
      ,[PRIMEIRA COMPRA]
  FROM [SUCOS_VENDAS].[dbo].[TABELA DE CLIENTES]

-- Este comando faz a mesma coisa que o comando de cima
SELECT * FROM [TABELA DE CLIENTES]


-- Comando para obter so o CPF e nome da tabela de clientes
SELECT [CPF],[NOME] FROM [TABELA DE CLIENTES]

-- Comando para alterar o nome das colunas usando como um alias,
-- alterando a ordem das colunas no comando, tambem se altera ordem na qual sao mostradas
SELECT [CPF] AS ID, [NOME] AS CLIENTE FROM [TABELA DE CLIENTES]


-- Selecionando registros por uma data especifica
SELECT * FROM [TABELA DE CLIENTES] WHERE [DATA DE NASCIMENTO] = '1995-09-11'

-- Selecionando registros cuja data seja maior que a especificada
SELECT * FROM [TABELA DE CLIENTES] WHERE [DATA DE NASCIMENTO] > '1995-09-11'

-- Selecionando registros onde o ano de nascimento seja igual a '95
SELECT * FROM [TABELA DE CLIENTES] WHERE YEAR([DATA DE NASCIMENTO]) = 1995


-- Selecionando registros onde o ano de nascimento seja menor que '95
SELECT * FROM [TABELA DE CLIENTES] WHERE YEAR([DATA DE NASCIMENTO]) < 1995

-- Selecionando registros onde o mes de nascimento seja igual a 9
SELECT * FROM [TABELA DE CLIENTES] WHERE MONTH([DATA DE NASCIMENTO]) = 9


-- Selecionando registros onde o dia de nascimento seja igual a 11
SELECT * FROM [TABELA DE CLIENTES] WHERE DAY([DATA DE NASCIMENTO]) = 11