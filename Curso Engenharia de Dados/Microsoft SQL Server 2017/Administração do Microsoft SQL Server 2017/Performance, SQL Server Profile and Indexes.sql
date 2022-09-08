-- Performance
-- Pontos importantes sobre performance
	-- Quntidadede solicitações
	-- Espaço afetado pela solicitação
	-- Tipos de solicitação
	-- Dificuldade da solicitação

-- Para avaliar a performance precisamos definir uma linha base
	-- A linha base descreve como se comporta o servidor normalmente
-- Os desenvolvedores são parceiros neste processo

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SQL Server Profile
-- Ferrmenta para executar rastreamentos (Traces) nos processos de SQL Server
-- Possui vários modelos pré-definidos
-- Podemos efetuar o trace através de um script T-SQL

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Índices
-- Umaespécie de "mágica" que pode resolver a maioria dos problemas de performance
-- Os índices ajudam a para ajudar o SQL Server a buscar um determinado resgistro de forma eficiênte
-- O tipo de índice mais usado é o chamado B-Tree

-- HEAP:
	-- Chamamos de HEAP uma tabela sem índices. Chaves primárias e estrangeiras autmaticamente criam índices
		-- associados a elas. Logo tabelas que possuem chaves primárias e estrangeiras não são Heaps.
	-- Durante a consulta o SQL Server vai precisar varrer toda a tabela para achar alguém.
	-- Quando o SQL Server está inserindo um novo rergisto em HEA´, ele localiza a primeira página de dados com espaço suficiente para o novo registro
	-- Quando atualiza diversos registros ele busca o espaço melhor para armazená-los dentro da tabela
	-- Quando apagamos o registro, um registro fantasma é criado causando uma fragmentação nos dados

-- B-tree:
	-- Podemos adicionar essa árvore para facilitar a busca e não precisar de fazer um full-scan em toda a tabela
	-- Podemos ordenar os nomes de uma agenda por ordem alfabética em um espelho da página de memória
		-- e acrescentar índices. Com isso teriamos uma B-TREE Clustered Index
	-- Outro caso seria espelhar e ordenar por ordem alfabetica o critério de busca, obtendo assim os ponteiros
		-- para qual página de memoria se encontra o registro. Isso é chamado de B-TREE NonClustered Index

	-- Por DEFAULT uma PK será um B-TREE Clustered Index
	-- Por DEFAULT uma Constraint ser´ra uma B-TREE NonClustered Index
	-- O B é chamado de "Balance" Tree porque o índice sempre tenta balancear os lados da árvore
	
	-- Para criar um NonClustered Index usamos o seguinte comando:
		-- CREATE NONCLUSTERED INDEX <INDEX NAME> ON <TABLE'S NAME> (COLUMN USED)
