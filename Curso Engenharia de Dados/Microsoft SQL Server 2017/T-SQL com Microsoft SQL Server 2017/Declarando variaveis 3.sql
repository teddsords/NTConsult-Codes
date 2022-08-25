-- Crie 4 variaveis com ass caracteristicas abaixo:

-- Nome: Cliente. Tipo: Caracteres com 10 posições. Valor: João
-- Nome: Idade. Tipo: Inteiro. Valor: 10
-- Nome: DataNascimento. Tipo: Data. Valor: 10/01/2007
-- Nome: Custo. Tipo: Número com casas decimais. Valor: 10,23
-- Construa um script que declare estas variáveis, atribua valores a elas e exiba-as na saída do SQL Server Management Studio.

DECLARE @CLIENTE VARCHAR(10),
		@IDADE INT,
		@DATANASCIMENTO DATE,
		@CUSTO FLOAT

SET @CLIENTE = 'Joao'
SET @IDADE = 10
SET @DATANASCIMENTO = '20070110'
SET @CUSTO = 10.23

PRINT @CLIENTE
PRINT @IDADE
PRINT @DATANASCIMENTO
PRINT @CUSTO

-- Crie uma variável chamada NUMNOTAS e atribua a ela o número de notas fiscais do dia 01/01/2017. 
-- Mostre na saída do script o valor da variável.
DECLARE @NUMNOTAS INT

SELECT 
	@NUMNOTAS = COUNT(*)
FROM
	[NOTAS FISCAIS]
WHERE
	DATA = '20170101'

PRINT @NUMNOTAS