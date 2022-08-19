-- Tipos de dados de data e hora

-- Time --> hh:mm:ss[.nnnnnnn]
-- Date --> AAAA-MM-DD
-- Smalldatetime --> AAAA-MM-DD hh:mm:ss
-- Datetime --> AAAA-MM-DD hh:mm:ss[.nnn]
-- Datetime2 --> AAAA-MM-DD hh:mm:ss[.nnnnnnn]
-- Datetimeoffset --> AAAA-MM-DD hh:mm [+|-] hh:mm

-- Fun��es
-- SYSDATETIME() --> Retorna um datetime2 (7) valor que cont�m a data e hora do computador no qual a inst�ncia est� em execu��o
-- SYSDATETIMEOFFSET() --> Retorna um datetime2 (7) valor que cont�m a data e hora do computador no qual a inst�ncia est� em execu��o considerando o fuso hor�rio
-- SYSUTCDATETIME() --> Retorna um datetime2 (7) valor que cont�m a data e hora do computador no qual a inst�ncia est� em execu��o, data e hora retornada como UTC
-- CURRENT_TIMESTAMP() --> Retorna um datetime valor que cont�m a data e hora do computador no qual a inst�ncia est� em execu��o
-- GETDATE() --> Retorna um datetime valor que cont�m a data e hora do computador no qual a inst�ncia est� em execu��o
-- GETUTCDATE() --> Retorna um datetime valor que cont�m a data e hora do computador no qual a inst�ncia est� em eecu��o, considerando o fuso hor�rio

-- Fun��es
-- DATENAME --> Retorna uma cadeia de caracteres que representaa datepart da data especificada
			--> DATENAME(datepart, data)

-- DATEPART --> Retorna um inteiro que representa a datepart especificada data
			--> DATEPART(datepart, data)

-- DAY  --> Retorna um inteiro que representa a parte do dia especificada data
		--> DAY(data)

-- MONTH  --> Retorna um inteiro que representa a parte do m�s especificada data
		  --> MONTH(data)

-- YEAR  --> Retorna um inteiro que representa a parte do ano especificada data
		  --> YEAR(data)

-- DATEFROMPARTS --> Retorna um data valor para o ano especificado, m�s e dia
				 --> DATEFROMPARTS(year, month, day)

-- DATETIME2FROMPARTS --> Retorna um datetime2 valor para a data e hora especificadas e com a precis�o especificada
					  --> DATETIME2FROMPARTS(year, month, day, hour, minute, seconds, fractions, precision)

-- DATETIMEFROMPARTS --> Retorna um datetime valor para a data e hora especificadas
					 --> DATETIMEFROMPARTS(year, month, day, hour, minute, seconds, milli)

-- DATETIMEOFFSETFROMPARTS --> Retorna um datetime valor para a data e hora especificadas e com os deslocamentos e precis�o especificados
					 --> DATETIMEOFFSETFROMPARTS(year, month, day, hour, minute, seconds, fractions, hour_offset, minute_offset, precision)

-- SMALDATETIMEFROMPARTS --> Retorna um smalldatetime valor para a data e hora especificadas
						 --> SMALLDATETIMEFROMPARTS(year, month, day, hour, minute)

-- TIMEFROMPARTS  --> Retorna um tempo valor para o tempo especificadocom a precis�o especificada
				  --> TIMEFROMPARTS(hour, minute, seconds, fractions, precision)

-- DATEDIFF  --> Retorna o n�mero de data ou hora datepart limites que s�o cruzados entre duas datas especificadas
			 --> DATEDIFF(datepart, startdate, enddate)

-- DATEDIFF_BIG  --> Retorna o n�mero de data ou hora datepart limites que s�ao cruzados entre duas datas
				--> DATEDIFF_BIG (datepart, startdate, enddate)

-- DATEADD  --> Retorna um novo datetime valor adicinando um intervalo especificado dateprt especificada data
			--> DATEADD(datepart�,number, data)

-- EOMONTH  --> Retorna o �ltimo dia do m�s que cont�m a data especificada com um deslocamento opcional
			--> EOMONT(startdate, [month_to_add])

-- SWITCHOFFSET  --> Op��o deslocamento altera o deslocamento de fuso hor�rio do valor DATETIMEOFFSET e preserva o valor UTC
				 --> SWITCHOFFSET(datetimeoffset, fuso_hor�rio)

-- TODATETIMEOFFSET  --> TODATETIMEOFFSET transforma um valor datetime2 em um valor datetimeoffset. O valor datetime2 � interpretado em hora local para time_zone especificado
					 --> TODATETIMEOFFSET(express�o, fuso_horario)

-- ISDATE  --> Determina se um datetime ou smalldatetime express�o de entrada � uma data v�lida ou um valor de tempo
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
