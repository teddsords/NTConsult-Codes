-- Definindo valores padroes para o campo

-- Criando tabela com valores default para dois campos
CREATE TABLE TAB_PADRAO
( ID INT IDENTITY(1,1) NOT NULL,
  DESCRITOS VARCHAR(20) NULL,
  ENDERECO VARCHAR(200) NULL,
  CIDADE VARCHAR(50) DEFAULT 'Cidade nao definida',
  DATA_CRIACAO DATE DEFAULT GETDATE())

-- Inserindo na tabela como normalmente seria feito
INSERT INTO TAB_PADRAO
	(DESCRITOS, ENDERECO, CIDADE, DATA_CRIACAO)
VALUES
	('Cliente X', 'Rua projetada A', 'Sao Paulo', '2018-04-30')

-- Pegando para ver o resultado
SELECT
	*
FROM 
	TAB_PADRAO

-- Inserindo na tabela omitindo o Endereco, Cidade e Data de Criacao
INSERT INTO TAB_PADRAO
	(DESCRITOS)
VALUES
	('Cliente X')

-- Pegando para ver o resultado
SELECT
	*
FROM 
	TAB_PADRAO