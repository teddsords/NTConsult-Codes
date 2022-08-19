CREATE TABLE [TABELA DE PRODUTOS](
	[CODIGO DO PRODUTO] [varchar](10) NOT NULL,
	[NOME DO PRODUTO] [varchar](50),
	[EMBALAGEM] [varchar](20),
	[TAMANHO] [varchar](10),
	[SABOR] [varchar](20),
	[PRECO DE LISTA] [smallmoney])

INSERT INTO [TABELA DE PRODUTOS]
([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO],[SABOR],[PRECO DE LISTA])
VALUES 
('1040107', 'Light - 350 ML - Mel�ncia', 'Lata', '350 ML', 'Mel�ncia', 4.56)	-- Normalmente quando � n�mero, n�o se coloca aspas! Separador decimal � .


-- Incluindo v�rios produtos de uma vez s�
INSERT INTO [TABELA DE PRODUTOS]
([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO],[SABOR],[PRECO DE LISTA])
VALUES 
('1037797', 'Clean - 2 Litros - Laranja', 'PET', '2 L', 'Laranja', 16.01)

INSERT INTO [TABELA DE PRODUTOS]
([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO],[SABOR],[PRECO DE LISTA])
VALUES 
('1000889', 'Sabor da Montanha - 700 ml', 'Garrafa', '700 ml', 'Uva', 6.31)

-- Alterando registros na tabela
UPDATE [TABELA DE PRODUTOS] SET			-- Atualizar na tabela tal, ass seguintes colunas
[EMBALAGEM] = 'Lata',
[PRECO DE LISTA] = 2.46
WHERE [CODIGO DO PRODUTO] = '544931'	-- No lugar que o c�digo do produto � 544931

UPDATE [TABELA DE PRODUTOS] SET
[EMBALAGEM] = 'Garrafa'
where [CODIGO DO PRODUTO] = '1078680'



-- Excluindo registros das tabelas
DELETE FROM [TABELA DE PRODUTOS]
WHERE [CODIGO DO PRODUTO] = '1088126'



-- Incluindo a chave primaria
ALTER TABLE [TABELA DE PRODUTOS]	-- Incluindo a chave primaria na tabela de produtos
ADD CONSTRAINT PK_PRODUTOS			-- Essa chave ter� o nome de PK_PRODUTOS
PRIMARY KEY CLUSTERED ([CODIGO DO PRODUTO])	-- Com os valores de C�dgio do produto
-- O comando de cima deu erro, pois a coluna Codigo do Produto pode ser NULL, vamos arrumar com o seguinte comando

-- Setando as colunas como NOT NULL
ALTER TABLE [TABELA DE PRODUTOS]	-- Alterando a tabela
ALTER COLUMN [CODIGO DO PRODUTO]	-- Alterando a coluna codigo do produto
VARCHAR(10) NOT NULL				-- Informando qual sera a sua nova estrutura


-- Incluindo a chave primaria
ALTER TABLE [TABELA DE PRODUTOS]	-- Incluindo a chave primaria na tabela de produtos
ADD CONSTRAINT PK_PRODUTOS			-- Essa chave ter� o nome de PK_PRODUTOS
PRIMARY KEY CLUSTERED ([CODIGO DO PRODUTO])	-- Com os valores de C�dgio do produto


-- A seguinte inser��o � para demonstrar que a chave primaria bloqueia esse tipo de a��o. A Primary Key n�o pode se repetir, ela � �nica.
INSERT INTO [TABELA DE PRODUTOS]
([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO],[SABOR],[PRECO DE LISTA])
VALUES 
('1000889', 'Sabor da Montanha - 700 ml', 'Garrafa', '700 ml', 'Uva', 6.31)


-- Selecionando a linha onde o codigo do produto e 1000889
SELECT * FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = '1000889'

-- Selecionando a linha onde o asbor e Limao
SELECT * FROM [TABELA DE PRODUTOS] WHERE SABOR = 'Lim�o'


-- Selecionando os registros de acordo com campo n�merico, ou seja, igual a 4.555
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] = 4.555

-- Selecionando os registros que tem um preco maior que 10
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] > 10

-- Selecionando os registros de acordo com campo n�merico, ou seja, menor ou igual a 4.555
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] <= 4.555

-- A comparacao entre valores tambem pode se aplicar para chars
SELECT * FROM [TABELA DE PRODUTOS] WHERE EMBALAGEM = 'Lata'
SELECT * FROM [TABELA DE PRODUTOS] WHERE EMBALAGEM > 'Lata'	-- Nesse caso aplica-se a regra por ordem alfabetica

-- Para fazer a comparacao diferente de. APLICA-SE PARA NUMEROS TAMBEM
SELECT * FROM [TABELA DE PRODUTOS] WHERE EMBALAGEM <> 'Lata'
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] <> 4.555