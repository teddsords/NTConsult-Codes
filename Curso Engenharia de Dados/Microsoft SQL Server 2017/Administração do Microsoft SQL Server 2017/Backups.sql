-- Backups

--	* Processo de BACKUP consiste em fazer cópias de base de dados ou de log de transações para posterior recuperação
--	* BACKUPs podem ser usados também para migrar bancos de um ambiente para outro
--	* Existem 3 tipos de BACKUPs:
--		- Full
--		- Diferencial
--		- Transact

-- Full Backup
-- * Consiste em um backup completo
-- * Tanto dados quanto log de transações serão salvos neste backup
-- Se colocado o comando NOINIT, ele irá acrescentar uma nova parte ao log original, caso contrário um novo backup será criado
-- BACKUP DATABASE <DB NAME> TO DISK = '<FILE DIRECTORY AND NAME>'

-- Transact Backup
-- * Um backup de transações representa o armazenamento apenas das modificações dos dados
-- O processo de backcup faz parte de uma política de manutenção de dados definida pela empresa
-- BACKUP LOG <DB NAME> TO DISK = '<FILE DIRECTORY AND NAME>'


-- Diferencial backuo
-- * O SQL SERVER tem uma estrutura interna chamada Diferencial Map. Esta estrutura mapeia toda a mudança efetuada no banco desde o último backup
-- * O backup diferencial utiliza esta estrutura interna para fazer um backup ful apenas das diferenças.
-- ele substitiu uma política de backup que tenha que gerar centenas de logs de transação
-- * Acaba sendo mais rápido e eficiente.
-- BACKUO DATABASE <DB NAME> TO = '<FILE DIRECTORY AND NAME>' WITH DIFFERENTIAL

-- Politicas de Backup
-- Por exemplo:
	-- No início da semana efetuamos um backup full
	-- A cada hor afazemos um backup log
	-- No final do dia fazemos um backup differential
	-- No início da semana seguinte o ciclo se encerra e voltamos a um backup full


