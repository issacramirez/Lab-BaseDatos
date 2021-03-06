﻿USE [master]
GO
/****** Object:  Database [practica6]    Script Date: 04/05/2020 03:59:50 a.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'practica6')
BEGIN
CREATE DATABASE [practica6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'practica6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\practica6.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'practica6_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\practica6_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [practica6] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [practica6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [practica6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [practica6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [practica6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [practica6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [practica6] SET ARITHABORT OFF 
GO
ALTER DATABASE [practica6] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [practica6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [practica6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [practica6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [practica6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [practica6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [practica6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [practica6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [practica6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [practica6] SET  ENABLE_BROKER 
GO
ALTER DATABASE [practica6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [practica6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [practica6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [practica6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [practica6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [practica6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [practica6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [practica6] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [practica6] SET  MULTI_USER 
GO
ALTER DATABASE [practica6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [practica6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [practica6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [practica6] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [practica6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER AUTHORIZATION ON DATABASE::[practica6] TO [Jose-PC\Jose]
GO
USE [practica6]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 04/05/2020 03:59:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] NOT NULL,
	[idClientePersona] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Cliente] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 04/05/2020 03:59:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persona]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellidos] [varchar](20) NOT NULL,
	[fechaNac] [date] NULL,
	[telefono] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Persona] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 04/05/2020 03:59:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[detalles] [varchar](100) NOT NULL,
	[precio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Producto] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 04/05/2020 03:59:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ticket]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ticket](
	[idTicket] [int] NOT NULL,
	[total] [int] NOT NULL,
	[idTicketTransaccion] [int] NULL,
	[idTicketProducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Ticket] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Transaccion]    Script Date: 04/05/2020 03:59:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Transaccion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Transaccion](
	[idTransaccion] [int] NOT NULL,
	[Fecha] [date] NULL,
	[tipoPago] [varchar](20) NULL,
	[idTransaccionCliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Transaccion] TO  SCHEMA OWNER 
GO
INSERT [dbo].[Cliente] ([idCliente], [idClientePersona]) VALUES (1, 1)
INSERT [dbo].[Cliente] ([idCliente], [idClientePersona]) VALUES (2, 2)
INSERT [dbo].[Cliente] ([idCliente], [idClientePersona]) VALUES (3, 3)
INSERT [dbo].[Cliente] ([idCliente], [idClientePersona]) VALUES (4, 4)
INSERT [dbo].[Cliente] ([idCliente], [idClientePersona]) VALUES (5, 5)
INSERT [dbo].[Cliente] ([idCliente], [idClientePersona]) VALUES (6, 6)
INSERT [dbo].[Cliente] ([idCliente], [idClientePersona]) VALUES (7, 7)
INSERT [dbo].[Cliente] ([idCliente], [idClientePersona]) VALUES (8, 8)
INSERT [dbo].[Cliente] ([idCliente], [idClientePersona]) VALUES (9, 9)
INSERT [dbo].[Persona] ([idPersona], [nombre], [apellidos], [fechaNac], [telefono]) VALUES (1, N'Juan', N'Perez', CAST(N'1998-03-15' AS Date), N'8127635473')
INSERT [dbo].[Persona] ([idPersona], [nombre], [apellidos], [fechaNac], [telefono]) VALUES (2, N'Maria', N'Martinez', CAST(N'1999-04-18' AS Date), N'8127631423')
INSERT [dbo].[Persona] ([idPersona], [nombre], [apellidos], [fechaNac], [telefono]) VALUES (3, N'Pablo', N'Rodriguez', CAST(N'1995-12-21' AS Date), N'8127654323')
INSERT [dbo].[Persona] ([idPersona], [nombre], [apellidos], [fechaNac], [telefono]) VALUES (4, N'Gonzalo', N'Ramirez', CAST(N'1984-01-13' AS Date), N'8176583921')
INSERT [dbo].[Persona] ([idPersona], [nombre], [apellidos], [fechaNac], [telefono]) VALUES (5, N'Yaziel', N'Gomez', CAST(N'2000-07-19' AS Date), N'8101928374')
INSERT [dbo].[Persona] ([idPersona], [nombre], [apellidos], [fechaNac], [telefono]) VALUES (6, N'Francisco', N'Gongora', CAST(N'1999-08-07' AS Date), N'8165748392')
INSERT [dbo].[Persona] ([idPersona], [nombre], [apellidos], [fechaNac], [telefono]) VALUES (7, N'Gretel', N'Gonzales', CAST(N'1999-11-17' AS Date), N'8129384756')
INSERT [dbo].[Persona] ([idPersona], [nombre], [apellidos], [fechaNac], [telefono]) VALUES (8, N'Jonathan', N'Gonzales', CAST(N'1994-09-28' AS Date), N'8127635473')
INSERT [dbo].[Persona] ([idPersona], [nombre], [apellidos], [fechaNac], [telefono]) VALUES (9, N'Jose', N'Ramirez', CAST(N'1999-03-17' AS Date), N'8128953598')
INSERT [dbo].[Producto] ([idProducto], [nombre], [detalles], [precio]) VALUES (1, N'Choko krispis', N'cereal de trigo', 45)
INSERT [dbo].[Producto] ([idProducto], [nombre], [detalles], [precio]) VALUES (2, N'Palmolive', N'Jabon Neutro', 15)
INSERT [dbo].[Producto] ([idProducto], [nombre], [detalles], [precio]) VALUES (3, N'Gillete', N'Rastrillos', 30)
INSERT [dbo].[Producto] ([idProducto], [nombre], [detalles], [precio]) VALUES (4, N'Laptop', N'Hp pavilion', 12000)
INSERT [dbo].[Producto] ([idProducto], [nombre], [detalles], [precio]) VALUES (5, N'Choco Chips', N'galletas de avena', 35)
INSERT [dbo].[Producto] ([idProducto], [nombre], [detalles], [precio]) VALUES (6, N'Axion', N'lavatrastes', 25)
INSERT [dbo].[Producto] ([idProducto], [nombre], [detalles], [precio]) VALUES (7, N'Ace', N'detergente', 120)
INSERT [dbo].[Producto] ([idProducto], [nombre], [detalles], [precio]) VALUES (8, N'Carbon', N'carbon para fogata', 60)
INSERT [dbo].[Producto] ([idProducto], [nombre], [detalles], [precio]) VALUES (9, N'Holanda', N'nieve de sabores', 70)
INSERT [dbo].[Ticket] ([idTicket], [total], [idTicketTransaccion], [idTicketProducto]) VALUES (1, 40, 1, 1)
INSERT [dbo].[Ticket] ([idTicket], [total], [idTicketTransaccion], [idTicketProducto]) VALUES (2, 15, 2, 2)
INSERT [dbo].[Ticket] ([idTicket], [total], [idTicketTransaccion], [idTicketProducto]) VALUES (3, 30, 3, 3)
INSERT [dbo].[Ticket] ([idTicket], [total], [idTicketTransaccion], [idTicketProducto]) VALUES (4, 12000, 4, 4)
INSERT [dbo].[Ticket] ([idTicket], [total], [idTicketTransaccion], [idTicketProducto]) VALUES (5, 35, 5, 5)
INSERT [dbo].[Ticket] ([idTicket], [total], [idTicketTransaccion], [idTicketProducto]) VALUES (6, 25, 6, 6)
INSERT [dbo].[Ticket] ([idTicket], [total], [idTicketTransaccion], [idTicketProducto]) VALUES (7, 120, 7, 7)
INSERT [dbo].[Ticket] ([idTicket], [total], [idTicketTransaccion], [idTicketProducto]) VALUES (8, 50, 8, 8)
INSERT [dbo].[Ticket] ([idTicket], [total], [idTicketTransaccion], [idTicketProducto]) VALUES (9, 70, 9, 9)
INSERT [dbo].[Transaccion] ([idTransaccion], [Fecha], [tipoPago], [idTransaccionCliente]) VALUES (1, CAST(N'1997-12-12' AS Date), N'efectivo nacional', 1)
INSERT [dbo].[Transaccion] ([idTransaccion], [Fecha], [tipoPago], [idTransaccionCliente]) VALUES (2, CAST(N'2003-01-10' AS Date), N'targeta VISA', 2)
INSERT [dbo].[Transaccion] ([idTransaccion], [Fecha], [tipoPago], [idTransaccionCliente]) VALUES (3, CAST(N'2006-07-18' AS Date), N'vales de despensa', 3)
INSERT [dbo].[Transaccion] ([idTransaccion], [Fecha], [tipoPago], [idTransaccionCliente]) VALUES (4, CAST(N'2001-04-23' AS Date), N'vales automaticos', 4)
INSERT [dbo].[Transaccion] ([idTransaccion], [Fecha], [tipoPago], [idTransaccionCliente]) VALUES (5, CAST(N'2010-09-13' AS Date), N'cheque de gobierno', 5)
INSERT [dbo].[Transaccion] ([idTransaccion], [Fecha], [tipoPago], [idTransaccionCliente]) VALUES (6, CAST(N'1999-01-01' AS Date), N'cheque de banco', 6)
INSERT [dbo].[Transaccion] ([idTransaccion], [Fecha], [tipoPago], [idTransaccionCliente]) VALUES (7, CAST(N'2019-06-08' AS Date), N'dolares', 7)
INSERT [dbo].[Transaccion] ([idTransaccion], [Fecha], [tipoPago], [idTransaccionCliente]) VALUES (8, CAST(N'2007-02-17' AS Date), N'libras', 8)
INSERT [dbo].[Transaccion] ([idTransaccion], [Fecha], [tipoPago], [idTransaccionCliente]) VALUES (9, CAST(N'2004-03-27' AS Date), N'targeta MasterCard', 9)
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_idPersonaCliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cliente]'))
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [fk_idPersonaCliente] FOREIGN KEY([idClientePersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_idPersonaCliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cliente]'))
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [fk_idPersonaCliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_idProductoTicket]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ticket]'))
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [fk_idProductoTicket] FOREIGN KEY([idTicketProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_idProductoTicket]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ticket]'))
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [fk_idProductoTicket]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_idTransaccionCliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ticket]'))
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [fk_idTransaccionCliente] FOREIGN KEY([idTicketTransaccion])
REFERENCES [dbo].[Transaccion] ([idTransaccion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_idTransaccionCliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ticket]'))
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [fk_idTransaccionCliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_idClienteTransaccion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Transaccion]'))
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [fk_idClienteTransaccion] FOREIGN KEY([idTransaccionCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_idClienteTransaccion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Transaccion]'))
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [fk_idClienteTransaccion]
GO
USE [master]
GO
ALTER DATABASE [practica6] SET  READ_WRITE 
GO

update Persona set nombre='Maria',apellidos='Martinez' where idPersona = 2
update Persona set nombre='Gonzalo',apellidos='Ramirez' where idPersona = 4
update Producto set precio=45 where idProducto = 1
update Producto set precio=20 ,detalles='nuevo jabon neutro' where idProducto = 2
update Producto set precio=60  where idProducto = 8

delete from Ticket where idTicket = 10
delete from Transaccion where idTransaccion = 10
delete from Cliente where idCliente = 10
delete from Persona where idPersona = 10
delete from Producto where idProducto = 10
