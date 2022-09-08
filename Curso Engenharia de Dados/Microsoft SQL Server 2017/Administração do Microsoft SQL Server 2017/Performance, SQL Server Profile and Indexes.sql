-- Performance
-- Pontos importantes sobre performance
	-- Quntidadede solicita��es
	-- Espa�o afetado pela solicita��o
	-- Tipos de solicita��o
	-- Dificuldade da solicita��o

-- Para avaliar a performance precisamos definir uma linha base
	-- A linha base descreve como se comporta o servidor normalmente
-- Os desenvolvedores s�o parceiros neste processo

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SQL Server Profile
-- Ferrmenta para executar rastreamentos (Traces) nos processos de SQL Server
-- Possui v�rios modelos pr�-definidos
-- Podemos efetuar o trace atrav�s de um script T-SQL

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- �ndices
-- Umaesp�cie de "m�gica" que pode resolver a maioria dos problemas de performance
-- Os �ndices ajudam a para ajudar o SQL Server a buscar um determinado resgistro de forma efici�nte
-- O tipo de �ndice mais usado � o chamado B-Tree

-- HEAP:
	-- Chamamos de HEAP uma tabela sem �ndices. Chaves prim�rias e estrangeiras autmaticamente criam �ndices
		-- associados a elas. Logo tabelas que possuem chaves prim�rias e estrangeiras n�o s�o Heaps.
	-- Durante a consulta o SQL Server vai precisar varrer toda a tabela para achar algu�m.
	-- Quando o SQL Server est� inserindo um novo rergisto em HEA�, ele localiza a primeira p�gina de dados com espa�o suficiente para o novo registro
	-- Quando atualiza diversos registros ele busca o espa�o melhor para armazen�-los dentro da tabela
	-- Quando apagamos o registro, um registro fantasma � criado causando uma fragmenta��o nos dados

-- B-tree:
	-- Podemos adicionar essa �rvore para facilitar a busca e n�o precisar de fazer um full-scan em toda a tabela
	-- Podemos ordenar os nomes de uma agenda por ordem alfab�tica em um espelho da p�gina de mem�ria
		-- e acrescentar �ndices. Com isso teriamos uma B-TREE Clustered Index
	-- Outro caso seria espelhar e ordenar por ordem alfabetica o crit�rio de busca, obtendo assim os ponteiros
		-- para qual p�gina de memoria se encontra o registro. Isso � chamado de B-TREE NonClustered Index

	-- Por DEFAULT uma PK ser� um B-TREE Clustered Index
	-- Por DEFAULT uma Constraint ser�ra uma B-TREE NonClustered Index
	-- O B � chamado de "Balance" Tree porque o �ndice sempre tenta balancear os lados da �rvore
	
	-- Para criar um NonClustered Index usamos o seguinte comando:
		-- CREATE NONCLUSTERED INDEX <INDEX NAME> ON <TABLE'S NAME> (COLUMN USED)
