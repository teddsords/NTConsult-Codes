-- SP para calculos

-- Criando o SP para calcular a idade e atualizar a tabela
CREATE PROCEDURE CalculaIdade
AS
BEGIN
	UPDATE 
		[TABELA DE CLIENTES]
	SET
		IDADE = DATEDIFF(YEAR, [DATA DE NASCIMENTO], GETDATE())
END

-- Inserindo uma linha sem o valor da idade
INSERT INTO [TABELA DE CLIENTES]
	(CPF, NOME, [ENDERECO 1], BAIRRO, CIDADE, ESTADO, CEP, [DATA DE NASCIMENTO], SEXO, [LIMITE DE CREDITO], [VOLUME DE COMPRA], [PRIMEIRA COMPRA])
VALUES
	('123123123', 'JOAO MACHADO', 'RUA PROJETADA A', 'MADUREIRA', 'Rio de Janeiro', 'RJ', '20000', '20000306', 'M', 120000, 120000, 1)

-- Verificando a inserção realizada acima e vendo que o campo IDADE é NULL
SELECT
	*
FROM
	[TABELA DE CLIENTES]

-- Executando o SP para preencher o campo idade
EXEC CalculaIdade

-- Verificando após a atualização dos dados
SELECT
	*
FROM
	[TABELA DE CLIENTES]

-- Na nossa empresa de suco de frutas temos 3 categorias de produtos: Garrafas, Lata ou PET. Imagine que, pela legislação, o imposto pago depende do tipo de embalagem do produto e, 
-- a cada momento, ele muda. Temos o campo IMPOSTO na tabela de notas fiscais, que determina o imposto a ser pago (alíquota sobre o faturamento). 
-- Faça uma stored procedure que terá como entrada de dados: Mês, Ano, Alíquota, Tipo de Produto (Garrafas, Lata ou PET).
-- Ela irá modificar a alíquota para a alíquota informada na entrada da stored procedure, 
-- para as vendas de todas as notas fiscais no mês/ano informados, para todos os produtos do tipo informado.
-- Dica:
--	* Comece determinando a consulta que seleciona todas as notas fiscais dentro do mês/ano para um tipo de produto;
--	* Construa um comando UPDATE modificando o campo IMPOSTO de todas as notas, usando o mesmo WHERE da consulta inicial;
--	* Construa a stored procedure usando o UPDATE acima, determinando e passando os parâmetros contidos no enunciado. Nome da stored procedure: AtualizaImposto.

-- Pegando todos os dados para construir aos poucos a consulta, filtramos os dados referentes ao mês e o ano especificado
SELECT
	*
FROM
	[NOTAS FISCAIS]
WHERE
	YEAR(DATA) = '2015'
	AND
	MONTH(DATA) = '01'

-- Juntando a consulta anterior com os itens vendidos nessas notas
SELECT 
	*
FROM
	[NOTAS FISCAIS] NF
	INNER JOIN
	[ITENS NOTAS FISCAIS] INF
	ON NF.NUMERO = INF.NUMERO

-- Juntando essa consulta anterior com a tabela de produtos para saber o tipo de produto e acrescentando a condicao da data
SELECT
	NF.MATRICULA AS MATRICULA,
	NF.IMPOSTO AS IMPOSTO,
	INF.[CODIGO DO PRODUTO] AS CODIGO,
	TP.EMBALAGEM AS EMBALAGEM
FROM
	([NOTAS FISCAIS] NF
	INNER JOIN
	[ITENS NOTAS FISCAIS] INF
	ON NF.NUMERO = INF.NUMERO) 
	INNER JOIN
	[TABELA DE PRODUTOS] TP
	ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
WHERE
		YEAR(NF.DATA) = '2015'
	AND
		MONTH(NF.DATA) = '01'
	AND 
		TP.EMBALAGEM = 'Lata'


-- Construindo a SP
CREATE PROCEDURE AtualizaImposto 
	@MES AS VARCHAR(2), 
	@ANO AS VARCHAR(4),
	@ALIQUOTA AS FLOAT,
	@PRODUTO AS VARCHAR (8)
AS
BEGIN
	UPDATE
		NF
	SET 
		NF.IMPOSTO = @ALIQUOTA
	FROM 
	([NOTAS FISCAIS] NF
	INNER JOIN
	[ITENS NOTAS FISCAIS] INF
	ON NF.NUMERO = INF.NUMERO) 
	INNER JOIN
	[TABELA DE PRODUTOS]
	ON [TABELA DE PRODUTOS].[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
WHERE
	YEAR(NF.DATA) = @ANO
	AND
	MONTH(NF.DATA) = @MES
	AND [TABELA DE PRODUTOS].EMBALAGEM = @PRODUTO
END

-- Executando a SP
EXEC AtualizaImposto @MES = 2, @ANO = 2017, @PRODUTO = 'PET', @ALIQUOTA = 0.16

-- Verificando o funcionamento da SP
SELECT
	NF.MATRICULA AS MATRICULA,
	NF.IMPOSTO AS IMPOSTO,
	INF.[CODIGO DO PRODUTO] AS CODIGO,
	TP.EMBALAGEM AS EMBALAGEM
FROM
	([NOTAS FISCAIS] NF
	INNER JOIN
	[ITENS NOTAS FISCAIS] INF
	ON NF.NUMERO = INF.NUMERO) 
	INNER JOIN
	[TABELA DE PRODUTOS] TP
	ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
WHERE
		YEAR(NF.DATA) = '2017'
	AND
		MONTH(NF.DATA) = '02'
	AND 
		TP.EMBALAGEM = 'PET'
