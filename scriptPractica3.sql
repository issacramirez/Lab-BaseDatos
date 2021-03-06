USE [master]
GO
/****** Object:  Database [practica2]    Script Date: 13/03/2020 08:34:39 p.m. ******/
CREATE DATABASE [practica2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'practica2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\practica2.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'practica2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\practica2_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [practica2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [practica2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [practica2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [practica2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [practica2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [practica2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [practica2] SET ARITHABORT OFF 
GO
ALTER DATABASE [practica2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [practica2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [practica2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [practica2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [practica2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [practica2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [practica2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [practica2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [practica2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [practica2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [practica2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [practica2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [practica2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [practica2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [practica2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [practica2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [practica2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [practica2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [practica2] SET  MULTI_USER 
GO
ALTER DATABASE [practica2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [practica2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [practica2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [practica2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [practica2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [practica2]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 13/03/2020 08:34:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[IdCita] [int] NOT NULL,
	[Fecha] [date] NULL,
	[IdCitaDoctor] [int] NULL,
	[IdCitaPaciente] [int] NULL,
	[IdCitaConsultorio] [int] NULL,
	[IdCitaHospital] [int] NULL,
 CONSTRAINT [pk_Citas] PRIMARY KEY CLUSTERED 
(
	[IdCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consultorios]    Script Date: 13/03/2020 08:34:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultorios](
	[IdConsultorio] [int] NOT NULL,
 CONSTRAINT [pk_Consultorios] PRIMARY KEY CLUSTERED 
(
	[IdConsultorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctores]    Script Date: 13/03/2020 08:34:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctores](
	[IdDoctor] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[ApPaterno] [varchar](20) NOT NULL,
	[ApMaterno] [varchar](20) NOT NULL,
 CONSTRAINT [pk_Doctores] PRIMARY KEY CLUSTERED 
(
	[IdDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hospitales]    Script Date: 13/03/2020 08:34:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitales](
	[IdHospital] [int] NOT NULL,
 CONSTRAINT [pk_Hospitales] PRIMARY KEY CLUSTERED 
(
	[IdHospital] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 13/03/2020 08:34:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pacientes](
	[IdPaciente] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[ApPaterno] [varchar](20) NULL,
	[ApMaterno] [varchar](20) NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Edad]  AS (datediff(year,[FechaNacimiento],getdate())),
	[Email] [varchar](20) NULL,
 CONSTRAINT [pk_Pacientes] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Doctores] ([IdDoctor], [Nombre], [ApPaterno], [ApMaterno]) VALUES (1, N'Jose', N'Ramirez', N'Martinez')
INSERT [dbo].[Doctores] ([IdDoctor], [Nombre], [ApPaterno], [ApMaterno]) VALUES (2, N'Angelica', N'Lopez', N'Rodriguez')
INSERT [dbo].[Doctores] ([IdDoctor], [Nombre], [ApPaterno], [ApMaterno]) VALUES (3, N'Guadalupe', N'Rivera', N'Hernandez')
INSERT [dbo].[Pacientes] ([IdPaciente], [Nombre], [ApPaterno], [ApMaterno], [FechaNacimiento], [Email]) VALUES (1, N'Alberto', N'Rocha', N'Cervantes', CAST(N'1996-03-11 00:00:00.000' AS DateTime), N'hola@mundo.com')
INSERT [dbo].[Pacientes] ([IdPaciente], [Nombre], [ApPaterno], [ApMaterno], [FechaNacimiento], [Email]) VALUES (2, N'Juan', N'Jasso', N'Rivera', CAST(N'1992-08-27 00:00:00.000' AS DateTime), N'juan@jasso.com')
INSERT [dbo].[Pacientes] ([IdPaciente], [Nombre], [ApPaterno], [ApMaterno], [FechaNacimiento], [Email]) VALUES (3, N'Pedro', N'Martinez', N'Hernandez', CAST(N'1990-12-19 00:00:00.000' AS DateTime), N'pedro@martinez')
INSERT [dbo].[Pacientes] ([IdPaciente], [Nombre], [ApPaterno], [ApMaterno], [FechaNacimiento], [Email]) VALUES (4, N'Gretel', N'Gonzalez', N'Rodriguez', CAST(N'1999-11-17 00:00:00.000' AS DateTime), N'gretel@gonzales')
/****** Object:  Index [indx_IDDoctor]    Script Date: 13/03/2020 08:34:39 p.m. ******/
CREATE NONCLUSTERED INDEX [indx_IDDoctor] ON [dbo].[Doctores]
(
	[IdDoctor] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UC_Pacientes_Email]    Script Date: 13/03/2020 08:34:39 p.m. ******/
ALTER TABLE [dbo].[Pacientes] ADD  CONSTRAINT [UC_Pacientes_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indx_FechaNacimiento]    Script Date: 13/03/2020 08:34:39 p.m. ******/
CREATE NONCLUSTERED INDEX [indx_FechaNacimiento] ON [dbo].[Pacientes]
(
	[FechaNacimiento] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [fk_modCitaConsultorio] FOREIGN KEY([IdCitaConsultorio])
REFERENCES [dbo].[Consultorios] ([IdConsultorio])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [fk_modCitaConsultorio]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [fk_modCitaDoctor] FOREIGN KEY([IdCitaDoctor])
REFERENCES [dbo].[Doctores] ([IdDoctor])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [fk_modCitaDoctor]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [fk_modCitaHospital] FOREIGN KEY([IdCitaHospital])
REFERENCES [dbo].[Hospitales] ([IdHospital])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [fk_modCitaHospital]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [fk_modCitaPaciente] FOREIGN KEY([IdCitaPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [fk_modCitaPaciente]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [CHK_Column_DocExec] CHECK  (([FechaNacimiento]<=dateadd(year,(-18),getdate())))
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [CHK_Column_DocExec]
GO
USE [master]
GO
ALTER DATABASE [practica2] SET  READ_WRITE 
GO
