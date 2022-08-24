-- Atualizando registros de tabelas

--UPDATE <TABLE'S NAME> SET <COLUMN NAME> = <VALUE> WHERE <CONDITION>

SELECT * FROM PRODUTOS

-- Alterando somente o preco
UPDATE 
	PRODUTOS
SET
	[PRECO LISTA] = 5
WHERE 
	CODIGO = 1040107

-- Alterando mis de uma coluna num unico comando
UPDATE 
	PRODUTOS
SET
	SABOR = 'Laranja',
	EMBALAGEM = 'PET'
WHERE 
	CODIGO = 1040107

-- Alterando em lote
SELECT * FROM PRODUTOS WHERE SABOR = 'Maracuj�'

UPDATE 
	PRODUTOS
SET
	[PRECO LISTA] = [PRECO LISTA] * 1.10
WHERE 
	SABOR = 'Maracuj�'

SELECT * FROM PRODUTOS WHERE SABOR = 'Maracuj�'



-- Modifique o endere�o do cliente 19290992743 para R. Jorge Emilio 23, em Santo Amaro, S�o Paulo, SP, CEP 8833223.
SELECT
	*
FROM 
	CLIENTES
WHERE
	CPF = '19290992743'

UPDATE
	CLIENTES
SET 
	ENDERECO = 'R. Jorge Emilio, 23',
	BAIRRO = 'Santo Amaro',
	CIDADE = 'S�o Paulo',
	ESTADO = 'SP',
	CEP = '8833223'
WHERE
	CPF = '19290992743'

-- Para verificar se houve mudanca
SELECT
	*
FROM 
	CLIENTES
WHERE
	CPF = '19290992743'


-- Altere o volume de compra em 20% dos clientes do estado do Rio de Janeiro.
SELECT
	*
FROM 
	CLIENTES
WHERE
	ESTADO = 'RJ'

UPDATE 
	CLIENTES
SET
	[VOLUME COMPRA] = [VOLUME COMPRA] * 1.20
WHERE
	ESTADO = 'RJ'

SELECT
	*
FROM 
	CLIENTES
WHERE
	ESTADO = 'RJ'