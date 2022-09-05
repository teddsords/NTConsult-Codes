-- Backups

--	* Processo de BACKUP consiste em fazer c�pias de base de dados ou de log de transa��es para posterior recupera��o
--	* BACKUPs podem ser usados tamb�m para migrar bancos de um ambiente para outro
--	* Existem 3 tipos de BACKUPs:
--		- Full
--		- Diferencial
--		- Transact

-- Full Backup
-- * Consiste em um backup completo
-- * Tanto dados quanto log de transa��es ser�o salvos neste backup
-- Se colocado o comando NOINIT, ele ir� acrescentar uma nova parte ao log original, caso contr�rio um novo backup ser� criado
-- BACKUP DATABASE <DB NAME> TO DISK = '<FILE DIRECTORY AND NAME>'

-- Transact Backup
-- * Um backup de transa��es representa o armazenamento apenas das modifica��es dos dados
-- O processo de backcup faz parte de uma pol�tica de manuten��o de dados definida pela empresa
-- BACKUP LOG <DB NAME> TO DISK = '<FILE DIRECTORY AND NAME>'


-- Diferencial backuo
-- * O SQL SERVER tem uma estrutura interna chamada Diferencial Map. Esta estrutura mapeia toda a mudan�a efetuada no banco desde o �ltimo backup
-- * O backup diferencial utiliza esta estrutura interna para fazer um backup ful apenas das diferen�as.
-- ele substitiu uma pol�tica de backup que tenha que gerar centenas de logs de transa��o
-- * Acaba sendo mais r�pido e eficiente.
-- BACKUO DATABASE <DB NAME> TO = '<FILE DIRECTORY AND NAME>' WITH DIFFERENTIAL

-- Politicas de Backup
-- Por exemplo:
	-- No in�cio da semana efetuamos um backup full
	-- A cada hor afazemos um backup log
	-- No final do dia fazemos um backup differential
	-- No in�cio da semana seguinte o ciclo se encerra e voltamos a um backup full


