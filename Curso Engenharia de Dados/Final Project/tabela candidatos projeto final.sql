use db_projeto_final

DROP TABLE CANDIDATOS

CREATE TABLE CANDIDATOS
(
	NOME VARCHAR (100) NOT NULL,
	SOBRENOME VARCHAR (100) NOT NULL,
	CPF VARCHAR (11) NOT NULL UNIQUE,
	[DATA DE NASCIMENTO] DATE NOT NULL,
	[E-MAIL] VARCHAR (100) NOT NULL UNIQUE,	-- UNIQUE vai garantir que o e-mail seja o unico
	SENHA VARCHAR (50) NOT NULL,
	[CONFIRMA SENHA] VARCHAR (50) NOT NULL,
	TELEFONE VARCHAR (15) NOT NULL,			-- O valor de 15 foi definido pelo maior número no mundo, seguindo o link: https://bit.ly/3ydVO6T
	LINKEDIN VARCHAR (100) NULL,			-- O valor de 100 foi definido para dar uma folga nas URL
	GITHUB VARCHAR (100) NULL,				-- Idém ao étem anterior
	ESCOLARIDADE VARCHAR (25) NOT NULL,		-- Levando em consideração todas as opções disponíveis para os candidatos, o maior tem um cumprimento de 23, então folga de 2 para o campo
	[TIPO VAGA] VARCHAR (10) NULL,			-- Levando em consideração todas as op~ções disponíveis para os candidatos, o maior tem um cumprimento de 7, então folga de 3 para o campo
	[PERMISSAO E-MAIL] BIT NOT NULL,		-- 0 para representar FALSE e 1 para representar TRUE
	[PERMISSAO WA] BIT NOT NULL,			-- Idém ao ítem anterior
	[POLITICAS PRIVACIDADE] BIT NOT NULL,	-- Idém ao ítem anterior
	[NOME ARQUIVO CV] varchar(150) NULL,
	CV	varbinary(max) NULL						-- Para conter os dados do CV de forma binaria
	CONSTRAINT [PK_CANDIDATOS] PRIMARY KEY CLUSTERED 
([CPF] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

use db_projeto_final
select * from CANDIDATOS

INSERT INTO 
	CANDIDATOS
(
	NOME, 
	SOBRENOME,
	CPF,
	[DATA DE NASCIMENTO],
	[E-MAIL],
	SENHA,
	[CONFIRMA SENHA],
	TELEFONE,
	LINKEDIN,
	GITHUB,
	ESCOLARIDADE,
	[TIPO VAGA],
	[PERMISSAO E-MAIL],
	[PERMISSAO WA],
	[POLITIVAS PRIVACIDADE]
)
VALUES
(
	'Teddy',
	'Ordonez',
	'07505046171',
	'1996-09-17',
	'teddyonu@hotmail.com',
	'12345',
	'12345',
	'5547992878861',
	'https://www.linkedin.com/in/teddyordonez/',
	'https://www.github.com/teddsords/',
	'Pos-Graduacao Cursando',
	'Junior',
	1,
	1,
	1
)