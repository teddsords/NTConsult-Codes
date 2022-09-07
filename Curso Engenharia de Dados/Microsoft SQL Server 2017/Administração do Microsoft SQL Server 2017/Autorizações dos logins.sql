-- Autorizações

-- Existem nove funções de servidor fixar predefinidas em cada servidor,
-- que voces pode usar como ponto de partida para proteger o ambiente do SQL Server

-- * sysadmin: Membros dessa função podem executar qualquer atividade no servidor
-- * bulkadmin: Membros podem executar BULK INSERT e usar a ferramenta bcp.exe
-- * diskadmin: Mebros podem gerenciar arquivos de disco
-- * processadmin: Membros podem MATAR processos em exeução no SQL Server
-- * public: Cada login é um membro da função pública. Se um objeto não recebe uma configuração específica ele será público
-- * securityadmin: Membros podem gerenciar logins e suas propriedades
-- * serveradmin: Podem alterar a configuração no nível do servidor e encerrar o SQL Server
-- * setupadmin: Membros podem criar servidores vinculados com comandos TSQL
-- * dbcreator: Pode gerenciar banco de dados

-- É possível alterar as configurações do usuário utilizando o comando
-- ALTER SERVER, este comando poe adicionar usuários às regreas pré-definidas

-- ALTER SERVER ROLE [sysadmin] ADD MEMBER [Marek]
-- ALTER SERVER ROLE [sysadmin] ADD MEMBER [DOMAIN\Marek]
-- ALTER SERVER ROLE [sysadmin] DROP MEMBER [Marek]


-- Permitindo que o Pedro possa criar dbs
ALTER SERVER ROLE [dbcreator] ADD MEMBER [pedro]

-- Criando um db com o usuário pedro
CREATE DATABASE newbd2

-- Tirando a permissão do Pedro para criar dbs
ALTER SERVER ROLE [dbcreator] DROP MEMBER [pedro]

-- Tentando criar um db com o usuário pedro, mas será bloqueado porque ele não tem permissão
CREATE DATABASE newbd3
