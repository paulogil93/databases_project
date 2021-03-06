USE [p1g1]
GO
/****** Object:  User [p1g1]    Script Date: 11/06/2018 22:47:39 ******/
CREATE USER [p1g1] FOR LOGIN [p1g1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [test]    Script Date: 11/06/2018 22:47:40 ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [p1g1]
GO
/****** Object:  Schema [GYM]    Script Date: 11/06/2018 22:47:40 ******/
CREATE SCHEMA [GYM]
GO
/****** Object:  Table [GYM].[Alimento]    Script Date: 11/06/2018 22:47:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Alimento](
	[ID] [int] NOT NULL,
	[Nome] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Aula]    Script Date: 11/06/2018 22:47:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Aula](
	[Nome] [varchar](20) NOT NULL,
	[Descricao] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Cliente]    Script Date: 11/06/2018 22:47:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Cliente](
	[Nif] [int] NOT NULL,
	[Numero] [int] NOT NULL,
	[Inscricao] [date] NULL,
	[Pacote] [int] NOT NULL,
	[Numero_Horas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Cliente_Participa]    Script Date: 11/06/2018 22:47:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Cliente_Participa](
	[Nif] [int] NOT NULL,
	[Nome] [varchar](20) NOT NULL,
	[Data] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nif] ASC,
	[Nome] ASC,
	[Hora] ASC,
	[Data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Composicao_Dieta]    Script Date: 11/06/2018 22:47:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Composicao_Dieta](
	[Numero_Dieta] [int] NOT NULL,
	[ID_Alimento] [int] NOT NULL,
	[Percentagem] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero_Dieta] ASC,
	[ID_Alimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Composicao_Plano]    Script Date: 11/06/2018 22:47:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Composicao_Plano](
	[Numero_Plano] [int] NOT NULL,
	[ID_Treino] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero_Plano] ASC,
	[ID_Treino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Composicao_Treino]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Composicao_Treino](
	[ID_Treino] [int] NOT NULL,
	[Codigo_Exercicio] [int] NOT NULL,
	[Duracao] [int] NULL,
	[Descanso] [int] NULL,
	[Series] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Treino] ASC,
	[Codigo_Exercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Da_Aula]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Da_Aula](
	[Nif] [int] NOT NULL,
	[Nome] [varchar](20) NOT NULL,
	[Data] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nif] ASC,
	[Nome] ASC,
	[Hora] ASC,
	[Data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Dieta]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Dieta](
	[Numero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Exercicio]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Exercicio](
	[Codigo] [int] NOT NULL,
	[Descricao] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Funcionario]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Funcionario](
	[Nif] [int] NOT NULL,
	[Numero] [int] NOT NULL,
	[Ordenado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Instancia_Aula]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Instancia_Aula](
	[Nome] [varchar](20) NOT NULL,
	[Vagas] [int] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[Duracao] [int] NOT NULL,
	[Data] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nome] ASC,
	[Hora] ASC,
	[Data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Instancia_Dieta]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Instancia_Dieta](
	[Descricao] [text] NOT NULL,
	[Nif_Nutricionista] [int] NOT NULL,
	[Numero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC,
	[Nif_Nutricionista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Instrutor]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Instrutor](
	[Nif] [int] NOT NULL,
	[Qualificacao] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Login]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Login](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](15) NOT NULL,
	[userpass] [varchar](32) NOT NULL,
	[person_id] [int] NULL,
	[type] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Nutricionista]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Nutricionista](
	[Nif] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Pacote]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Pacote](
	[ID] [int] NOT NULL,
	[Descricao] [text] NULL,
	[Nome_pacote] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Pessoa]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Pessoa](
	[Nome] [varchar](40) NOT NULL,
	[Nascimento] [date] NULL,
	[Nif] [int] NOT NULL,
	[Morada] [varchar](40) NULL,
	[Nib] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Plano]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Plano](
	[Numero] [int] NOT NULL,
	[Nif_Instrutor] [int] NULL,
	[Nif_Cliente] [int] NULL,
	[Descricao] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Tem_Dieta]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Tem_Dieta](
	[Nif_Cliente] [int] NOT NULL,
	[Nif_Nutricionista] [int] NOT NULL,
	[Numero_Dieta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nif_Cliente] ASC,
	[Nif_Nutricionista] ASC,
	[Numero_Dieta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Treino]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Treino](
	[ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [GYM].[Treino_Pessoal]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GYM].[Treino_Pessoal](
	[Nif_Cliente] [int] NOT NULL,
	[Nif_Instrutor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nif_Cliente] ASC,
	[Nif_Instrutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [GYM].[GetClientInfo]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [GYM].[GetClientInfo] (@clientID INT)
RETURNS TABLE
AS
    RETURN
    (
        SELECT P.Nome, P.Nascimento, P.Morada, C.Numero, C.Inscricao, C.Pacote, C.Numero_Horas
        FROM [GYM].Pessoa AS P
        JOIN [GYM].Cliente AS C
        ON P.Nif=C.Nif
        WHERE P.Nif=@clientID
    );
GO
/****** Object:  UserDefinedFunction [GYM].[GetInstructorInfo]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [GYM].[GetInstructorInfo] (@trainerID INT)
RETURNS TABLE
AS
    RETURN
    (
        SELECT P.Nome, P.Nascimento, P.Morada, F.Numero, F.Ordenado, I.Qualificacao
        FROM [GYM].Pessoa AS P
        JOIN [GYM].Funcionario AS F
        ON P.Nif=F.Nif
        JOIN [GYM].Instrutor AS I
        ON P.Nif=I.Nif
        WHERE P.Nif=@trainerID
    );
GO
/****** Object:  UserDefinedFunction [GYM].[GetNutriInfo]    Script Date: 11/06/2018 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [GYM].[GetNutriInfo] (@nutriID INT)
RETURNS TABLE
AS
    RETURN
    (
        SELECT P.Nome, P.Nascimento, P.Morada, F.Numero, F.Ordenado
        FROM [GYM].Pessoa AS P
        JOIN [GYM].Funcionario AS F
        ON P.Nif=F.Nif
        WHERE P.Nif=@nutriID
    );
GO
INSERT [GYM].[Alimento] ([ID], [Nome]) VALUES (1, N'Batata Doce')
INSERT [GYM].[Alimento] ([ID], [Nome]) VALUES (2, N'Pescada')
INSERT [GYM].[Alimento] ([ID], [Nome]) VALUES (3, N'Peito de Frango')
INSERT [GYM].[Alimento] ([ID], [Nome]) VALUES (4, N'Couve')
INSERT [GYM].[Alimento] ([ID], [Nome]) VALUES (5, N'Broculo')
INSERT [GYM].[Aula] ([Nome], [Descricao]) VALUES (N'Crossfit', N'Noções de Crossfit ')
INSERT [GYM].[Aula] ([Nome], [Descricao]) VALUES (N'Funcional', N'Corpo Saudável')
INSERT [GYM].[Cliente] ([Nif], [Numero], [Inscricao], [Pacote], [Numero_Horas]) VALUES (548, 154, CAST(N'2018-06-09' AS Date), 40, 89)
INSERT [GYM].[Cliente] ([Nif], [Numero], [Inscricao], [Pacote], [Numero_Horas]) VALUES (101202303, 78459, CAST(N'2018-04-24' AS Date), 25, 5)
INSERT [GYM].[Cliente] ([Nif], [Numero], [Inscricao], [Pacote], [Numero_Horas]) VALUES (156242589, 2, CAST(N'2018-05-02' AS Date), 30, 10)
INSERT [GYM].[Cliente] ([Nif], [Numero], [Inscricao], [Pacote], [Numero_Horas]) VALUES (222222222, 22, CAST(N'2018-06-07' AS Date), 20, 20)
INSERT [GYM].[Cliente] ([Nif], [Numero], [Inscricao], [Pacote], [Numero_Horas]) VALUES (254601669, 1, CAST(N'2018-05-02' AS Date), 35, 25)
INSERT [GYM].[Cliente_Participa] ([Nif], [Nome], [Data], [Hora]) VALUES (156242589, N'Funcional', CAST(N'2018-05-20' AS Date), CAST(N'11:00:00' AS Time))
INSERT [GYM].[Cliente_Participa] ([Nif], [Nome], [Data], [Hora]) VALUES (222222222, N'Funcional', CAST(N'2018-05-20' AS Date), CAST(N'11:00:00' AS Time))
INSERT [GYM].[Cliente_Participa] ([Nif], [Nome], [Data], [Hora]) VALUES (254601669, N'Funcional', CAST(N'2018-05-20' AS Date), CAST(N'11:00:00' AS Time))
INSERT [GYM].[Composicao_Dieta] ([Numero_Dieta], [ID_Alimento], [Percentagem]) VALUES (1, 1, 30)
INSERT [GYM].[Composicao_Dieta] ([Numero_Dieta], [ID_Alimento], [Percentagem]) VALUES (1, 2, 10)
INSERT [GYM].[Composicao_Dieta] ([Numero_Dieta], [ID_Alimento], [Percentagem]) VALUES (1, 4, 10)
INSERT [GYM].[Composicao_Dieta] ([Numero_Dieta], [ID_Alimento], [Percentagem]) VALUES (1, 5, 40)
INSERT [GYM].[Composicao_Plano] ([Numero_Plano], [ID_Treino]) VALUES (1, 1)
INSERT [GYM].[Composicao_Plano] ([Numero_Plano], [ID_Treino]) VALUES (6198, 8079)
INSERT [GYM].[Composicao_Treino] ([ID_Treino], [Codigo_Exercicio], [Duracao], [Descanso], [Series]) VALUES (1, 1, 10, NULL, 3)
INSERT [GYM].[Composicao_Treino] ([ID_Treino], [Codigo_Exercicio], [Duracao], [Descanso], [Series]) VALUES (1, 2, 10, NULL, 3)
INSERT [GYM].[Composicao_Treino] ([ID_Treino], [Codigo_Exercicio], [Duracao], [Descanso], [Series]) VALUES (1, 3, 5, NULL, 3)
INSERT [GYM].[Composicao_Treino] ([ID_Treino], [Codigo_Exercicio], [Duracao], [Descanso], [Series]) VALUES (1, 4, 10, NULL, 3)
INSERT [GYM].[Composicao_Treino] ([ID_Treino], [Codigo_Exercicio], [Duracao], [Descanso], [Series]) VALUES (1, 5, 30, NULL, 3)
INSERT [GYM].[Composicao_Treino] ([ID_Treino], [Codigo_Exercicio], [Duracao], [Descanso], [Series]) VALUES (8079, 1, 10, NULL, 2)
INSERT [GYM].[Composicao_Treino] ([ID_Treino], [Codigo_Exercicio], [Duracao], [Descanso], [Series]) VALUES (8079, 2, 15, NULL, 3)
INSERT [GYM].[Composicao_Treino] ([ID_Treino], [Codigo_Exercicio], [Duracao], [Descanso], [Series]) VALUES (8079, 5, 15, NULL, 1)
INSERT [GYM].[Da_Aula] ([Nif], [Nome], [Data], [Hora]) VALUES (145987362, N'Crossfit', CAST(N'2018-06-30' AS Date), CAST(N'17:00:00' AS Time))
INSERT [GYM].[Da_Aula] ([Nif], [Nome], [Data], [Hora]) VALUES (236601779, N'Funcional', CAST(N'2018-05-20' AS Date), CAST(N'11:00:00' AS Time))
INSERT [GYM].[Dieta] ([Numero]) VALUES (1)
INSERT [GYM].[Exercicio] ([Codigo], [Descricao]) VALUES (1, N'SupinoInclinado')
INSERT [GYM].[Exercicio] ([Codigo], [Descricao]) VALUES (2, N'Remada')
INSERT [GYM].[Exercicio] ([Codigo], [Descricao]) VALUES (3, N'Puxada')
INSERT [GYM].[Exercicio] ([Codigo], [Descricao]) VALUES (4, N'Passadeira')
INSERT [GYM].[Exercicio] ([Codigo], [Descricao]) VALUES (5, N'Bicicleta')
INSERT [GYM].[Funcionario] ([Nif], [Numero], [Ordenado]) VALUES (102365789, 4587, 1000)
INSERT [GYM].[Funcionario] ([Nif], [Numero], [Ordenado]) VALUES (145987362, 5874, 1200)
INSERT [GYM].[Funcionario] ([Nif], [Numero], [Ordenado]) VALUES (148508858, 3, 1300)
INSERT [GYM].[Funcionario] ([Nif], [Numero], [Ordenado]) VALUES (200200200, 1825, 1500)
INSERT [GYM].[Funcionario] ([Nif], [Numero], [Ordenado]) VALUES (214556788, 23, 1300)
INSERT [GYM].[Funcionario] ([Nif], [Numero], [Ordenado]) VALUES (236601779, 1, 900)
INSERT [GYM].[Funcionario] ([Nif], [Numero], [Ordenado]) VALUES (569608979, 2, 1000)
INSERT [GYM].[Instancia_Aula] ([Nome], [Vagas], [Hora], [Duracao], [Data]) VALUES (N'Crossfit', 10, CAST(N'17:00:00' AS Time), 90, CAST(N'2018-06-30' AS Date))
INSERT [GYM].[Instancia_Aula] ([Nome], [Vagas], [Hora], [Duracao], [Data]) VALUES (N'Funcional', 20, CAST(N'11:00:00' AS Time), 60, CAST(N'2018-05-20' AS Date))
INSERT [GYM].[Instancia_Dieta] ([Descricao], [Nif_Nutricionista], [Numero]) VALUES (N'Volume muscular', 148508858, 1)
INSERT [GYM].[Instrutor] ([Nif], [Qualificacao]) VALUES (145987362, N'Desporto')
INSERT [GYM].[Instrutor] ([Nif], [Qualificacao]) VALUES (200200200, N'Crossfit')
INSERT [GYM].[Instrutor] ([Nif], [Qualificacao]) VALUES (214556788, N'CrossFit')
INSERT [GYM].[Instrutor] ([Nif], [Qualificacao]) VALUES (236601779, N'Educação Fisica')
INSERT [GYM].[Instrutor] ([Nif], [Qualificacao]) VALUES (569608979, N'Educação Fisica')
SET IDENTITY_INSERT [GYM].[Login] ON 

INSERT [GYM].[Login] ([ID], [username], [userpass], [person_id], [type]) VALUES (1, N'admin', N'21232f297a57a5a743894a0e4a801fc3', NULL, N'admin')
INSERT [GYM].[Login] ([ID], [username], [userpass], [person_id], [type]) VALUES (2, N'trainer', N'2c065aae9fcb37b49043a5a2012b3dbf', 145987362, N'trainer')
INSERT [GYM].[Login] ([ID], [username], [userpass], [person_id], [type]) VALUES (3, N'nutritionist', N'df18f02e51aab112110baac522ce4776', 102365789, N'nutricionist')
INSERT [GYM].[Login] ([ID], [username], [userpass], [person_id], [type]) VALUES (4, N'pedrodias', N'26afa3497042950ad17ec5fb29ad8565', 101202303, N'client')
SET IDENTITY_INSERT [GYM].[Login] OFF
INSERT [GYM].[Nutricionista] ([Nif]) VALUES (102365789)
INSERT [GYM].[Nutricionista] ([Nif]) VALUES (148508858)
INSERT [GYM].[Pacote] ([ID], [Descricao], [Nome_pacote]) VALUES (20, N'Pacote de 20 horas semanais com um custo de 20 euros por mês', N'20horas')
INSERT [GYM].[Pacote] ([ID], [Descricao], [Nome_pacote]) VALUES (25, N'Pacote de 25 horas semanais com um custo de 25 euros por mês', N'25horas')
INSERT [GYM].[Pacote] ([ID], [Descricao], [Nome_pacote]) VALUES (30, N'Pacote de 30 horas semanais com um custo de 30 euros por mês', N'30horas')
INSERT [GYM].[Pacote] ([ID], [Descricao], [Nome_pacote]) VALUES (35, N'Pacote de 35 horas semanais com um custo de 35 euros por mês', N'35horas')
INSERT [GYM].[Pacote] ([ID], [Descricao], [Nome_pacote]) VALUES (40, N'Pacote livre trânsito com um custo de 40 euros por mês', N'Livre')
INSERT [GYM].[Pessoa] ([Nome], [Nascimento], [Nif], [Morada], [Nib]) VALUES (N'Carlos Alberto', CAST(N'2018-06-17' AS Date), 548, N'Mangualde', NULL)
INSERT [GYM].[Pessoa] ([Nome], [Nascimento], [Nif], [Morada], [Nib]) VALUES (N'Pedro Jesus', CAST(N'1970-05-18' AS Date), 101202303, N'Mangualde, Viseu', NULL)
INSERT [GYM].[Pessoa] ([Nome], [Nascimento], [Nif], [Morada], [Nib]) VALUES (N'Américo Amorim', CAST(N'1968-12-10' AS Date), 102365789, N'Aveiro', NULL)
INSERT [GYM].[Pessoa] ([Nome], [Nascimento], [Nif], [Morada], [Nib]) VALUES (N'Afonso Couto', CAST(N'1993-10-01' AS Date), 145987362, N'Lousã, Lisboa', NULL)
INSERT [GYM].[Pessoa] ([Nome], [Nascimento], [Nif], [Morada], [Nib]) VALUES (N'Sergio Veloso', CAST(N'1992-01-11' AS Date), 148508858, N'Rua das Oliveiras', NULL)
INSERT [GYM].[Pessoa] ([Nome], [Nascimento], [Nif], [Morada], [Nib]) VALUES (N'José Pedro', CAST(N'1996-07-27' AS Date), 156242589, N'Rua da Almeira', NULL)
INSERT [GYM].[Pessoa] ([Nome], [Nascimento], [Nif], [Morada], [Nib]) VALUES (N'Afonso André', CAST(N'1990-08-21' AS Date), 200200200, N'Aveiro', NULL)
INSERT [GYM].[Pessoa] ([Nome], [Nascimento], [Nif], [Morada], [Nib]) VALUES (N'Filipe Sergio', CAST(N'2015-12-16' AS Date), 214556788, N'Rua do Melia', NULL)
INSERT [GYM].[Pessoa] ([Nome], [Nascimento], [Nif], [Morada], [Nib]) VALUES (N'Ricardo Ribeiro', CAST(N'2017-05-02' AS Date), 222222222, N'Rua do Pinhal', NULL)
INSERT [GYM].[Pessoa] ([Nome], [Nascimento], [Nif], [Morada], [Nib]) VALUES (N'Bruno Oliveira', CAST(N'1992-05-09' AS Date), 236601779, N'Rua do Porto', NULL)
INSERT [GYM].[Pessoa] ([Nome], [Nascimento], [Nif], [Morada], [Nib]) VALUES (N'Tiago Almeida', CAST(N'1996-08-09' AS Date), 254601669, N'Rua dos Carreiros', NULL)
INSERT [GYM].[Pessoa] ([Nome], [Nascimento], [Nif], [Morada], [Nib]) VALUES (N'Rui Gomes', CAST(N'1993-02-10' AS Date), 569608979, N'Rua do Pinhal', NULL)
INSERT [GYM].[Plano] ([Numero], [Nif_Instrutor], [Nif_Cliente], [Descricao]) VALUES (1, 236601779, 156242589, N'Força')
INSERT [GYM].[Plano] ([Numero], [Nif_Instrutor], [Nif_Cliente], [Descricao]) VALUES (6198, 569608979, 101202303, N'Força')
INSERT [GYM].[Tem_Dieta] ([Nif_Cliente], [Nif_Nutricionista], [Numero_Dieta]) VALUES (254601669, 148508858, 1)
INSERT [GYM].[Treino] ([ID]) VALUES (1)
INSERT [GYM].[Treino] ([ID]) VALUES (4598)
INSERT [GYM].[Treino] ([ID]) VALUES (8079)
INSERT [GYM].[Treino_Pessoal] ([Nif_Cliente], [Nif_Instrutor]) VALUES (101202303, 569608979)
INSERT [GYM].[Treino_Pessoal] ([Nif_Cliente], [Nif_Instrutor]) VALUES (156242589, 236601779)
INSERT [GYM].[Treino_Pessoal] ([Nif_Cliente], [Nif_Instrutor]) VALUES (156242589, 569608979)
INSERT [GYM].[Treino_Pessoal] ([Nif_Cliente], [Nif_Instrutor]) VALUES (254601669, 236601779)
INSERT [GYM].[Treino_Pessoal] ([Nif_Cliente], [Nif_Instrutor]) VALUES (254601669, 569608979)
ALTER TABLE [GYM].[Funcionario] ADD  DEFAULT ((580)) FOR [Ordenado]
GO
ALTER TABLE [GYM].[Cliente]  WITH CHECK ADD FOREIGN KEY([Nif])
REFERENCES [GYM].[Pessoa] ([Nif])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Cliente]  WITH CHECK ADD FOREIGN KEY([Pacote])
REFERENCES [GYM].[Pacote] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Cliente_Participa]  WITH CHECK ADD FOREIGN KEY([Nif])
REFERENCES [GYM].[Cliente] ([Nif])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Cliente_Participa]  WITH CHECK ADD FOREIGN KEY([Nome], [Hora], [Data])
REFERENCES [GYM].[Instancia_Aula] ([Nome], [Hora], [Data])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Composicao_Dieta]  WITH CHECK ADD FOREIGN KEY([ID_Alimento])
REFERENCES [GYM].[Alimento] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Composicao_Dieta]  WITH CHECK ADD FOREIGN KEY([Numero_Dieta])
REFERENCES [GYM].[Dieta] ([Numero])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Composicao_Plano]  WITH CHECK ADD FOREIGN KEY([ID_Treino])
REFERENCES [GYM].[Treino] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Composicao_Plano]  WITH CHECK ADD FOREIGN KEY([Numero_Plano])
REFERENCES [GYM].[Plano] ([Numero])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Composicao_Treino]  WITH CHECK ADD FOREIGN KEY([Codigo_Exercicio])
REFERENCES [GYM].[Exercicio] ([Codigo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Composicao_Treino]  WITH CHECK ADD FOREIGN KEY([ID_Treino])
REFERENCES [GYM].[Treino] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Da_Aula]  WITH CHECK ADD FOREIGN KEY([Nome], [Hora], [Data])
REFERENCES [GYM].[Instancia_Aula] ([Nome], [Hora], [Data])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Da_Aula]  WITH CHECK ADD FOREIGN KEY([Nif])
REFERENCES [GYM].[Instrutor] ([Nif])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Funcionario]  WITH CHECK ADD FOREIGN KEY([Nif])
REFERENCES [GYM].[Pessoa] ([Nif])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Instancia_Aula]  WITH CHECK ADD FOREIGN KEY([Nome])
REFERENCES [GYM].[Aula] ([Nome])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Instancia_Dieta]  WITH CHECK ADD FOREIGN KEY([Numero])
REFERENCES [GYM].[Dieta] ([Numero])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Instrutor]  WITH CHECK ADD FOREIGN KEY([Nif])
REFERENCES [GYM].[Funcionario] ([Nif])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Login]  WITH CHECK ADD FOREIGN KEY([person_id])
REFERENCES [GYM].[Pessoa] ([Nif])
GO
ALTER TABLE [GYM].[Nutricionista]  WITH CHECK ADD FOREIGN KEY([Nif])
REFERENCES [GYM].[Funcionario] ([Nif])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Plano]  WITH CHECK ADD FOREIGN KEY([Nif_Cliente])
REFERENCES [GYM].[Cliente] ([Nif])
GO
ALTER TABLE [GYM].[Plano]  WITH CHECK ADD FOREIGN KEY([Nif_Instrutor])
REFERENCES [GYM].[Instrutor] ([Nif])
GO
ALTER TABLE [GYM].[Tem_Dieta]  WITH CHECK ADD FOREIGN KEY([Numero_Dieta], [Nif_Nutricionista])
REFERENCES [GYM].[Instancia_Dieta] ([Numero], [Nif_Nutricionista])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Tem_Dieta]  WITH CHECK ADD FOREIGN KEY([Nif_Cliente])
REFERENCES [GYM].[Cliente] ([Nif])
ON DELETE CASCADE
GO
ALTER TABLE [GYM].[Treino_Pessoal]  WITH CHECK ADD FOREIGN KEY([Nif_Cliente])
REFERENCES [GYM].[Cliente] ([Nif])
GO
ALTER TABLE [GYM].[Treino_Pessoal]  WITH CHECK ADD FOREIGN KEY([Nif_Instrutor])
REFERENCES [GYM].[Instrutor] ([Nif])
GO
ALTER TABLE [GYM].[Alimento]  WITH CHECK ADD CHECK  (([ID]>(0)))
GO
ALTER TABLE [GYM].[Cliente]  WITH CHECK ADD CHECK  (([Nif]>=(0) AND [Nif]<=(999999999)))
GO
ALTER TABLE [GYM].[Cliente]  WITH CHECK ADD CHECK  (([Numero]>(0)))
GO
ALTER TABLE [GYM].[Cliente]  WITH CHECK ADD  CONSTRAINT [Numero_horas] CHECK  (([Numero_Horas]>=(0)))
GO
ALTER TABLE [GYM].[Cliente] CHECK CONSTRAINT [Numero_horas]
GO
ALTER TABLE [GYM].[Cliente_Participa]  WITH CHECK ADD CHECK  (([Nif]>=(0) AND [Nif]<=(999999999)))
GO
ALTER TABLE [GYM].[Composicao_Dieta]  WITH CHECK ADD CHECK  (([ID_Alimento]>(0)))
GO
ALTER TABLE [GYM].[Composicao_Dieta]  WITH CHECK ADD CHECK  (([Numero_Dieta]>(0)))
GO
ALTER TABLE [GYM].[Composicao_Dieta]  WITH CHECK ADD CHECK  (([Percentagem]>(0)))
GO
ALTER TABLE [GYM].[Composicao_Plano]  WITH CHECK ADD CHECK  (([ID_Treino]>(0)))
GO
ALTER TABLE [GYM].[Composicao_Plano]  WITH CHECK ADD CHECK  (([Numero_Plano]>(0)))
GO
ALTER TABLE [GYM].[Composicao_Treino]  WITH CHECK ADD CHECK  (([Codigo_Exercicio]>(0)))
GO
ALTER TABLE [GYM].[Composicao_Treino]  WITH CHECK ADD CHECK  (([ID_Treino]>(0)))
GO
ALTER TABLE [GYM].[Composicao_Treino]  WITH CHECK ADD CHECK  (([Series]>(0)))
GO
ALTER TABLE [GYM].[Dieta]  WITH CHECK ADD CHECK  (([Numero]>(0)))
GO
ALTER TABLE [GYM].[Exercicio]  WITH CHECK ADD CHECK  (([Codigo]>(0)))
GO
ALTER TABLE [GYM].[Exercicio]  WITH CHECK ADD CHECK  (([Codigo]>(0)))
GO
ALTER TABLE [GYM].[Exercicio]  WITH CHECK ADD CHECK  (([Codigo]>(0)))
GO
ALTER TABLE [GYM].[Exercicio]  WITH CHECK ADD CHECK  (([Codigo]>(0)))
GO
ALTER TABLE [GYM].[Funcionario]  WITH CHECK ADD CHECK  (([Numero]>(0)))
GO
ALTER TABLE [GYM].[Funcionario]  WITH CHECK ADD CHECK  (([Ordenado]>(580)))
GO
ALTER TABLE [GYM].[Funcionario]  WITH CHECK ADD CHECK  (([Nif]>=(0) AND [Nif]<=(999999999)))
GO
ALTER TABLE [GYM].[Instancia_Aula]  WITH CHECK ADD CHECK  (([Duracao]>(0)))
GO
ALTER TABLE [GYM].[Instancia_Aula]  WITH CHECK ADD CHECK  (([Vagas]>(0)))
GO
ALTER TABLE [GYM].[Instancia_Dieta]  WITH CHECK ADD CHECK  (([Nif_Nutricionista]>=(0) AND [Nif_Nutricionista]<=(999999999)))
GO
ALTER TABLE [GYM].[Instancia_Dieta]  WITH CHECK ADD CHECK  (([Numero]>(0)))
GO
ALTER TABLE [GYM].[Instrutor]  WITH CHECK ADD CHECK  (([Nif]>=(0) AND [Nif]<=(999999999)))
GO
ALTER TABLE [GYM].[Nutricionista]  WITH CHECK ADD CHECK  (([Nif]>=(0) AND [Nif]<=(999999999)))
GO
ALTER TABLE [GYM].[Pessoa]  WITH CHECK ADD CHECK  (([Nib]>=(0.) AND [Nib]<=(999999999999999999999.)))
GO
ALTER TABLE [GYM].[Pessoa]  WITH CHECK ADD CHECK  (([Nif]>=(0) AND [Nif]<=(999999999)))
GO
ALTER TABLE [GYM].[Plano]  WITH CHECK ADD CHECK  (([Nif_Cliente]>=(0) AND [Nif_Cliente]<=(999999999)))
GO
ALTER TABLE [GYM].[Plano]  WITH CHECK ADD CHECK  (([Nif_Instrutor]>=(0) AND [Nif_Instrutor]<=(999999999)))
GO
ALTER TABLE [GYM].[Plano]  WITH CHECK ADD CHECK  (([Numero]>(0)))
GO
ALTER TABLE [GYM].[Tem_Dieta]  WITH CHECK ADD CHECK  (([Nif_Cliente]>=(0) AND [Nif_Cliente]<=(999999999)))
GO
ALTER TABLE [GYM].[Tem_Dieta]  WITH CHECK ADD CHECK  (([Nif_Nutricionista]>=(0) AND [Nif_Nutricionista]<=(999999999)))
GO
ALTER TABLE [GYM].[Tem_Dieta]  WITH CHECK ADD CHECK  (([Numero_Dieta]>(0)))
GO
ALTER TABLE [GYM].[Treino]  WITH CHECK ADD CHECK  (([ID]>(0)))
GO
ALTER TABLE [GYM].[Treino_Pessoal]  WITH CHECK ADD CHECK  (([Nif_Cliente]>=(0) AND [Nif_Cliente]<=(999999999)))
GO
ALTER TABLE [GYM].[Treino_Pessoal]  WITH CHECK ADD CHECK  (([Nif_Instrutor]>=(0) AND [Nif_Instrutor]<=(999999999)))
GO
/****** Object:  StoredProcedure [GYM].[AddClientToClass]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[AddClientToClass]
    @clientID   INT,
    @ClassID    VARCHAR(20)
AS
    DECLARE @date DATE
    DECLARE @time TIME
    
    IF EXISTS(SELECT * FROM [GYM].Instancia_Aula WHERE Nome=@ClassID)
    BEGIN
        SELECT @date = Data, @time = Hora
        FROM [GYM].Instancia_Aula
        WHERE Nome = @ClassID;
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Cliente_Participa WHERE Nif=@clientID AND Nome=@ClassID)
    BEGIN
        INSERT INTO [GYM].Cliente_Participa
        VALUES(@clientID, @ClassID, @date, @time);
    END
GO
/****** Object:  StoredProcedure [GYM].[AddClientToInstructor]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- Obter os clientes que têm planos para mostrar esses mesmos
CREATE PROCEDURE [GYM].GetClientsPlans AS
SET NOCOUNT ON;
SELECT Nome
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif


-- Passar o id do cliente para mostrar o plano
CREATE PROCEDURE [GYM].GetClientsIDPlan @ClientName VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Plano.Numero
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif
WHERE Pessoa.Nome = @ClientName 
*/

/*
-- Mostrar o plano do cliente escolhido
CREATE PROCEDURE [GYM].GetClientExercicesPlan AS
SET NOCOUNT ON;
SELECT Descricao, Duracao, Series
FROM [GYM].Exercicio JOIN [GYM].Composicao_Treino ON Exercicio.Codigo = Composicao_Treino.Codigo_Exercicio JOIN [GYM].Treino ON Composicao_Treino.ID_Treino = Treino.ID JOIN Composicao_Plano ON Treino.ID = Composicao_Plano.ID_Treino JOIN Plano ON Plano.Numero = Composicao_Plano.Numero_Plano
	
-- Devolver os instrutores disponiveis
CREATE PROCEDURE [GYM].GetInstructors AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM [GYM].Pessoa AS P JOIN [GYM].Instrutor AS I ON P.Nif=I.Nif


CREATE PROCEDURE [GYM].GetSelectedID @username VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Nif 
FROM GYM.Pessoa 
WHERE Pessoa.Nome = @username

-- Devolver os Clientes associados a um instrutor
CREATE PROCEDURE [GYM].GetClientsFromInstructor @instructor VARCHAR(30) AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa as P JOIN [GYM].Treino_Pessoal as PT on P.Nif=PT.Nif_Cliente) 
WHERE PT.Nif_Instrutor = @instructor


-- Obter todos os clientes disponiveis
CREATE PROCEDURE [GYM].GetAllClients AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa AS P JOIN [GYM].Cliente AS C ON P.Nif=C.Nif) 


CREATE PROCEDURE [GYM].GetAllInstructors AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa AS P JOIN [GYM].Instrutor AS I ON P.Nif=I.Nif)

*/

CREATE PROCEDURE [GYM].[AddClientToInstructor] @cliente INT, @instructor INT AS
SET NOCOUNT ON;
	
	IF NOT EXISTS (SELECT * FROM GYM.Treino_Pessoal WHERE @cliente=Nif_Cliente AND @instructor=Nif_Instrutor)
	BEGIN	
		INSERT INTO [GYM].Treino_Pessoal VALUES (@cliente, @instructor)
	END
	


GO
/****** Object:  StoredProcedure [GYM].[ClientAlreadyHasDiet]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[ClientAlreadyHasDiet]
    @clientID   INT
AS
    SELECT count(1)
    AS RESULT
    FROM [GYM].Tem_Dieta
    WHERE Nif_Cliente=@clientID;
GO
/****** Object:  StoredProcedure [GYM].[ClientAlreadyInPT]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[ClientAlreadyInPT] @client INT, @instructor INT AS
    SELECT count(1)
    AS RESULT 
    FROM [GYM].Treino_Pessoal
    WHERE Nif_Cliente=@client AND Nif_Instrutor=@instructor;
GO
/****** Object:  StoredProcedure [GYM].[DeleteAllDiets]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[DeleteAllDiets]
    @dietID INT
AS
    IF EXISTS(SELECT * FROM [GYM].Composicao_Dieta WHERE Numero_Dieta=@dietID)
    BEGIN
        DELETE FROM [GYM].Composicao_Dieta
        WHERE Numero_Dieta=@dietID;
    END
GO
/****** Object:  StoredProcedure [GYM].[DeleteAllTrainings]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[DeleteAllTrainings]
    @trainID INT
AS
    IF EXISTS(SELECT * FROM [GYM].Composicao_Treino WHERE ID_Treino=@trainID)
    BEGIN
        DELETE FROM [GYM].Composicao_Treino
        WHERE ID_Treino=@trainID;
    END
GO
/****** Object:  StoredProcedure [GYM].[DeleteClass]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[DeleteClass]
    @ClassID    VARCHAR(20)
AS
    IF EXISTS(SELECT * FROM [GYM].Aula WHERE Nome=@ClassID)
    BEGIN
        DELETE FROM [GYM].Aula
        WHERE Nome = @ClassID;
    END
GO
/****** Object:  StoredProcedure [GYM].[DeleteDiet]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[DeleteDiet]
    @dietID INT
AS
    IF EXISTS(SELECT * FROM [GYM].Dieta WHERE Numero=@dietID)
    BEGIN
        DELETE FROM [GYM].Dieta 
        WHERE Numero=@dietID;
    END
GO
/****** Object:  StoredProcedure [GYM].[DeletePlan]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[DeletePlan] @clientID INT
AS
    DECLARE @planID INT
    DECLARE @trainID INT

    IF EXISTS(SELECT * FROM [GYM].Plano WHERE Nif_Cliente=@clientID)
    BEGIN
        SELECT @planID=Numero FROM [GYM].Plano WHERE Nif_Cliente=@clientID;

        IF EXISTS(SELECT * FROM [GYM].Composicao_Plano WHERE Numero_Plano=@planID)
        BEGIN
            SELECT @trainID=ID_Treino FROM [GYM].Composicao_Plano WHERE Numero_Plano=@planID;
        END

        DELETE FROM [GYM].Plano WHERE Nif_Cliente=@clientID;
    END
    IF EXISTS(SELECT * FROM [GYM].Treino WHERE ID=@trainID)
    BEGIN
       DELETE FROM [GYM].Treino WHERE ID=@trainID;
    END
GO
/****** Object:  StoredProcedure [GYM].[DeleteUser]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[DeleteUser] @UserID INT
AS
    SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM [GYM].Treino_Pessoal WHERE Nif_Cliente=@UserID OR Nif_Instrutor=@UserID)
    BEGIN
        DELETE FROM [GYM].Treino_Pessoal
        WHERE Nif_Cliente=@UserID;
        DELETE FROM [GYM].Treino_Pessoal
        WHERE Nif_Instrutor=@UserID;
    END
    IF EXISTS(SELECT * FROM [GYM].Pessoa WHERE Nif=@UserID)
    BEGIN
        DELETE FROM [GYM].Pessoa
        WHERE Nif=@UserID;
    END
GO
/****** Object:  StoredProcedure [GYM].[DeleteUserFromClass]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[DeleteUserFromClass]
    @clientID   INT,
    @classID    VARCHAR(15)
AS
    IF EXISTS(SELECT * FROM [GYM].Cliente_Participa WHERE Nome=@classID)
    BEGIN
        DELETE FROM [GYM].Cliente_Participa
        WHERE Nif = @clientID
        AND Nome = @classID;
    END
GO
/****** Object:  StoredProcedure [GYM].[GetAllClients]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- Obter os clientes que têm planos para mostrar esses mesmos
CREATE PROCEDURE [GYM].GetClientsPlans AS
SET NOCOUNT ON;
SELECT Nome
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif


-- Passar o id do cliente para mostrar o plano
CREATE PROCEDURE [GYM].GetClientsIDPlan @ClientName VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Plano.Numero
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif
WHERE Pessoa.Nome = @ClientName 
*/

/*
-- Mostrar o plano do cliente escolhido
CREATE PROCEDURE [GYM].GetClientExercicesPlan AS
SET NOCOUNT ON;
SELECT Descricao, Duracao, Series
FROM [GYM].Exercicio JOIN [GYM].Composicao_Treino ON Exercicio.Codigo = Composicao_Treino.Codigo_Exercicio JOIN [GYM].Treino ON Composicao_Treino.ID_Treino = Treino.ID JOIN Composicao_Plano ON Treino.ID = Composicao_Plano.ID_Treino JOIN Plano ON Plano.Numero = Composicao_Plano.Numero_Plano
	
-- Devolver os instrutores disponiveis
CREATE PROCEDURE [GYM].GetInstructors AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM [GYM].Pessoa AS P JOIN [GYM].Instrutor AS I ON P.Nif=I.Nif


CREATE PROCEDURE [GYM].GetSelectedID @username VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Nif 
FROM GYM.Pessoa 
WHERE Pessoa.Nome = @username

-- Devolver os Clientes associados a um instrutor
CREATE PROCEDURE [GYM].GetClientsFromInstructor @instructor VARCHAR(30) AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa as P join [GYM].Treino_Pessoal as PT on P.Nif=PT.Nif_Cliente) 
WHERE PT.Nif_Instrutor = @instructor
*/

-- Obter todos os clientes disponiveis
CREATE PROCEDURE [GYM].[GetAllClients] AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa AS P join [GYM].Cliente AS C ON P.Nif=C.Nif) 
GO
/****** Object:  StoredProcedure [GYM].[GetAllInstructors]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- Obter os clientes que têm planos para mostrar esses mesmos
CREATE PROCEDURE [GYM].GetClientsPlans AS
SET NOCOUNT ON;
SELECT Nome
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif


-- Passar o id do cliente para mostrar o plano
CREATE PROCEDURE [GYM].GetClientsIDPlan @ClientName VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Plano.Numero
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif
WHERE Pessoa.Nome = @ClientName 
*/

/*
-- Mostrar o plano do cliente escolhido
CREATE PROCEDURE [GYM].GetClientExercicesPlan AS
SET NOCOUNT ON;
SELECT Descricao, Duracao, Series
FROM [GYM].Exercicio JOIN [GYM].Composicao_Treino ON Exercicio.Codigo = Composicao_Treino.Codigo_Exercicio JOIN [GYM].Treino ON Composicao_Treino.ID_Treino = Treino.ID JOIN Composicao_Plano ON Treino.ID = Composicao_Plano.ID_Treino JOIN Plano ON Plano.Numero = Composicao_Plano.Numero_Plano
	
-- Devolver os instrutores disponiveis
CREATE PROCEDURE [GYM].GetInstructors AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM [GYM].Pessoa AS P JOIN [GYM].Instrutor AS I ON P.Nif=I.Nif


CREATE PROCEDURE [GYM].GetSelectedID @username VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Nif 
FROM GYM.Pessoa 
WHERE Pessoa.Nome = @username

-- Devolver os Clientes associados a um instrutor
CREATE PROCEDURE [GYM].GetClientsFromInstructor @instructor VARCHAR(30) AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa as P JOIN [GYM].Treino_Pessoal as PT on P.Nif=PT.Nif_Cliente) 
WHERE PT.Nif_Instrutor = @instructor


-- Obter todos os clientes disponiveis
CREATE PROCEDURE [GYM].GetAllClients AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa AS P JOIN [GYM].Cliente AS C ON P.Nif=C.Nif) 
*/

CREATE PROCEDURE [GYM].[GetAllInstructors] AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa AS P JOIN [GYM].Instrutor AS I ON P.Nif=I.Nif)
GO
/****** Object:  StoredProcedure [GYM].[GetClassesList]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetClassesList]
AS
    SET NOCOUNT ON;
    SELECT Nome 
    FROM [GYM].Aula;
GO
/****** Object:  StoredProcedure [GYM].[GetClassInfo]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetClassInfo]
	@classID VARCHAR(20)
AS
	SELECT A.Descricao, P.Nome, IA.Data, IA.Hora, IA.Duracao, IA.Vagas
	FROM [GYM].Instancia_Aula AS IA
	JOIN [GYM].Aula AS A
	ON IA.Nome=A.Nome
	JOIN [GYM].Da_Aula AS D
	ON IA.Nome=D.Nome
	JOIN [GYM].Pessoa AS P
	ON D.Nif=P.Nif
	WHERE IA.Nome=@classID;
GO
/****** Object:  StoredProcedure [GYM].[GetClassParticipants]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetClassParticipants]
    @classID VARCHAR(20)
AS
    SET NOCOUNT ON;
    SELECT P.nome
    FROM [GYM].Cliente_Participa AS C
    JOIN [GYM].Pessoa AS P
    ON C.Nif = P.Nif
    WHERE C.Nome = @classID;
GO
/****** Object:  StoredProcedure [GYM].[GetClientExercicesPlan]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- Obter os clientes que têm planos para mostrar esses mesmos
CREATE PROCEDURE [GYM].GetClientsPlans AS
SET NOCOUNT ON;
SELECT Nome
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif


-- Passar o id do cliente para mostrar o plano
CREATE PROCEDURE [GYM].GetClientsIDPlan @ClientName INT AS
SET NOCOUNT ON;
SELECT Plano.Numero
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif
WHERE Pessoa.Nome = @ClientName 
*/


-- Mostrar o plano do cliente escolhido
CREATE PROCEDURE [GYM].[GetClientExercicesPlan] AS
SET NOCOUNT ON;
SELECT Descricao, Duracao, Series
FROM [GYM].Exercicio JOIN [GYM].Composicao_Treino ON Exercicio.Codigo = Composicao_Treino.Codigo_Exercicio JOIN [GYM].Treino ON Composicao_Treino.ID_Treino = Treino.ID JOIN Composicao_Plano ON Treino.ID = Composicao_Plano.ID_Treino JOIN Plano ON Plano.Numero = Composicao_Plano.Numero_Plano
	
/*
SELECT P.descricao as planName, Pe.nome, E.descricao, Tr.tempo, tr.sequencias 
FROM (GymManagement.Plano AS P JOIN GymManagement.plano_tem AS T ON P.plano_id=T.plano_id) JOIN GymManagement.treino_tem AS Tr ON T.treino_id=tr.treino_id JOIN GymManagement.Exercicio AS E ON Tr.exercicio_id=E.codigo join GymManagement.Pessoa as Pe on P.instr_criador=Pe.nif where P.plano_id="
*/
GO
/****** Object:  StoredProcedure [GYM].[GetClientList]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetClientList]
AS
    SET NOCOUNT ON;
    SELECT Nome 
    FROM [GYM].Pessoa AS P
    JOIN [GYM].Cliente AS C
    ON P.Nif=C.Nif
	ORDER BY Nome;
GO
/****** Object:  StoredProcedure [GYM].[GetClientsFromInstructor]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- Obter os clientes que têm planos para mostrar esses mesmos
CREATE PROCEDURE [GYM].GetClientsPlans AS
SET NOCOUNT ON;
SELECT Nome
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif


-- Passar o id do cliente para mostrar o plano
CREATE PROCEDURE [GYM].GetClientsIDPlan @ClientName VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Plano.Numero
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif
WHERE Pessoa.Nome = @ClientName 
*/

/*
-- Mostrar o plano do cliente escolhido
CREATE PROCEDURE [GYM].GetClientExercicesPlan AS
SET NOCOUNT ON;
SELECT Descricao, Duracao, Series
FROM [GYM].Exercicio JOIN [GYM].Composicao_Treino ON Exercicio.Codigo = Composicao_Treino.Codigo_Exercicio JOIN [GYM].Treino ON Composicao_Treino.ID_Treino = Treino.ID JOIN Composicao_Plano ON Treino.ID = Composicao_Plano.ID_Treino JOIN Plano ON Plano.Numero = Composicao_Plano.Numero_Plano
	
-- Devolver os instrutores disponiveis
CREATE PROCEDURE [GYM].GetInstructors AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM [GYM].Pessoa AS P JOIN [GYM].Instrutor AS I ON P.Nif=I.Nif


CREATE PROCEDURE [GYM].GetSelectedID @username VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Nif 
FROM GYM.Pessoa 
WHERE Pessoa.Nome = @username

*/

CREATE PROCEDURE [GYM].[GetClientsFromInstructor] @instructor VARCHAR(30) AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa as P join [GYM].Treino_Pessoal as PT on P.Nif=PT.Nif_Cliente) 
WHERE PT.Nif_Instrutor = @instructor
GO
/****** Object:  StoredProcedure [GYM].[GetClientsIDPlan]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- Obter os clientes que têm planos para mostrar esses mesmos
CREATE PROCEDURE [GYM].GetClientsPlans AS
SET NOCOUNT ON;
SELECT Nome
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif
*/

-- Passar o id do cliente para mostrar o plano
CREATE PROCEDURE [GYM].[GetClientsIDPlan] @ClientName VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Plano.Numero
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif
WHERE Pessoa.Nome = @ClientName 

/*
-- Mostrar o plano do cliente escolhido
CREATE PROCEDURE [GYM].GetClientExercicesPlan AS
SET NOCOUNT ON;
SELECT Descricao, duracao, series
FROM []
	

SELECT P.descricao as planName, Pe.nome, E.descricao, Tr.tempo, tr.sequencias 
FROM (GymManagement.Plano AS P JOIN GymManagement.plano_tem AS T ON P.plano_id=T.plano_id) JOIN GymManagement.treino_tem AS Tr ON T.treino_id=tr.treino_id JOIN GymManagement.Exercicio AS E ON Tr.exercicio_id=E.codigo join GymManagement.Pessoa as Pe on P.instr_criador=Pe.nif where P.plano_id="
*/
GO
/****** Object:  StoredProcedure [GYM].[GetClientsPlans]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetClientsPlans]
AS
	SET NOCOUNT ON;
	SELECT Nome
	FROM [GYM].Plano AS Pl
	JOIN [GYM].Pessoa AS Ps
	ON Pl.Nif_Cliente=Ps.Nif
	
GO
/****** Object:  StoredProcedure [GYM].[GetClientsWithDiets]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetClientsWithDiets]
AS
    SELECT Nome
    FROM [GYM].Tem_Dieta AS D
    JOIN [GYM].Pessoa AS P
    ON D.Nif_Cliente=P.Nif;
GO
/****** Object:  StoredProcedure [GYM].[GetDietFromClient]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetDietFromClient]
    @clientName   VARCHAR(30)
AS
    DECLARE @clientID INT

    IF EXISTS(SELECT * FROM [GYM].Pessoa WHERE Nome=@clientName)
    BEGIN
        SELECT @clientID=Nif FROM [GYM].Pessoa WHERE Nome=@clientName;
    END
    
    SELECT Numero_Dieta
    FROM [GYM].Tem_Dieta
    WHERE Nif_Cliente = @clientID;
GO
/****** Object:  StoredProcedure [GYM].[GetDietInfo]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetDietInfo]
	@dietID INT
AS
	SELECT I.Descricao, P.Nome as NutriName, A.Nome as Food, C.Percentagem
	FROM [GYM].Composicao_Dieta AS C
	JOIN [GYM].Instancia_Dieta AS I
	ON C.Numero_Dieta=I.Numero
	JOIN [GYM].Alimento AS A
	ON C.ID_Alimento=A.ID
	JOIN [GYM].Pessoa AS P
	ON I.Nif_Nutricionista=P.Nif
	WHERE C.Numero_Dieta=@dietID;
GO
/****** Object:  StoredProcedure [GYM].[GetExerciseInfo]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetExerciseInfo]
AS
    SET NOCOUNT ON;
    SELECT Descricao
    FROM [GYM].Exercicio
	
GO
/****** Object:  StoredProcedure [GYM].[GetFoodList]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetFoodList]
AS
    SET NOCOUNT ON;
    SELECT Nome 
    FROM [GYM].Alimento;
GO
/****** Object:  StoredProcedure [GYM].[GetInstructorList]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetInstructorList]
AS
    SET NOCOUNT ON;
    SELECT nome
    FROM [GYM].Pessoa AS P
    JOIN [GYM].Instrutor AS I
    ON P.nif=I.nif;
GO
/****** Object:  StoredProcedure [GYM].[GetInstructors]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- Obter os clientes que têm planos para mostrar esses mesmos
CREATE PROCEDURE [GYM].GetClientsPlans AS
SET NOCOUNT ON;
SELECT Nome
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif


-- Passar o id do cliente para mostrar o plano
CREATE PROCEDURE [GYM].GetClientsIDPlan @ClientName VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Plano.Numero
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif
WHERE Pessoa.Nome = @ClientName 
*/

/*
-- Mostrar o plano do cliente escolhido
CREATE PROCEDURE [GYM].GetClientExercicesPlan AS
SET NOCOUNT ON;
SELECT Descricao, Duracao, Series
FROM [GYM].Exercicio JOIN [GYM].Composicao_Treino ON Exercicio.Codigo = Composicao_Treino.Codigo_Exercicio JOIN [GYM].Treino ON Composicao_Treino.ID_Treino = Treino.ID JOIN Composicao_Plano ON Treino.ID = Composicao_Plano.ID_Treino JOIN Plano ON Plano.Numero = Composicao_Plano.Numero_Plano
*/	

CREATE PROCEDURE [GYM].[GetInstructors] AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM [GYM].Pessoa AS P JOIN [GYM].Instrutor AS I ON P.Nif=I.Nif
GO
/****** Object:  StoredProcedure [GYM].[GetLogin]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetLogin] @username VARCHAR(15), @password VARCHAR(32)
AS
    SET NOCOUNT ON;
    SELECT * 
    FROM [GYM].Login 
    WHERE username=@username and userpass=@password
GO
/****** Object:  StoredProcedure [GYM].[GetLoginType]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetLoginType] @userName VARCHAR(15)
AS
    SET NOCOUNT ON;
    SELECT type 
    FROM [GYM].Login 
    WHERE username=@userName
GO
/****** Object:  StoredProcedure [GYM].[GetNutritionistList]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetNutritionistList]
AS
    SELECT Nome
    FROM [GYM].Nutricionista AS N
    JOIN [GYM].Pessoa AS P
    ON N.Nif=P.Nif;
GO
/****** Object:  StoredProcedure [GYM].[GetPackageInfo]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetPackageInfo]
AS
    SET NOCOUNT ON;
    SELECT Nome_pacote
    FROM [GYM].Pacote
GO
/****** Object:  StoredProcedure [GYM].[GetPersonID]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetPersonID] @userName VARCHAR(15)
AS
    SET NOCOUNT ON;
    SELECT person_id 
    FROM [GYM].Login 
    WHERE username=@userName
GO
/****** Object:  StoredProcedure [GYM].[GetPersonType]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetPersonType] @userID INT, @output VARCHAR(15) OUTPUT
AS
    IF EXISTS(SELECT * FROM [GYM].Cliente WHERE Nif=@userID)
    BEGIN
        SET @output = 'client';
    END
    IF EXISTS(SELECT * FROM [GYM].Instrutor WHERE Nif=@userID)
    BEGIN
        SET @output = 'instructor';
    END
    IF EXISTS(SELECT * FROM [GYM].Nutricionista WHERE Nif=@userID)
    BEGIN
        SET @output = 'nutritionist';
    END
GO
/****** Object:  StoredProcedure [GYM].[GetPlanInfo]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetPlanInfo] @userID INT
AS
	SELECT Pl.Descricao AS planName, P.Nome, E.Descricao, CT.Duracao, CT.Series
	FROM [GYM].Plano AS Pl
	JOIN [GYM].Pessoa AS P
	ON Pl.Nif_Instrutor=P.Nif
	JOIN [GYM].Composicao_Plano AS CP
	ON Pl.Numero=CP.Numero_Plano
	JOIN [GYM].Composicao_Treino AS CT
	ON CP.ID_Treino=CT.ID_Treino
	JOIN [GYM].Exercicio AS E
	ON CT.Codigo_Exercicio=E.Codigo
	WHERE Pl.Nif_Cliente=@userID;
GO
/****** Object:  StoredProcedure [GYM].[GetSelectedClassID]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetSelectedClassID]
    @className VARCHAR(50)
AS
    SET NOCOUNT ON;
    SELECT Nome
    FROM [GYM].Aula
    WHERE Nome = @className;
GO
/****** Object:  StoredProcedure [GYM].[GetSelectedID]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- Obter os clientes que têm planos para mostrar esses mesmos
CREATE PROCEDURE [GYM].GetClientsPlans AS
SET NOCOUNT ON;
SELECT Nome
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif


-- Passar o id do cliente para mostrar o plano
CREATE PROCEDURE [GYM].GetClientsIDPlan @ClientName VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Plano.Numero
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif
WHERE Pessoa.Nome = @ClientName 
*/

/*
-- Mostrar o plano do cliente escolhido
CREATE PROCEDURE [GYM].GetClientExercicesPlan AS
SET NOCOUNT ON;
SELECT Descricao, Duracao, Series
FROM [GYM].Exercicio JOIN [GYM].Composicao_Treino ON Exercicio.Codigo = Composicao_Treino.Codigo_Exercicio JOIN [GYM].Treino ON Composicao_Treino.ID_Treino = Treino.ID JOIN Composicao_Plano ON Treino.ID = Composicao_Plano.ID_Treino JOIN Plano ON Plano.Numero = Composicao_Plano.Numero_Plano
	
-- Devolver os instrutores disponiveis
CREATE PROCEDURE [GYM].GetInstructors AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM [GYM].Pessoa AS P JOIN [GYM].Instrutor AS I ON P.Nif=I.Nif

*/

CREATE PROCEDURE [GYM].[GetSelectedID] @username VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Nif 
FROM GYM.Pessoa 
WHERE Pessoa.Nome = @username
GO
/****** Object:  StoredProcedure [GYM].[GetSelectedIDClient]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- Obter os clientes que têm planos para mostrar esses mesmos
CREATE PROCEDURE [GYM].GetClientsPlans AS
SET NOCOUNT ON;
SELECT Nome
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif


-- Passar o id do cliente para mostrar o plano
CREATE PROCEDURE [GYM].GetClientsIDPlan @ClientName VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Plano.Numero
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif
WHERE Pessoa.Nome = @ClientName 
*/

/*
-- Mostrar o plano do cliente escolhido
CREATE PROCEDURE [GYM].GetClientExercicesPlan AS
SET NOCOUNT ON;
SELECT Descricao, Duracao, Series
FROM [GYM].Exercicio JOIN [GYM].Composicao_Treino ON Exercicio.Codigo = Composicao_Treino.Codigo_Exercicio JOIN [GYM].Treino ON Composicao_Treino.ID_Treino = Treino.ID JOIN Composicao_Plano ON Treino.ID = Composicao_Plano.ID_Treino JOIN Plano ON Plano.Numero = Composicao_Plano.Numero_Plano
	
-- Devolver os instrutores disponiveis
CREATE PROCEDURE [GYM].GetInstructors AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM [GYM].Pessoa AS P JOIN [GYM].Instrutor AS I ON P.Nif=I.Nif


CREATE PROCEDURE [GYM].GetSelectedID @username VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Nif 
FROM GYM.Pessoa 
WHERE Pessoa.Nome = @username

-- Devolver os Clientes associados a um instrutor
CREATE PROCEDURE [GYM].GetClientsFromInstructor @instructor VARCHAR(30) AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa as P JOIN [GYM].Treino_Pessoal as PT on P.Nif=PT.Nif_Cliente) 
WHERE PT.Nif_Instrutor = @instructor


-- Obter todos os clientes disponiveis
CREATE PROCEDURE [GYM].GetAllClients AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa AS P JOIN [GYM].Cliente AS C ON P.Nif=C.Nif) 


CREATE PROCEDURE [GYM].GetAllInstructors AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa AS P JOIN [GYM].Instrutor AS I ON P.Nif=I.Nif)



CREATE PROCEDURE [GYM].[AddClientToInstructor] @instructor INT, @cliente INT AS
SET NOCOUNT ON;
INSERT INTO [GYM].Treino_Pessoal VALUES (@instructor, @cliente)
*/

CREATE PROCEDURE [GYM].[GetSelectedIDClient] @username VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Cliente.Nif 
FROM GYM.Cliente JOIN GYM.Pessoa ON Cliente.Nif = Pessoa.Nif
WHERE Pessoa.Nome = @username
GO
/****** Object:  StoredProcedure [GYM].[GetSelectedPackageID]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetSelectedPackageID] @packageName VARCHAR(15)
AS
    SET NOCOUNT ON;
    SELECT ID
    FROM [GYM].Pacote
    WHERE Nome_pacote=@packageName
GO
/****** Object:  StoredProcedure [GYM].[GetSelectedPackageInfo]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetSelectedPackageInfo] @packageID INT
AS
    SET NOCOUNT ON;
    SELECT Nome_pacote
    FROM [GYM].Pacote
    WHERE ID=@packageID
GO
/****** Object:  StoredProcedure [GYM].[GetSelectedUserID]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetSelectedUserID] @userName varchar(15)
AS
    SET NOCOUNT ON;
    SELECT Nif 
    FROM [GYM].Pessoa 
    WHERE Nome=@userName
GO
/****** Object:  StoredProcedure [GYM].[GetTrainingID]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetTrainingID]
    @userID INT
AS
    IF EXISTS(SELECT * FROM [GYM].Plano WHERE Nif_Cliente=@userID)
    BEGIN
        SELECT CP.ID_Treino
        FROM [GYM].Plano AS P
        JOIN [GYM].Composicao_Plano AS CP
        ON P.Numero=CP.Numero_Plano
        WHERE Nif_Cliente=@userID;
    END
GO
/****** Object:  StoredProcedure [GYM].[GetUserList]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[GetUserList]
AS
    SET NOCOUNT ON;
    SELECT Nome 
    FROM [GYM].Pessoa 
	ORDER BY Nome;
GO
/****** Object:  StoredProcedure [GYM].[NewClass]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[NewClass]
    @classID        VARCHAR(20),
    @className      VARCHAR(30),
    @vacancies      INT,
    @time           VARCHAR(15), 
    @date           VARCHAR(15),
    @duration       INT,
    @instructorID   INT
AS
    IF NOT EXISTS(SELECT * FROM [GYM].Aula WHERE Nome=@classID)
    BEGIN
        INSERT INTO [GYM].Aula
        VALUES(@classID, @className);
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Instancia_Aula WHERE Nome=@classID)
    BEGIN
        INSERT INTO [GYM].Instancia_Aula
        VALUES(@classID, @vacancies, CAST(@time AS TIME), @duration, CONVERT(DATE, @date, 105));
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Da_Aula WHERE Nome=@classID)
    BEGIN
        INSERT INTO [GYM].Da_Aula
        VALUES(@instructorID, @classID, CONVERT(DATE, @date, 105), CAST(@time AS TIME));
    END
GO
/****** Object:  StoredProcedure [GYM].[NewClient]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[NewClient] @clientID INT, @name VARCHAR(30), @address VARCHAR(30), @birth CHAR(10), @clientNumber INT,
    @joinedDate CHAR(10), @packageID INT, @hoursLeft INT
AS
BEGIN
    INSERT INTO [GYM].Pessoa VALUES (@name, CONVERT(date, @birth, 105), @clientID, @address, NULL);
    INSERT INTO [GYM].Cliente VALUES(@clientID, @clientNumber, CONVERT(date, @joinedDate, 105), @packageID, @hoursLeft);
END
GO
/****** Object:  StoredProcedure [GYM].[NewDiet]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[NewDiet]
    @dietID         INT,
    @description    VARCHAR(20),
    @client         VARCHAR(20),
    @nutritionist   VARCHAR(20),
    @food           VARCHAR(20),
    @quantity       INT
AS
    DECLARE @nutri_nif INT
    SELECT @nutri_nif=Nif
    FROM [GYM].Pessoa
    WHERE Nome=@nutritionist

    DECLARE @clientID INT
    SELECT @clientID=Nif
    FROM [GYM].Pessoa
    WHERE Nome=@client

    DECLARE @foodID INT
    SELECT @foodID=ID
    FROM [GYM].Alimento
    WHERE Nome=@food

    IF NOT EXISTS(SELECT * FROM [GYM].Dieta WHERE Numero=@dietID)
    BEGIN
        INSERT INTO [GYM].Dieta 
        VALUES(@dietID);
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Instancia_Dieta WHERE Numero=@dietID)
    BEGIN
        INSERT INTO [GYM].Instancia_Dieta
        VALUES (@description, @nutri_nif, @dietID);
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Composicao_Dieta WHERE Numero_Dieta=@dietID AND ID_Alimento=@foodID)
    BEGIN
        INSERT INTO [GYM].Composicao_Dieta
        VALUES(@dietID, @foodID, @quantity);
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Tem_Dieta WHERE Nif_Cliente=@clientID)
    BEGIN
        INSERT INTO [GYM].Tem_Dieta
        VALUES(@clientID, @nutri_nif, @dietID);
    END
GO
/****** Object:  StoredProcedure [GYM].[NewInstructor]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[NewInstructor] @trainerID INT, @name VARCHAR(30), @address VARCHAR(30), @birth CHAR(10), @employeeNumber INT,
    @salary VARCHAR(15), @qualification VARCHAR(15)
AS
BEGIN
    IF(@salary < 680)
    BEGIN
        SET @salary = 680
    END
    INSERT INTO [GYM].Pessoa VALUES (@name, CONVERT(date, @birth, 105), @trainerID, @address, NULL);
    INSERT INTO [GYM].Funcionario VALUES(@trainerID, @employeeNumber, CAST(@salary AS INT));
    INSERT INTO [GYM].Instrutor VALUES(@trainerID, @qualification);
END
GO
/****** Object:  StoredProcedure [GYM].[NewNutritionist]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[NewNutritionist] @nutriID INT, @name VARCHAR(30), @address VARCHAR(30), @birth CHAR(10), @employeeNumber INT,
    @salary VARCHAR(15)
AS
BEGIN
    IF(@salary < 680)
    BEGIN
        SET @salary = 680
    END
    INSERT INTO [GYM].Pessoa VALUES (@name, CONVERT(date, @birth, 105), @nutriID, @address, NULL);
    INSERT INTO [GYM].Funcionario VALUES(@nutriID, @employeeNumber, CAST(@salary AS INT));
    INSERT INTO [GYM].Nutricionista VALUES(@nutriID);
END
GO
/****** Object:  StoredProcedure [GYM].[NewPlan]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[NewPlan]
    @planID     INT,
    @trainID    INT,
    @clientID   INT,
    @trainerID  INT,
    @planName   VARCHAR(15)
AS
    IF NOT EXISTS(SELECT * FROM [GYM].Plano WHERE Numero=@planID)
    BEGIN
        INSERT INTO [GYM].Plano
        VALUES(@planID, @trainerID, @clientID, @planName);
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Treino WHERE ID=@trainID)
    BEGIN
        INSERT INTO [GYM].Treino VALUES(@trainID);
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Composicao_Plano WHERE Numero_Plano=@planID AND ID_Treino=@trainID)
    BEGIN
        INSERT INTO [GYM].Composicao_Plano VALUES(@planID, @trainID);
    END
GO
/****** Object:  StoredProcedure [GYM].[NumberAlreadyExists]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[NumberAlreadyExists]
	@number	INT
AS
	IF EXISTS(SELECT * FROM [GYM].Cliente WHERE Numero=@number)
	BEGIN
		SELECT count(1)
		AS RESULT
		FROM [GYM].Cliente
		WHERE Numero=@number;
	END

	IF NOT EXISTS(SELECT * FROM [GYM].Cliente WHERE Numero=@number)
	BEGIN
		SELECT count(1)
		AS RESULT
		FROM [GYM].Funcionario
		WHERE Numero=@number;
	END
GO
/****** Object:  StoredProcedure [GYM].[RemoveClientToInstructor]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[RemoveClientToInstructor] @cliente INT, @instructor INT AS
	
	IF EXISTS (SELECT * FROM GYM.Treino_Pessoal WHERE @cliente=Nif_Cliente AND @instructor=Nif_Instrutor)
	BEGIN	
		DELETE FROM GYM.Treino_Pessoal
		WHERE Nif_Cliente=@cliente AND Nif_Instrutor=@instructor
	END
GO
/****** Object:  StoredProcedure [GYM].[TruncateTable]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[TruncateTable]
    @trainID INT
AS
    IF EXISTS(SELECT * FROM [GYM].Composicao_Treino WHERE ID_Treino=@trainID)
    BEGIN
        DELETE FROM [GYM].Composicao_Treino WHERE ID_Treino=@trainID;
    END
GO
/****** Object:  StoredProcedure [GYM].[UpdateClassInfo]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[UpdateClassInfo]
    @classID        VARCHAR(20),
    @className      VARCHAR(30),
    @vacancies      INT,
    @time           VARCHAR(20), 
    @date           VARCHAR(20),
    @duration       INT,
    @instructorID   INT
AS
    IF EXISTS(SELECT * FROM [GYM].Aula WHERE Nome=@classID)
    BEGIN
        UPDATE [GYM].Aula
        SET
            Descricao=@className
        WHERE Nome=@classID;
    END
    IF EXISTS(SELECT * FROM [GYM].Instancia_Aula WHERE Nome=@classID)
    BEGIN
        UPDATE [GYM].Instancia_Aula
        SET
            Vagas = @vacancies,
            Hora = CAST(@time AS TIME),
            Duracao = @duration,
            Data = CONVERT(DATE, @date, 105)
        WHERE Nome = @classID;
    END
    IF EXISTS(SELECT * FROM [GYM].Da_Aula WHERE Nome=@classID)
    BEGIN
        UPDATE [GYM].Da_Aula
        SET
            Nif = @instructorID,
            Data = CONVERT(DATE, @date, 105),
            Hora = CAST(@time AS TIME)
        WHERE Nome = @classID;
    END
GO
/****** Object:  StoredProcedure [GYM].[UpdateDietInfo]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[UpdateDietInfo]
    @dietID         INT,
    @dietName       VARCHAR(20),
    @nutritionist   VARCHAR(20),
    @food           VARCHAR(20),
    @quantity       VARCHAR(20)
AS
    DECLARE @foodID INT
    SELECT @foodID=ID
    FROM [GYM].Alimento
    WHERE Nome=@food;

    DECLARE @nutriID INT
    SELECT @nutriID=Nif 
    FROM [GYM].Pessoa
    WHERE Nome=@nutritionist;

    IF EXISTS(SELECT * FROM [GYM].Instancia_Dieta WHERE Numero=@dietID)
    BEGIN
        UPDATE [GYM].Instancia_Dieta
        SET
            Descricao=@dietName
        WHERE Numero=@dietID;
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Composicao_Dieta WHERE Numero_Dieta=@dietID AND ID_Alimento=@foodID)
    BEGIN
        INSERT INTO [GYM].Composicao_Dieta
        VALUES(@dietID, @foodID, @quantity);
    END
GO
/****** Object:  StoredProcedure [GYM].[UpdatePlanInfo]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[UpdatePlanInfo]
    @clientID       INT,
    @planName       VARCHAR(30),
    @description    VARCHAR(15),
    @duration       INT,
    @series         INT
AS
    DECLARE @planID INT
    DECLARE @trainID INT
    DECLARE @exerciseID INT
    DECLARE @exists INT


    SELECT @planID=Numero
    FROM [GYM].Plano
    WHERE Nif_Cliente=@clientID;

    SELECT @trainID=ID_Treino
    FROM [GYM].Composicao_Plano
    WHERE Numero_Plano=@planID;

    SELECT @exerciseID=Codigo
    FROM [GYM].Exercicio
    WHERE Descricao=@description;

    IF EXISTS(SELECT * FROM [GYM].Plano WHERE Numero=@planID)
    BEGIN
        UPDATE [GYM].Plano
        SET
            Descricao=@planName
        WHERE Numero=@planID;
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Composicao_Treino WHERE ID_Treino=@trainID AND Codigo_Exercicio=@exerciseID)
    BEGIN
        INSERT INTO [GYM].Composicao_Treino
        VALUES (@trainID, @exerciseID, @duration, NULL, @series)
    END
GO
/****** Object:  StoredProcedure [GYM].[UpdateUserInfo]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[UpdateUserInfo] @userID INT, @name VARCHAR(30), @address VARCHAR(30), @birth CHAR(10), @clientNumber INT,
    @joinedDate CHAR(10), @packageID INT, @hoursLeft INT, @employeeNumber INT, @salary VARCHAR(15), @qualification VARCHAR(15)
AS
    SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM [GYM].Pessoa WHERE Nif=@userID)
    BEGIN
        UPDATE [GYM].Pessoa
        SET 
            Nome = @name,
            Morada = @address,
            Nascimento = CONVERT(date, @birth, 105)
        WHERE Nif = @userID;
    END
    IF EXISTS(SELECT * FROM [GYM].Cliente WHERE Nif=@userID)
    BEGIN
        
        UPDATE [GYM].Cliente
        SET
            Numero = @clientNumber,
            Inscricao = CONVERT(date, @joinedDate, 105),
            Pacote = @packageID,
            Numero_Horas = @hoursLeft
        WHERE Nif = @userId;
    END
    IF EXISTS(SELECT * FROM [GYM].Funcionario WHERE Nif=@userID)
    BEGIN
        UPDATE [GYM].Funcionario
        SET
            Numero = @employeeNumber,
            Ordenado = CAST(@salary AS INT)
        WHERE Nif = @userID;
    END
    IF EXISTS(SELECT * FROM [GYM].Instrutor WHERE Nif=@userID)
    BEGIN
        UPDATE [GYM].Instrutor
        SET Qualificacao = @qualification
        WHERE Nif = @userID;
    END
GO
/****** Object:  StoredProcedure [GYM].[UserBelongsToClass]    Script Date: 11/06/2018 22:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GYM].[UserBelongsToClass]
    @clientID   INT,
    @classID    VARCHAR(15)
AS
    SELECT count(1)
    AS RESULT 
    FROM [GYM].Cliente_Participa
    WHERE Nif=@clientID
    AND Nome=@classID;
GO
