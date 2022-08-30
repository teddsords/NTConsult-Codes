-- SP do sistema

-- Executando SPs do sistema
EXEC sp_columns @table_name = 'TABELA DE CLIENTES', @table_owner = 'dbo'

EXEC sp_tables @table_name = 'TAB%', @table_owner = 'dbo', @table_qualifier = 'SUCOS_VENDAS'


-- Criando SP
CREATE PROCEDURE BuscaNotasCliente
	@CPF AS VARCHAR(12),
	@DATA_INICIAL AS DATE = '20160101',		-- Colocando o valor default, se nao recebe na chamada da função
	@DATA_FINAL AS DATE = '20161231'		-- esse é o valor a ser utilizado
AS
BEGIN
	SELECT
		*
	FROM
		[NOTAS FISCAIS]
	WHERE
		CPF = @CPF
	AND
		DATA >= @DATA_INICIAL
		AND
		DATA <= @DATA_FINAL
END

-- A ordem dos parametros nao importa!
EXEC BuscaNotasCliente @CPF = '19290992743'		-- Sem passar as Datas para utilizar as default que foram definidas no SP
EXEC BuscaNotasCliente @CPF = '19290992743', @DATA_INICIAL = '20161201'	-- Ele utilizara esta data como data inicial e a final a default
EXEC BuscaNotasCliente @CPF = '19290992743', @DATA_FINAL = '20160131'	-- Ele utilizara esta data como data final e a inicial a default

-- Podemos chamar assim e o SQL entendera que esse valor é o CPF
EXEC BuscaNotasCliente '19290992743'

-- Se queremos pasar o CPF e a data final sem especificar podemos fazer o seguinte,
-- utilizando a palavra DEFAULT ele entende que o default tem que ser utilizado
EXEC BuscaNotasCliente '19290992743', DEFAULT, '20160131'
