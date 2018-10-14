USE [master]

GO

IF DB_ID('Apartment') IS NOT NULL
	DROP DATABASE Apartment

GO
	
CREATE DATABASE Apartment

GO

USE Apartment

GO

CREATE TABLE Country 
(
	[Id] Int identity(1,1) not null primary key,
	[Name] varchar(256) not null,
	[IsEnabled] bit not null
)
GO

CREATE TABLE [State] 
(
	[Id] Int identity(1,1) not null primary key,
	[CountryId] Int not null,
	[Name] varchar(256) not null,
	[IsEnabled] bit not null
)


CREATE TABLE City 
(
	[Id] Int identity(1,1) not null primary key,
	[StateId] Int not null,
	[Name] varchar(256) not null,
	[IsEnabled] bit not null
)

GO

CREATE TABLE [Role]
(
	[Id] Int identity(1,1) not null primary key,
	[Name] varchar(256) not null,
	[IsEnabled] bit not null
)
GO

TRUNCATE TABLE [Role]
INSERT INTO [Role]
SELECT 'Onwer',1
UNION SELECT 'Tenant', 1
GO

CREATE TABLE [UserType]
(
	[Id] Int identity(1,1) not null primary key,
	[Name] varchar(256) not null,
	[IsEnabled] bit not null
)

GO

TRUNCATE TABLE [UserType]
INSERT INTO [UserType]
SELECT 'Admin', 1
UNION SELECT 'Chairman', 1
UNION SELECT 'Secretory', 1
UNION SELECT 'Member', 1
GO


CREATE TABLE [dbo].[Society]
(
	[Id] Int identity(1,1) not null primary key,
	[Name] varchar(256) not null ,
	[Address1] varchar(256) not null ,
	[Address2] varchar(256) null,
	[CityId] varchar(64) not null,
	[Mobile] smallint not null,
	[Phone] smallint null,
	[Email] varchar(64) not null,  --- ApartmentFacebook will provide email.
	[Website] varchar(255) null,
	[IsActive] bit not null
)

GO

CREATE TABLE [Member]
(
	[Id] Int identity(1,1) not null primary key,
	[SocietyId] Int not null,
	[Name] varchar(256) not null,
	[Wing] varchar(256) not null,
	[FlatNumber] smallint not null,
	[Mobile] smallint not null,
	[Phone] smallint null,
	[Email] varchar(64) null,
	[Password] varchar(64) not null,
	[UserTypeId] bit, --- 1 = Onwer 2 = Tenant
	[RoleId] int, -- 1 = Admin, 2 = Chairman, 3= Secretory, 4 = members and so on 
	[IsActive] bit not null
)

