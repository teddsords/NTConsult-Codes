-- Seguran�a no SQL server

-- Seguran�a - Contas de servi�o

-- * NT SERVICE\MSSQLSERVER para os servi�o do DB
-- * NT SERVICE\SQLSERVERAGENT para os servi�os de agente do SQL Server

-- Se usarmos inst�ncias nomeadas, este nome estar� no nome da conta de servi�o.
-- Podemos associar esta conta de servi�o a:
	-- Contas do servi�o gerenciadas;
	-- Contas do sistema internas
	-- Contas de servi�o gerenciadas do grupo
	-- Contas de usu�rio do dom�nio
	-- Contas do Windows locais

-- Autoriza��o de acesso
-- O SQL Server possui duas autoriza��es de acesso
	-- SQL Server authentication
	-- Windows authentication
		-- Local windows account
		-- Local windows group
		-- Domain account
		-- Domain group

-- Podemos adicionar o login de um grupo do Windows ou su�rio com o comando CREATE LOGIN
-- CREATE LOGIN [SQLSERVER\DBA Team] FROM WINDOWS
-- CREATE LOGIN [SQLSERVER\MAREK] FROM WINDOWS

-- No caso do usu[ario SQL Server n[os mesmos especificamos o login e senha
-- CREATE LOGIN [MAREK] WITH PASSWORD = 'P@ssw0ord'

-- Podemos associar a senha do usu[ario SQL com as diretivas de seguran�a do Windows
-- CREATE LOGIN [MAREK] WITH PASSWORD = 'P@ssw0rd' CHECK_EXPIRATON = ON, CHECK_POLICY = ON

-- Criando usu�rio
CREATE LOGIN tedds WITH PASSWORD = 'tedds@123'