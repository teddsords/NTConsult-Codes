-- IDENTITY

-- IDENTITY[(START, INCREMENT)]
-- Quando executamos o comando INSERT nao e necessario especificar o campo IDENTITY
-- Podemos ter apenas 1 campo IDENTITY por tabela
-- Propriedade IDENTIY sera especificada na criacao da tabela

-- Criando a tabela
CREATE TABLE 
	TAB_IDENTITY
( ID INT IDENTITY  (1,1) NOT NULL,
  DESCRITOR VARCHAR(20) NULL)

-- Inserindo dados para verificar o funcionamento do campo IDENTITY
INSERT INTO	
	TAB_IDENTITY
(DESCRITOR)
VALUES
	('CLIENTE X')

INSERT INTO	
	TAB_IDENTITY
(DESCRITOR)
VALUES
	('CLIENTE Y')

INSERT INTO	
	TAB_IDENTITY
(DESCRITOR)
VALUES
	('CLIENTE Z')

INSERT INTO	
	TAB_IDENTITY
(DESCRITOR)
VALUES
	('CLIENTE W')

-- Olhando o resultado do campo
SELECT 
	*
FROM 
	TAB_IDENTITY

-- Apagando o registro com ID = 1 para verificar o funcionamento do IDENTITY
DELETE FROM
	TAB_IDENTITY
WHERE
	ID = 1

-- Inserindo um novo dado para identificar o que acontece apos ter apagado um dado
INSERT INTO	
	TAB_IDENTITY
(DESCRITOR)
VALUES
	('CLIENTE A')

-- Vendo o resultado depois de ter inserido um novo dado
SELECT 
	*
FROM 
	TAB_IDENTITY

-- Apagando a tabela para criar novamente e mudar o campo IDENTITY
DROP TABLE TAB_IDENTITY

-- Criando a tabela
CREATE TABLE 
	TAB_IDENTITY
( ID INT IDENTITY  (100,5) NOT NULL,
  DESCRITOR VARCHAR(20) NULL)

-- Inserindo dados para verificar o funcionamento do campo IDENTITY
INSERT INTO	
	TAB_IDENTITY
(DESCRITOR)
VALUES
	('CLIENTE X')

INSERT INTO	
	TAB_IDENTITY
(DESCRITOR)
VALUES
	('CLIENTE Y')

INSERT INTO	
	TAB_IDENTITY
(DESCRITOR)
VALUES
	('CLIENTE Z')

INSERT INTO	
	TAB_IDENTITY
(DESCRITOR)
VALUES
	('CLIENTE W')

-- Vendo o resultado depois de ter inserido um novos dados
-- Com a nova regra de comecar em 100 e incrementar de 5 em 5
SELECT 
	*
FROM 
	TAB_IDENTITY