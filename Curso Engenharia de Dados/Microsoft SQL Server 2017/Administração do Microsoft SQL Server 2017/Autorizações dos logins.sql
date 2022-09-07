-- Autoriza��es

-- Existem nove fun��es de servidor fixar predefinidas em cada servidor,
-- que voces pode usar como ponto de partida para proteger o ambiente do SQL Server

-- * sysadmin: Membros dessa fun��o podem executar qualquer atividade no servidor
-- * bulkadmin: Membros podem executar BULK INSERT e usar a ferramenta bcp.exe
-- * diskadmin: Mebros podem gerenciar arquivos de disco
-- * processadmin: Membros podem MATAR processos em exeu��o no SQL Server
-- * public: Cada login � um membro da fun��o p�blica. Se um objeto n�o recebe uma configura��o espec�fica ele ser� p�blico
-- * securityadmin: Membros podem gerenciar logins e suas propriedades
-- * serveradmin: Podem alterar a configura��o no n�vel do servidor e encerrar o SQL Server
-- * setupadmin: Membros podem criar servidores vinculados com comandos TSQL
-- * dbcreator: Pode gerenciar banco de dados

-- � poss�vel alterar as configura��es do usu�rio utilizando o comando
-- ALTER SERVER, este comando poe adicionar usu�rios �s regreas pr�-definidas

-- ALTER SERVER ROLE [sysadmin] ADD MEMBER [Marek]
-- ALTER SERVER ROLE [sysadmin] ADD MEMBER [DOMAIN\Marek]
-- ALTER SERVER ROLE [sysadmin] DROP MEMBER [Marek]


-- Permitindo que o Pedro possa criar dbs
ALTER SERVER ROLE [dbcreator] ADD MEMBER [pedro]

-- Criando um db com o usu�rio pedro
CREATE DATABASE newbd2

-- Tirando a permiss�o do Pedro para criar dbs
ALTER SERVER ROLE [dbcreator] DROP MEMBER [pedro]

-- Tentando criar um db com o usu�rio pedro, mas ser� bloqueado porque ele n�o tem permiss�o
CREATE DATABASE newbd3
