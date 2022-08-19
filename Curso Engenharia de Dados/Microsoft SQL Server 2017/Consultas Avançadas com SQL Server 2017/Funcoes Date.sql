-- Tipos de dados de data e hora

-- Time --> hh:mm:ss[.nnnnnnn]
-- Date --> AAAA-MM-DD
-- Smalldatetime --> AAAA-MM-DD hh:mm:ss
-- Datetime --> AAAA-MM-DD hh:mm:ss[.nnn]
-- Datetime2 --> AAAA-MM-DD hh:mm:ss[.nnnnnnn]
-- Datetimeoffset --> AAAA-MM-DD hh:mm [+|-] hh:mm

-- Funções
-- SYSDATETIME() --> Retorna um datetime2 (7) valor que contém a data e hora do computador no qual a instância está em execução
-- SYSDATETIMEOFFSET() --> Retorna um datetime2 (7) valor que contém a data e hora do computador no qual a instância está em execução considerando o fuso horário
-- SYSUTCDATETIME() --> Retorna um datetime2 (7) valor que contém a data e hora do computador no qual a instância está em execução, data e hora retornada como UTC
-- CURRENT_TIMESTAMP() --> Retorna um datetime valor que contém a data e hora do computador no qual a instância está em execução
-- GETDATE() --> Retorna um datetime valor que contém a data e hora do computador no qual a instância está em execução
-- GETUTCDATE() --> Retorna um datetime valor que contém a data e hora do computador no qual a instância está em eecução, considerando o fuso horário

-- Funções
-- DATENAME --> Retorna uma cadeia de caracteres que representaa datepart da data especificada
			--> DATENAME(datepart, data)

-- DATEPART --> Retorna um inteiro que representa a datepart especificada data
			--> DATEPART(datepart, data)

-- DAY  --> Retorna um inteiro que representa a parte do dia especificada data
		--> DAY(data)

-- MONTH  --> Retorna um inteiro que representa a parte do mês especificada data
		  --> MONTH(data)

-- YEAR  --> Retorna um inteiro que representa a parte do ano especificada data
		  --> YEAR(data)

-- DATEFROMPARTS --> Retorna um data valor para o ano especificado, mês e dia
				 --> DATEFROMPARTS(year, month, day)

-- DATETIME2FROMPARTS --> Retorna um datetime2 valor para a data e hora especificadas e com a precisão especificada
					  --> DATETIME2FROMPARTS(year, month, day, hour, minute, seconds, fractions, precision)

-- DATETIMEFROMPARTS --> Retorna um datetime valor para a data e hora especificadas
					 --> DATETIMEFROMPARTS(year, month, day, hour, minute, seconds, milli)

-- DATETIMEOFFSETFROMPARTS --> Retorna um datetime valor para a data e hora especificadas e com os deslocamentos e precisão especificados
					 --> DATETIMEOFFSETFROMPARTS(year, month, day, hour, minute, seconds, fractions, hour_offset, minute_offset, precision)

-- SMALDATETIMEFROMPARTS --> Retorna um smalldatetime valor para a data e hora especificadas
						 --> SMALLDATETIMEFROMPARTS(year, month, day, hour, minute)

-- TIMEFROMPARTS  --> Retorna um tempo valor para o tempo especificadocom a precisão especificada
				  --> TIMEFROMPARTS(hour, minute, seconds, fractions, precision)

-- DATEDIFF  --> Retorna o número de data ou hora datepart limites que são cruzados entre duas datas especificadas
			 --> DATEDIFF(datepart, startdate, enddate)

-- DATEDIFF_BIG  --> Retorna o número de data ou hora datepart limites que sçao cruzados entre duas datas
				--> DATEDIFF_BIG (datepart, startdate, enddate)

-- DATEADD  --> Retorna um novo datetime valor adicinando um intervalo especificado dateprt especificada data
			--> DATEADD(datepart´,number, data)

-- EOMONTH  --> Retorna o último dia do mês que contém a data especificada com um deslocamento opcional
			--> EOMONT(startdate, [month_to_add])

-- SWITCHOFFSET  --> Opção deslocamento altera o deslocamento de fuso horário do valor DATETIMEOFFSET e preserva o valor UTC
				 --> SWITCHOFFSET(datetimeoffset, fuso_horário)

-- TODATETIMEOFFSET  --> TODATETIMEOFFSET transforma um valor datetime2 em um valor datetimeoffset. O valor datetime2 é interpretado em hora local para time_zone especificado
					 --> TODATETIMEOFFSET(expressão, fuso_horario)

-- ISDATE  --> Determina se um datetime ou smalldatetime expressão de entrada é uma data válida ou um valor de tempo
		   --> ISDATE(expression)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT SYSDATETIME()

SELECT SYSDATETIMEOFFSET()

SELECT SYSUTCDATETIME()

SELECT CURRENT_TIMESTAMP

SELECT GETDATE()

SELECT GETUTCDATE()

SELECT DATENAME(YEAR, GETDATE())

SELECT DATENAME(MICROSECOND, GETDATE())

SELECT DATENAME(DAY, GETDATE())

SELECT DATENAME(MONTH, GETDATE())

SELECT DATENAME(MONTH, DATEFROMPARTS(2015,9,1))

SELECT DATEFROMPARTS(2022, 9, 1)

SELECT DATETIME2FROMPARTS(2019,9,1,13,12,11,120,4)

SELECT DATEDIFF(MONTH, DATEFROMPARTS(2018,9,1), GETDATE())

SELECT DATEADD(MONTH, 5, GETDATE())

SELECT ISDATE('2018-01-01')

SELECT ISDATE('2018-25-28')

SELECT * FROM [NOTAS FISCAIS]

SELECT DATA, CONCAT(DATENAME(DAY, [DATA]), ' ', DATENAME(MONTH, [DATA]), ' ', DATENAME(YEAR, [DATA]))
FROM [NOTAS FISCAIS]

-- Crie uma consulta que mostre o nome e a idade dos clientes
SELECT
	NOME,
	DATEDIFF(YEAR, [DATA DE NASCIMENTO], SYSDATETIME()) AS IDADE
FROM
	[TABELA DE CLIENTES]
