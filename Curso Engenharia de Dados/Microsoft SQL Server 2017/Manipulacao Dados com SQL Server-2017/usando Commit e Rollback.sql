-- COMMIT E ROLLBACK
-- Transação no SQL Server: Uma unidade lógica de processamento que visa preservar
-- a integridade e consistência dos dados

-- Sintaxe Básica:
-- BEGIN TRANSACTION
-- COMMIT ou ROLLBACK

--BEGIN TRANSACTION: Cria um ponto de estado do banco de dados
-- COMMIT: Confirmo todas as operações entre o BEGIN TRANSACTION e o comando COMMIT. 
--		   Todos os INSERTS, UPDATES ou DELETES irão ser confirmados e gravados na base.

-- ROLLBACK: Tudo que foi feito entre o BEGIN TRANSACTION e o ROLLBACK será desprezado
--		     e os dados voltarão ao status de quando o BEGIN TRANSACTION foi executado.


SELECT
	*
FROM
	VENDEDORES

-- Colocamos o ponto de restauração aqui.
BEGIN TRANSACTION

-- Fiz a alteração aqui
UPDATE
	VENDEDORES
SET
	COMISSAO = COMISSAO * 1.15

-- Verificamos que o valor de comissão aumentou em 15%
SELECT
	*
FROM
	VENDEDORES

-- Inserindo um novo Vendedor
INSERT INTO	
	VENDEDORES
(MATRICULA, NOME, BAIRRO, COMISSAO, [DATA ADMISSAO], FERIAS)
VALUES
('99999', 'João da Silva', 'Icarai', 0.08, '2014-09-01', 0)

-- Visualizando esse vendedor
SELECT
	*
FROM
	VENDEDORES

-- Voltando para o estado do banco de dados quando eu executei o BEGIN TRANSACTION
ROLLBACK -- Aqui poderiamos colocar o COMMIT para salvar os dados no banco de dados

-- Visualizando o estado inicial
SELECT
	*
FROM
	VENDEDORES