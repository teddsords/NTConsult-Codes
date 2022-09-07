-- Segurança no SQL server

-- Segurança - Contas de serviço

-- * NT SERVICE\MSSQLSERVER para os serviço do DB
-- * NT SERVICE\SQLSERVERAGENT para os serviços de agente do SQL Server

-- Se usarmos instâncias nomeadas, este nome estará no nome da conta de serviço.
-- Podemos associar esta conta de serviço a:
	-- Contas do serviço gerenciadas;
	-- Contas do sistema internas
	-- Contas de serviço gerenciadas do grupo
	-- Contas de usuário do domínio
	-- Contas do Windows locais

-- Autorização de acesso
-- O SQL Server possui duas autorizações de acesso
	-- SQL Server authentication
	-- Windows authentication
		-- Local windows account
		-- Local windows group
		-- Domain account
		-- Domain group

-- Podemos adicionar o login de um grupo do Windows ou suário com o comando CREATE LOGIN
-- CREATE LOGIN [SQLSERVER\DBA Team] FROM WINDOWS
-- CREATE LOGIN [SQLSERVER\MAREK] FROM WINDOWS

-- No caso do usu[ario SQL Server n[os mesmos especificamos o login e senha
-- CREATE LOGIN [MAREK] WITH PASSWORD = 'P@ssw0ord'

-- Podemos associar a senha do usu[ario SQL com as diretivas de segurança do Windows
-- CREATE LOGIN [MAREK] WITH PASSWORD = 'P@ssw0rd' CHECK_EXPIRATON = ON, CHECK_POLICY = ON

-- Criando usuário
CREATE LOGIN tedds WITH PASSWORD = 'tedds@123'