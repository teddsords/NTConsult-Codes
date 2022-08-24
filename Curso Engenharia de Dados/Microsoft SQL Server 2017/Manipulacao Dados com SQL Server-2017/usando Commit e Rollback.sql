-- COMMIT E ROLLBACK
-- Transa��o no SQL Server: Uma unidade l�gica de processamento que visa preservar
-- a integridade e consist�ncia dos dados

-- Sintaxe B�sica:
-- BEGIN TRANSACTION
-- COMMIT ou ROLLBACK

--BEGIN TRANSACTION: Cria um ponto de estado do banco de dados
-- COMMIT: Confirmo todas as opera��es entre o BEGIN TRANSACTION e o comando COMMIT. 
--		   Todos os INSERTS, UPDATES ou DELETES ir�o ser confirmados e gravados na base.

-- ROLLBACK: Tudo que foi feito entre o BEGIN TRANSACTION e o ROLLBACK ser� desprezado
--		     e os dados voltar�o ao status de quando o BEGIN TRANSACTION foi executado.


SELECT
	*
FROM
	VENDEDORES

-- Colocamos o ponto de restaura��o aqui.
BEGIN TRANSACTION

-- Fiz a altera��o aqui
UPDATE
	VENDEDORES
SET
	COMISSAO = COMISSAO * 1.15

-- Verificamos que o valor de comiss�o aumentou em 15%
SELECT
	*
FROM
	VENDEDORES

-- Inserindo um novo Vendedor
INSERT INTO	
	VENDEDORES
(MATRICULA, NOME, BAIRRO, COMISSAO, [DATA ADMISSAO], FERIAS)
VALUES
('99999', 'Jo�o da Silva', 'Icarai', 0.08, '2014-09-01', 0)

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