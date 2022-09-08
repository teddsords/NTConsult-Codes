-- Autoriza��es servidor
-- Se executarmos o comando abaixo veremos as seguran�as a n�vel de servidor
-- SELECT * FROM sys.fn_builtin_permissions('') WHERE class_desc = 'SERVER'

SELECT 
	* 
FROM
	sys.fn_builtin_permissions('')
WHERE
	class_desc = 'SERVER'

-- � uma lista extensa. Podemos mecnionar alguns casos
	-- CREATE ANY DATABASE: Permite ao usu�rio criar novos bancos de dados e armazenar bancos de dados
	-- ALTER ANY LOGIN: Permite ao usu�rio modificar logins na inst�ncia, redefinir senhas e criar novos logins
	-- ALTER ANY DATABSE: Permite que o usu�rio altere as op��es do banco de dados e crie novos bancos de dados.

-- Autoriza��es Bando de Dados
-- Existem algumas autoriza��es de acessos a bando de dados que podem ser associadas aos usu�rios
	-- db_owner: Membros da fun��o de banco de dados fixa db_owner podem executar todas as atividades configura��o e manuten��o
			--   no banco de dados, bem como remover o banco de dados no SQL Server

	-- db_securityadmin: Membros da fun��o de bando de dados db_securityadmin podem modificar a associa��o de fun��es e gerenciar permiss�es

	-- db_accessadmin: Membros da fun��o de banco de dados fica db_accessadmin podem adicionar ou remover o acesso ao bando de dados para
			-- para logons do Windows, grupos do Windows e logons do SQL Server

	-- db_backupoperator: Membros da fun��o de banco de dados fixa db_backupoperator podem fazer backup do banco de dados

	-- db_ddladmin: Membros da fun��o de banco de dados fixa db_ddladmin podem executar qualquer comando Data Definition Language (DDL) em um banco de dados

	-- db_datawriter: Membros da fun��o de banco de dados fixa db_datawriter podem adicionar, excluir ou alterar dados em todas as tabelas de usu�rio

	-- db_datareader: Membros da fun��o de banco de dados fixa db_data reader podem ler todos os dados de todas as tabelas de usu�rio

	-- db_denydatawriter: Membros da fun��o de bando de dados fixa db_denydatawriter n�o podem adicionar modificar ou exluir nenhum dado nas tabelas de usu�rio

	-- db_denydatareader: Membros da fun��o de banco de dados fixa db_data reader n�o podem ler todos os dados de todas as tabelas de usu�rio

-- Podemos usar o comando:
-- USE <database name> sp_addrolemember '<rule name>', '<user>'

-- Criando login
CREATE LOGIN pedro WITH PASSWORD  = 'pedro'

-- Criando usu�rio e vindulando login ao usu�rio
CREATE USER pedro FOR LOGIN pedro


-- Fazendo com que Pedro s� possa ler dados
USE SUCOS_VENDAS
EXEC sp_addrolemember 'db_datareader', 'pedro'

-- Se logo ap�s isso o Pedro tentar fazer uma leitura, dar� certo
SELECT 
	*
FROM 
	[NOTAS FISCAIS]

-- No entanto, se o Pedro tentar inserir, ele ser� negado
INSERT INTO [NOTAS FISCAIS]
	(CPF, MATRICULA, DATA, NUMERO, IMPOSTO)
VALUES
	('7771579779', '00235', '20180601', '100000000', 0.1)

-- Para permitir a escrita de dados
EXEC sp_addrolemember 'db_datawriter', 'pedro'