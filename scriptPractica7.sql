USE [master]
GO
/****** Object:  Database [practica7]    Script Date: 18/05/2020 10:05:01 p. m. ******/
CREATE DATABASE [practica7]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'practica7', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\practica7.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'practica7_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\practica7_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [practica7] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [practica7].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [practica7] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [practica7] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [practica7] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [practica7] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [practica7] SET ARITHABORT OFF 
GO
ALTER DATABASE [practica7] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [practica7] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [practica7] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [practica7] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [practica7] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [practica7] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [practica7] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [practica7] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [practica7] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [practica7] SET  ENABLE_BROKER 
GO
ALTER DATABASE [practica7] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [practica7] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [practica7] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [practica7] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [practica7] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [practica7] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [practica7] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [practica7] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [practica7] SET  MULTI_USER 
GO
ALTER DATABASE [practica7] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [practica7] SET DB_CHAINING OFF 
GO
ALTER DATABASE [practica7] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [practica7] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [practica7] SET DELAYED_DURABILITY = DISABLED 
GO
USE [practica7]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 18/05/2020 10:05:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[IdAlumno] [int] NOT NULL,
	[Nombre] [varchar](120) NOT NULL,
	[PrimerApellido] [varchar](120) NOT NULL,
	[SegundoApellido] [varchar](120) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupos]    Script Date: 18/05/2020 10:05:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupos](
	[IdGrupo] [int] NOT NULL,
	[Nombre] [varchar](120) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GruposAlumnos]    Script Date: 18/05/2020 10:05:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GruposAlumnos](
	[IdGrupos] [int] NOT NULL,
	[IdAlumnos] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido]) VALUES (1, N'Jose', N'Ramirez', N'Martinez')
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido]) VALUES (2, N'Gretel', N'Gonzalez', N'Rodriguez')
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido]) VALUES (3, N'Yaziel', N'Gomez', N'Torres')
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido]) VALUES (4, N'Leonardo', N'Da', N'Vinci')
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido]) VALUES (5, N'Jesus', N'Amelio', N'Perez')
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido]) VALUES (6, N'Jonathan', N'Gonzalez', N'Hernandez')
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido]) VALUES (7, N'Elvia', N'Gonzalez', N'Lazcano')
GO
INSERT [dbo].[Grupos] ([IdGrupo], [Nombre]) VALUES (1, N'Algebra Lineal')
INSERT [dbo].[Grupos] ([IdGrupo], [Nombre]) VALUES (2, N'Calculo Variables')
INSERT [dbo].[Grupos] ([IdGrupo], [Nombre]) VALUES (3, N'Bases de Datos')
INSERT [dbo].[Grupos] ([IdGrupo], [Nombre]) VALUES (4, N'Aplicaciones Moviles')
INSERT [dbo].[Grupos] ([IdGrupo], [Nombre]) VALUES (5, N'Teoria de Automatas')
INSERT [dbo].[Grupos] ([IdGrupo], [Nombre]) VALUES (6, N'Tec. Multimedia')
INSERT [dbo].[Grupos] ([IdGrupo], [Nombre]) VALUES (7, N'Lab Bases de Datos')
GO
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (1, 1)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (1, 2)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (1, 3)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (2, 1)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (2, 4)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (2, 5)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (2, 6)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (2, 7)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (3, 2)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (3, 3)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (3, 6)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (3, 7)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (4, 1)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (4, 2)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (4, 4)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (4, 5)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (4, 6)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (4, 7)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (5, 3)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (5, 5)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (5, 6)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (6, 2)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (6, 3)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (6, 7)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (7, 1)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (7, 3)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (7, 5)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (7, 7)
GO
ALTER TABLE [dbo].[GruposAlumnos]  WITH CHECK ADD FOREIGN KEY([IdAlumnos])
REFERENCES [dbo].[Alumnos] ([IdAlumno])
GO
ALTER TABLE [dbo].[GruposAlumnos]  WITH CHECK ADD FOREIGN KEY([IdGrupos])
REFERENCES [dbo].[Grupos] ([IdGrupo])
GO
USE [master]
GO
ALTER DATABASE [practica7] SET  READ_WRITE 
GO

select * from Alumnos where upper(PrimerApellido) = 'GONZALEZ'
select IdAlumnos from GruposAlumnos where IdGrupos = 3
select Nombre from Alumnos where IdAlumno = 3
select Nombre from Grupos where IdGrupo = 5
select IdGrupo from Grupos where Nombre = 'Aplicaciones Moviles'

select IdGrupos, COUNT(IdAlumnos) from GruposAlumnos group by IdGrupos
select count(IdAlumno) from Alumnos group by IdAlumno
select count(IdAlumno) from Alumnos where PrimerApellido = 'Gonzalez' group by IdAlumno
select IdGrupo, count(IdGrupo) from Grupos group by IdGrupo
select IdGrupos, COUNT(IdAlumnos) from GruposAlumnos where IdGrupos = 5 group by IdGrupos

select IdGrupos, count(IdAlumnos) from GruposAlumnos group by IdGrupos having count(IdAlumnos) > 3
select IdGrupos, count(IdAlumnos) from GruposAlumnos group by IdGrupos having count(IdAlumnos) = 3
select IdAlumno, count(IdAlumno) from Alumnos where PrimerApellido='Gonzalez' group by IdAlumno having count(IdAlumno) = 3
select sum(IdGrupos) from GruposAlumnos having sum(IdGrupos) > 1
select count(IdGrupo) from Grupos having count(IdGrupo)>1

select sum(IdAlumno) from Alumnos
select count(IdAlumno) from Alumnos where upper(PrimerApellido) = 'GONZALEZ'
select max(IdGrupos) from GruposAlumnos
select avg(IdGrupos) from GruposAlumnos
select count(IdGrupos) from GruposAlumnos 

select top 3 * from Alumnos
select top 5 * from Grupos
select top 4 * from GruposAlumnos
select top 7 * from Alumnos
select top 7 * from Grupos