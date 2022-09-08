-- Autorizações servidor
-- Se executarmos o comando abaixo veremos as seguranças a nível de servidor
-- SELECT * FROM sys.fn_builtin_permissions('') WHERE class_desc = 'SERVER'

SELECT 
	* 
FROM
	sys.fn_builtin_permissions('')
WHERE
	class_desc = 'SERVER'

-- É uma lista extensa. Podemos mecnionar alguns casos
	-- CREATE ANY DATABASE: Permite ao usuário criar novos bancos de dados e armazenar bancos de dados
	-- ALTER ANY LOGIN: Permite ao usuário modificar logins na instância, redefinir senhas e criar novos logins
	-- ALTER ANY DATABSE: Permite que o usuário altere as opções do banco de dados e crie novos bancos de dados.

-- Autorizações Bando de Dados
-- Existem algumas autorizações de acessos a bando de dados que podem ser associadas aos usuários
	-- db_owner: Membros da função de banco de dados fixa db_owner podem executar todas as atividades configuração e manutenção
			--   no banco de dados, bem como remover o banco de dados no SQL Server

	-- db_securityadmin: Membros da função de bando de dados db_securityadmin podem modificar a associação de funções e gerenciar permissões

	-- db_accessadmin: Membros da função de banco de dados fica db_accessadmin podem adicionar ou remover o acesso ao bando de dados para
			-- para logons do Windows, grupos do Windows e logons do SQL Server

	-- db_backupoperator: Membros da função de banco de dados fixa db_backupoperator podem fazer backup do banco de dados

	-- db_ddladmin: Membros da função de banco de dados fixa db_ddladmin podem executar qualquer comando Data Definition Language (DDL) em um banco de dados

	-- db_datawriter: Membros da função de banco de dados fixa db_datawriter podem adicionar, excluir ou alterar dados em todas as tabelas de usuário

	-- db_datareader: Membros da função de banco de dados fixa db_data reader podem ler todos os dados de todas as tabelas de usuário

	-- db_denydatawriter: Membros da função de bando de dados fixa db_denydatawriter não podem adicionar modificar ou exluir nenhum dado nas tabelas de usuário

	-- db_denydatareader: Membros da função de banco de dados fixa db_data reader não podem ler todos os dados de todas as tabelas de usuário

-- Podemos usar o comando:
-- USE <database name> sp_addrolemember '<rule name>', '<user>'

-- Criando login
CREATE LOGIN pedro WITH PASSWORD  = 'pedro'

-- Criando usuário e vindulando login ao usuário
CREATE USER pedro FOR LOGIN pedro


-- Fazendo com que Pedro só possa ler dados
USE SUCOS_VENDAS
EXEC sp_addrolemember 'db_datareader', 'pedro'

-- Se logo após isso o Pedro tentar fazer uma leitura, dará certo
SELECT 
	*
FROM 
	[NOTAS FISCAIS]

-- No entanto, se o Pedro tentar inserir, ele será negado
INSERT INTO [NOTAS FISCAIS]
	(CPF, MATRICULA, DATA, NUMERO, IMPOSTO)
VALUES
	('7771579779', '00235', '20180601', '100000000', 0.1)

-- Para permitir a escrita de dados
EXEC sp_addrolemember 'db_datawriter', 'pedro'