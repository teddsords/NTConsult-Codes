CREATE TABLE INFO_CANDIDATO
(
	CPF VARCHAR(11) NOT NULL PRIMARY KEY,
	NOME VARCHAR(100) NOT NULL,
	SOBRENOME VARCHAR(100) NOT NULL, 
	[DATA DE NASCIMENTO] DATE NOT NULL, 
	ESCOLARIDADE VARCHAR (25) NOT NULL,
	[TIPO VAGA] VARCHAR (10) NULL
);

CREATE TABLE CONTATO_CANDIDATO
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	FK_CONTATO_CANDIDATO VARCHAR(11) FOREIGN KEY REFERENCES INFO_CANDIDATO(CPF),
	EMAIL VARCHAR(100) NOT NULL UNIQUE,
	TELEFONE VARCHAR (15) NOT NULL, 
	LINKEDIN VARCHAR(100) NULL,
	GITHUB VARCHAR(100) NULL
);

CREATE TABLE PERMISSOES_CANDIDATO
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	FK_PERMISSOES_CANDIDATO VARCHAR(11) FOREIGN KEY REFERENCES INFO_CANDIDATO(CPF),
	[PERMISSAO EMAIL] BIT NOT NULL,
	[PERMISSAO WHATSAPP] BIT NOT NULL,
	[POLITICAS PRIVACIDADE] BIT NOT NULL
);


CREATE TABLE ARQUIVO_CANDIDATO
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	FK_ARQUIVO_CANDIDATO VARCHAR(11) FOREIGN KEY REFERENCES INFO_CANDIDATO(CPF),
	[NOME ARQUIVO] VARCHAR(150) NULL,
	[CAMINHO ARQUIVO] VARCHAR(MAX) NULL
);