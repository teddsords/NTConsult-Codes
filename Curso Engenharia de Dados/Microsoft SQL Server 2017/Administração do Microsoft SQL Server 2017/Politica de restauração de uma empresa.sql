-- Recuperando o backup de transações
-- Duas políticas de backuo:
	-- FULL: Voltada para bancos que fazem atualizações em BATCH
	-- FULL e LOG: Para bancos de uso intensivo
-- A estratégia combinada possibilita a recuperação do banco em um determinado momento




-- PARA RECUPERAR O BANCO TEMOS QUE FAZER O SEGUINTE:
	-- 1. COMEÇA RESTAURANDO O BACKUP FULL
	-- 2. RESTAURA O BACKUP DIFFERENTIAL MAIS PRÓXIMO DO HORÁRIO OU DATA DO ESTDO DESEJADO
	-- 3. RESTAURA OS BACKUPS DE LOG ATÉ ATINGIR A HORA

-- Exemplo da rotina de backups de um banco de dados de uso intenso
USE SUCOS_VENDAS
CREATE TABLE TST_BACKUP (POS INT)
INSERT INTO TST_BACKUP (POS) VALUES (1)
SELECT * FROM TST_BACKUP

-- Às 01:00 geramos um backup full inicial
BACKUP DATABASE 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH INIT

-- Às 04:00 geramos um backup de log
INSERT INTO 
	TST_BACKUP (POS) 
VALUES 
	(2)		-- Só para sabermos em qual posição nos encontramos

BACKUP LOG 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH  NOINIT

-- Às 06:00 geramos um backup de log
INSERT INTO 
	TST_BACKUP (POS) 
VALUES 
	(3)		-- Só para sabermos em qual posição nos encontramos

BACKUP LOG 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH  NOINIT

-- Às 08:00 geramos um backup de log
INSERT INTO 
	TST_BACKUP (POS) 
VALUES 
	(4)		-- Só para sabermos em qual posição nos encontramos

BACKUP LOG 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH  NOINIT



-- Às 09:00 geramos um backup de diferencial
INSERT INTO 
	TST_BACKUP (POS) 
VALUES 
	(5)		-- Só para sabermos em qual posição nos encontramos

BACKUP DATABASE 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH  DIFFERENTIAL 



-- Às 10:00 geramos um backup de log
INSERT INTO 
	TST_BACKUP (POS) 
VALUES 
	(6)		-- Só para sabermos em qual posição nos encontramos

BACKUP LOG 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH  NOINIT

-- Às 12:00 geramos um backup de log
INSERT INTO 
	TST_BACKUP (POS) 
VALUES 
	(7)		-- Só para sabermos em qual posição nos encontramos

BACKUP LOG 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH  NOINIT

-- Às 14:00 geramos um backup de log
INSERT INTO 
	TST_BACKUP (POS) 
VALUES 
	(8)		-- Só para sabermos em qual posição nos encontramos

BACKUP LOG 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH  NOINIT


-- Às 14:00 geramos um backup de diferencial
INSERT INTO 
	TST_BACKUP (POS) 
VALUES 
	(9)		-- Só para sabermos em qual posição nos encontramos

BACKUP DATABASE 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH  DIFFERENTIAL 



-- Às 15:00 geramos um backup de log
INSERT INTO 
	TST_BACKUP (POS) 
VALUES 
	(10)		-- Só para sabermos em qual posição nos encontramos

BACKUP LOG 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH  NOINIT

-- Às 17:00 geramos um backup de log
INSERT INTO 
	TST_BACKUP (POS) 
VALUES 
	(11)		-- Só para sabermos em qual posição nos encontramos

BACKUP LOG 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH  NOINIT

-- Às 19:00 geramos um backup de log
INSERT INTO 
	TST_BACKUP (POS) 
VALUES 
	(12)		-- Só para sabermos em qual posição nos encontramos

BACKUP LOG 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH  NOINIT

-- Às 21:00 geramos um backup de log
INSERT INTO 
	TST_BACKUP (POS) 
VALUES 
	(13)		-- Só para sabermos em qual posição nos encontramos

BACKUP LOG 
	SUCOS_VENDAS 
TO DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH  NOINIT


SELECT
	*
FROM
	TST_BACKUP




-- QUERO RECUPERAR OS DADOS DAS 17:30
-- 1:00 Backup full inicial
-- 14:00 Backup diferencial
-- 15:00 Backup Logs
-- 17:00 Backup logs


-- APAGANDO A BASE PARA PEGAR O BACKUP
USE master
ALTER DATABASE 
	SUCOS_VENDAS
SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE SUCOS_VENDAS

-- RECUPERANDO O BACUKUP FULL INICIAL DAS 01:00 (1)
RESTORE DATABASE 
	SUCOS_VENDAS 
FROM DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH FILE  = 1, NORECOVERY

-- RECUPERANDO O BACUKUP DIFERENCIAL DAS 09:00 (9)
RESTORE DATABASE 
	SUCOS_VENDAS 
FROM DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH FILE  = 9, NORECOVERY

-- RECUPERANDO O BACUKUP DIFERENCIAL DAS 15:00 (10)
RESTORE LOG 
	SUCOS_VENDAS 
FROM DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH FILE  = 10, NORECOVERY

-- RECUPERANDO O BACUKUP DIFERENCIAL DAS 17:00 (11)
RESTORE LOG 
	SUCOS_VENDAS 
FROM DISK = 
	'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Microsoft SQL Server 2017\Administração do Microsoft SQL Server 2017\Backups\SUCOS_VENDAS COMPLETO.BAK'
WITH FILE  = 11, RECOVERY


-- Verificando se restauramos corretamente até o ponto onde foi solicitado
USE SUCOS_VENDAS

SELECT
	*
FROM
	TST_BACKUP


