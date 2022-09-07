-- Gerenciamento de propriedades do LOGIN

-- Podemos verificar as propriedades dos logins do SQL consultando a tabela:
-- master.sys.sql_logins

-- Pegando todos os dados dos logins disponiveis para o banco
SELECT
	*
FROM
	master.sys.sql_logins


-- Pegando quando foi a ultima vez que a senha foi definida
SELECT
	NAME,
	LOGINPROPERTY(NAME, 'PasswordLastSetTime')
FROM
	master.sys.sql_logins

-- Criando um usuario com login e senha iguais
CREATE LOGIN
	pedro
WITH PASSWORD = 
	'pedro'

-- Pegando que usuarios tem a mesma senha que o seu login
SELECT 
	NAME AS LOGIN_NAME
FROM
	master.sys.sql_logins
WHERE
	PWDCOMPARE(NAME, PASSWORD_HASH) = 1