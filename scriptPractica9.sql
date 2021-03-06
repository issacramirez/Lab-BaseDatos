USE [master]
GO
/****** Object:  Database [practica9]    Script Date: 19/05/2020 12:16:34 a. m. ******/
CREATE DATABASE [practica9]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'practica9', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\practica9.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'practica9_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\practica9_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [practica9] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [practica9].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [practica9] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [practica9] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [practica9] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [practica9] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [practica9] SET ARITHABORT OFF 
GO
ALTER DATABASE [practica9] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [practica9] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [practica9] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [practica9] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [practica9] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [practica9] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [practica9] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [practica9] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [practica9] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [practica9] SET  ENABLE_BROKER 
GO
ALTER DATABASE [practica9] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [practica9] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [practica9] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [practica9] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [practica9] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [practica9] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [practica9] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [practica9] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [practica9] SET  MULTI_USER 
GO
ALTER DATABASE [practica9] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [practica9] SET DB_CHAINING OFF 
GO
ALTER DATABASE [practica9] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [practica9] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [practica9] SET DELAYED_DURABILITY = DISABLED 
GO
USE [practica9]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 19/05/2020 12:16:34 a. m. ******/
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
/****** Object:  Table [dbo].[AlumnosGonzalez]    Script Date: 19/05/2020 12:16:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnosGonzalez](
	[IdAlumno] [int] NOT NULL,
	[Nombre] [varchar](120) NOT NULL,
	[PrimerApellido] [varchar](120) NOT NULL,
	[SegundoApellido] [varchar](120) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupos]    Script Date: 19/05/2020 12:16:34 a. m. ******/
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
/****** Object:  Table [dbo].[GruposAlumnos]    Script Date: 19/05/2020 12:16:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GruposAlumnos](
	[IdGrupos] [int] NOT NULL,
	[IdAlumnos] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GABCDView]    Script Date: 19/05/2020 12:16:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GABCDView] as
select count(IdGrupo) as ConteoGrupos from Grupos having count(IdGrupo)>1
GO

select * from GABCDView

/****** Object:  View [dbo].[GABCView]    Script Date: 19/05/2020 12:16:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GABCView] as
select IdGrupos, count(IdAlumnos) as ConteoAlumnos from GruposAlumnos group by IdGrupos having count(IdAlumnos) > 3
GO

select * from GABCView

/****** Object:  View [dbo].[GABView]    Script Date: 19/05/2020 12:16:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GABView] as
select IdAlumno, count(IdAlumno) as ConteoAlumnos from Alumnos where PrimerApellido='Gonzalez' group by IdAlumno having count(IdAlumno) = 3
GO

select * from GABView

/****** Object:  View [dbo].[GAView]    Script Date: 19/05/2020 12:16:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GAView] as
select Grupos.Nombre, Alumnos.PrimerApellido,Alumnos.SegundoApellido from GruposAlumnos
join Grupos on Grupos.IdGrupo = GruposAlumnos.IdGrupos
join Alumnos on Alumnos.IdAlumno = GruposAlumnos.IdAlumnos
  
GO

select * from GAView

/****** Object:  View [dbo].[GView]    Script Date: 19/05/2020 12:16:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GView] as
select GruposAlumnos.IdGrupos, Alumnos.Nombre, Alumnos.PrimerApellido,Alumnos.SegundoApellido from GruposAlumnos
join Alumnos on GruposAlumnos.IdGrupos =  Alumnos.IdAlumno
GO

select * from GView

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
