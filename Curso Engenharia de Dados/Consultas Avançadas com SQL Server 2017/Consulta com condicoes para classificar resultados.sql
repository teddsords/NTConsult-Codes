-- Usando condições para classificar resultados

-- CASE: fazemos um teste em um ou mais campos e dependendo do resultado, teremos um outro valor

-- Por exemplo: 

-- SELECT X,
-- CASE
--	WHEN Y >= 8 AND Y <= 10 THEN 'OTIMO'
--	WHEN Y >= 7 AND Y < 8 THEN 'BOM'
--	WHEN Y >= 5 AND Y < 7 THEN 'MEDIO'
--	ELSE 'RUIM'
-- END
-- FROM TABELA

-- Mostrando todos os registros da tabela
SELECT * FROM [TABELA DE PRODUTOS]

-- Selecionando o nome do produto e categorizando como produto caro, em conta ou barato
SELECT [NOME DO PRODUTO],
CASE
	WHEN [PREÇO DE LISTA] >= 12 THEN 'PRODUTO CARO'
	WHEN [PREÇO DE LISTA] >= 7 AND [PREÇO DE LISTA] < 12 THEN 'PRODUTO EM CONTA'
	ELSE 'PRODUTO BARATO' 
END
FROM [TABELA DE PRODUTOS]


-- Quando usamos o group by devemos colocar a mesma função que foi colocada no SELECT CASEf 
SELECT [NOME DO PRODUTO],
CASE
	WHEN [PREÇO DE LISTA] >= 12 THEN 'PRODUTO CARO'
	WHEN [PREÇO DE LISTA] >= 7 AND [PREÇO DE LISTA] < 12 THEN 'PRODUTO EM CONTA'
	ELSE 'PRODUTO BARATO' 
END,
AVG([PREÇO DE LISTA])
FROM [TABELA DE PRODUTOS] 
GROUP BY [NOME DO PRODUTO],
CASE
	WHEN [PREÇO DE LISTA] >= 12 THEN 'PRODUTO CARO'
	WHEN [PREÇO DE LISTA] >= 7 AND [PREÇO DE LISTA] < 12 THEN 'PRODUTO EM CONTA'
	ELSE 'PRODUTO BARATO' 
END


-- O comentario anterior também vale para o SELECT com a função de YEAR()
SELECT YEAR(DATA), COUNT(*) FROM [NOTAS FISCAIS] GROUP BY YEAR(DATA)

-- Veja o ano de nascimento dos clientes e classifique-os como: 
-- nascidos antes de 1990 são adultos, nascidos entre 1990 e 1995 são jovens 
-- e nascidos depois de 1995 são crianças. Liste o nome do cliente e esta classificação.

SELECT NOME,
CASE
	WHEN YEAR([DATA DE NASCIMENTO]) <= 1990 THEN 'ADULTO'
	WHEN YEAR([DATA DE NASCIMENTO]) > 1990 AND YEAR([DATA DE NASCIMENTO]) <= 1995 THEN 'JOVEM'
	ELSE 'CRIANÇA' 
END AS CLASSIFICACAO
FROM [TABELA DE CLIENTES]