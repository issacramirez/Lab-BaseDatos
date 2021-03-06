USE [practica10]
GO
/****** Object:  UserDefinedFunction [dbo].[nombreMes]    Script Date: 26/05/2020 02:23:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[nombreMes]
 (@fecha datetime='2007/01/01')
  returns varchar(10)
  as
  begin
    declare @nombre varchar(10)
    set @nombre=
     case datename(month,@fecha)
       when 'January' then 'Enero'
       when 'February' then 'Febrero'
       when 'March' then 'Marzo'
       when 'April' then 'Abril'
       when 'May' then 'Mayo'
       when 'June' then 'Junio'
       when 'July' then 'Julio'
       when 'August' then 'Agosto'
       when 'September' then 'Setiembre'
       when 'October' then 'Octubre'
       when 'November' then 'Noviembre'
       when 'December' then 'Diciembre'
     end--case
    return @nombre
 end
GO
/****** Object:  UserDefinedFunction [dbo].[promedio]    Script Date: 26/05/2020 02:23:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[promedio]
 (@valor1 decimal(4,2),
  @valor2 decimal(4,2)
 )
 returns decimal (6,2)
 as
 begin 
   declare @resultado decimal(6,2)
   set @resultado=(@valor1+@valor2)/2
   return @resultado
 end
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 26/05/2020 02:23:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[IdAlumno] [int] NOT NULL,
	[Nombre] [varchar](120) NOT NULL,
	[PrimerApellido] [varchar](120) NOT NULL,
	[SegundoApellido] [varchar](120) NOT NULL,
	[calificaciones] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlumnosGonzalez]    Script Date: 26/05/2020 02:23:58 a. m. ******/
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
/****** Object:  Table [dbo].[Grupos]    Script Date: 26/05/2020 02:23:58 a. m. ******/
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
/****** Object:  Table [dbo].[GruposAlumnos]    Script Date: 26/05/2020 02:23:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GruposAlumnos](
	[IdGrupos] [int] NOT NULL,
	[IdAlumnos] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido], [calificaciones]) VALUES (1, N'Jose', N'Ramirez', N'Martinez', 10)
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido], [calificaciones]) VALUES (2, N'Gretel', N'Gonzalez', N'Rodriguez', 9)
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido], [calificaciones]) VALUES (3, N'Yaziel', N'Gomez', N'Torres', 7)
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido], [calificaciones]) VALUES (4, N'Leonardo', N'Da', N'Vinci', 8)
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido], [calificaciones]) VALUES (6, N'Jonathan', N'Gonzalez', N'Hernandez', 8)
INSERT [dbo].[Alumnos] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido], [calificaciones]) VALUES (7, N'Elvia', N'Gonzalez', N'Lazcano', 9)
GO
INSERT [dbo].[AlumnosGonzalez] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido]) VALUES (2, N'Gretel', N'Gonzalez', N'Rodriguez')
INSERT [dbo].[AlumnosGonzalez] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido]) VALUES (6, N'Jonathan', N'Gonzalez', N'Hernandez')
INSERT [dbo].[AlumnosGonzalez] ([IdAlumno], [Nombre], [PrimerApellido], [SegundoApellido]) VALUES (7, N'Elvia', N'Gonzalez', N'Lazcano')
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
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (2, 6)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (2, 7)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (3, 2)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (3, 3)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (3, 6)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (3, 7)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (4, 1)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (4, 2)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (4, 4)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (4, 6)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (4, 7)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (5, 3)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (5, 6)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (6, 2)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (6, 3)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (6, 7)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (7, 1)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (7, 3)
INSERT [dbo].[GruposAlumnos] ([IdGrupos], [IdAlumnos]) VALUES (7, 7)
GO
ALTER TABLE [dbo].[GruposAlumnos]  WITH CHECK ADD FOREIGN KEY([IdAlumnos])
REFERENCES [dbo].[Alumnos] ([IdAlumno])
GO
ALTER TABLE [dbo].[GruposAlumnos]  WITH CHECK ADD FOREIGN KEY([IdGrupos])
REFERENCES [dbo].[Grupos] ([IdGrupo])
GO
/****** Object:  StoredProcedure [dbo].[Agregar]    Script Date: 26/05/2020 02:23:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Agregar]
as 
if object_id('Alumnos.calificaciones') is null
		alter table Alumnos
		add calificaciones int
GO
/****** Object:  StoredProcedure [dbo].[Alumno]    Script Date: 26/05/2020 02:23:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Alumno]
	@Nombre varchar(256),
	@Apellido varchar(256)
as
	select * from Alumnos where Nombre = @Nombre and PrimerApellido = @Apellido
GO
/****** Object:  StoredProcedure [dbo].[BuscarAlumno]    Script Date: 26/05/2020 02:23:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BuscarAlumno]
	@Alumno varchar(30)=null
as 
	if @Alumno is null
	begin 
		select 'Debe indicar un Alumno' return
	end;
	select * from  Alumnos where Nombre = @Alumno
GO
/****** Object:  StoredProcedure [dbo].[Materias]    Script Date: 26/05/2020 02:23:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Materias]
	@Materia varchar(256)
as
	select * from Grupos where Nombre = @Materia
GO
/****** Object:  StoredProcedure [dbo].[MostarAlumnosMaterias]    Script Date: 26/05/2020 02:23:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MostarAlumnosMaterias]
as
select Grupos.Nombre, Alumnos.Nombre, Alumnos.PrimerApellido,Alumnos.SegundoApellido from GruposAlumnos
join Grupos on Grupos.IdGrupo = GruposAlumnos.IdGrupos
join Alumnos on Alumnos.IdAlumno = GruposAlumnos.IdAlumnos
GO
/****** Object:  Trigger [dbo].[BorrarAlumno]    Script Date: 26/05/2020 02:23:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[BorrarAlumno]
on [dbo].[Alumnos]
for delete
as
	select * from deleted
GO
ALTER TABLE [dbo].[Alumnos] ENABLE TRIGGER [BorrarAlumno]
GO
/****** Object:  Trigger [dbo].[Nombre]    Script Date: 26/05/2020 02:23:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Nombre]
 on [dbo].[Alumnos]
 instead of insert
 as
	select * from inserted
GO
ALTER TABLE [dbo].[Alumnos] ENABLE TRIGGER [Nombre]
GO
