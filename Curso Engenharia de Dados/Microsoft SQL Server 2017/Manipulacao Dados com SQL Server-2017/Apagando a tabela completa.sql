USE [VENDAS SUCOS]
GO

/****** Object:  Table [dbo].[PRODUTOS]    Script Date: 8/24/2022 3:15:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Criando uma copia da tabela de produtos para poder apagar todos os produtos logo em seguida
CREATE TABLE [dbo].[PRODUTOS_2](
	[CODIGO] [varchar](10) NOT NULL,
	[DESCRITOR] [varchar](100) NULL,
	[SABOR] [varchar](50) NULL,
	[TAMANHO] [varchar](50) NULL,
	[EMBALAGEM] [varchar](50) NULL,
	[PRECO LISTA] [float] NULL,
 CONSTRAINT [PK_PRODUTOS_2] PRIMARY KEY CLUSTERED 
(
	[CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Populando a copia da tabela com os produtos originais
INSERT INTO
	PRODUTOS_2
SELECT
	* 
FROM 
	PRODUTOS

-- Aumentando o preco dos produtos em 10%
UPDATE
	PRODUTOS_2
SET
	[PRECO LISTA] = [PRECO LISTA] * 1.1

DELETE FROM PRODUTOS_2