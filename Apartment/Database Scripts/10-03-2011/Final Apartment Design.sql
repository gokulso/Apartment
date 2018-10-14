CREATE DATABASE Apartment
GO
USE Apartment
GO

CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO

TRUNCATE TABLE [Role]
INSERT INTO [Role]
SELECT 'Admin',1
UNION SELECT 'Forum Read',1
UNION SELECT 'Froum Write', 1
UNION SELECT 'Poll Read', 1
UNION SELECT 'Poll Write', 1
UNION SELECT 'Notice Read', 1
UNION SELECT 'Notice Write', 1
UNION SELECT 'Service Request Read', 1
UNION SELECT 'Service Request Write', 1
UNION SELECT 'Gallory Read', 1
UNION SELECT 'Gallory Write', 1


CREATE TABLE [dbo].[Relation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]

GO

TRUNCATE TABLE Relation
GO
INSERT INTO Relation
SELECT 'Self', 1
UNION SELECT 'Wife', 1
UNION SELECT 'Son', 1
UNION SELECT 'Doughter', 1
UNION SELECT 'GrandFather', 1
UNION SELECT 'GrandMonther', 1
UNION SELECT 'Brother', 1
UNION SELECT 'Friend', 1

GO

CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]

GO

TRUNCATE TABLE Country
INSERT INTO Country
SELECT 'India',1

GO


CREATE TABLE [dbo].[UserType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO


TRUNCATE TABLE [UserType]
INSERT INTO [UserType]
SELECT 'Admin', 1
UNION SELECT 'Chairman', 1
UNION SELECT 'Secretory', 1
UNION SELECT 'Member', 1
UNION SELECT 'Vendor', 1
GO


CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO


TRUNCATE TABLE [State]
INSERT INTO [State]
SELECT 1, 'Maharashtra',1
GO


CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]

GO

TRUNCATE TABLE City
INSERT INTO City
SELECT 1, 'Pune',1

GO


CREATE TABLE [dbo].[Society](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[Address1] [varchar](256) NOT NULL,
	[Address2] [varchar](256) NULL,
	[CityId] [int] NOT NULL,
	[Mobile] [varchar](16) NOT NULL,
	[Phone] [varchar](16) NULL,
	[Email] [varchar](64) NOT NULL,
	[Website] [varchar](256) NULL,
	[CreatedDate] Datetime NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]


GO


CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	--[UserSocietyId] [int] NOT NULL,
	[Email] [varchar](64) NULL,
	[Password] [varchar](64) NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[IsOwner] bit NOT NULL,  -- Owner Or Tenant
	[JoinDate] [smalldatetime] NOT NULL,
	[InterCom] [int] NULL,
	[IsStayingHere] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) 

GO

CREATE TABLE [dbo].[UserRole]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SocietyId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)	
)

GO


CREATE TABLE [dbo].[UserSociety]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SocietyId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)	
)

GO

CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO

TRUNCATE TABLE [Gender]
INSERT INTO [Gender]
SELECT 'Male'
UNION ALL SELECT 'Female'

GO

CREATE TABLE [dbo].[MemberInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RelationId] [int] NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[DOB] [smalldatetime] NULL,
	[GenderId] [int] NOT NULL, 
	[BadgeNumber] [int] NULL,
	[Wing] [varchar](64) NOT NULL,
	[FlatNumber] [int] NOT NULL,
	[Mobile] [varchar](16) NULL,
	[Phone] [varchar](16) NULL,
	[Email] [varchar](64) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) 
GO

CREATE TABLE [dbo].[VendorType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO


TRUNCATE TABLE [VendorType]
GO
INSERT INTO [VendorType]
SELECT 'SuperMarket',1 
UNION ALL SELECT 'electrician',1 
UNION ALL SELECT 'plumber',1 
UNION ALL SELECT 'carpenter',1 
UNION ALL SELECT 'cleaner',1 
UNION ALL SELECT 'security',1 
UNION ALL SELECT 'Laundry',1 
UNION ALL SELECT 'FloorMeal',1
UNION ALL SELECT 'Saloon',1 
UNION ALL SELECT 'BeautyParlor',1 
UNION ALL SELECT 'Medical',1
UNION ALL SELECT 'Car Washing',1 
UNION ALL SELECT 'Painter',1 
UNION ALL SELECT 'Maid',1 
UNION ALL SELECT 'MilkMan',1 
UNION ALL SELECT 'NewsPaper',1 

GO
CREATE TABLE [dbo].[VendorInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[GenderId] int NOT NULL,
	[BadgeNumber] [int] NULL,
	[Wing] [varchar](64) NULL,
	[ShopNumber] [int] NULL,
	[Mobile] [varchar](16) NOT NULL,
	[Phone] [varchar](16) NULL,
	[Email] [varchar](64) NULL,
	[VendorTypeId] [int], --- SuperMarket, electrician, plumber, carpenter, cleaner, security, Laundry, FloorMeal, Saloon, BeautyParlor, Medical, Car Washing, Painter, Maid, MilkMan, NewsPaper, 
	[CreatedDate] datetime NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO

TRUNCATE TABLE [Status]
INSERT INTO [Status]
SELECT 'Pending', 1
UNION ALL SELECT 'Completed', 1
UNION ALL SELECT 'Cancled', 1

GO

CREATE TABLE [dbo].[ServiceRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,  -- UserId from User table
	[RequesterId] [int] NOT NULL,  -- UserId from User table
	[RequestDate] Datetime NOT NULL,
	[StatusId] [int] NULL, -- Pending, Completed, Cancled. 
	[Description] varchar(7000),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[NoticeBoard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedById] [int] NOT NULL,  -- UserId from User table, Only admin can post notice.
	[SocietyId] [int] NOT NULL,
	[Notice] varchar(7000) NOT NULL, 
	[Date] Datetime NOT NULL,
	[Expiry] Datetime NOT NULL,
	[FrequencyId] int null, --- Onetime, daily, Weekly, monthly, Yearly
	[ExecuteOn] varchar(64) null, --- 1-7 for weekly, 1-31 for monthly, exact date and Month for yearly
	[IsPublic] bit not null, -- across societly, across city.
	[IsActive] bit NOT NULL, 
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Forum](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,  
	[Forum] varchar(7000) NOT NULL, 
	[Date] Datetime NOT NULL,
	[IsPublic] bit NOT NULL, -- across societly, across city.
	[IsActive] bit NOT NULL, 
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Poll](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,  
	[Poll] varchar(7000) NOT NULL, 
	[Date] Datetime NOT NULL,
	[Expiry] Datetime NOT NULL,
	[IsPublic] bit not null, -- across societly, across city.
	[Yes] int not null,
	[No] int not null,
	[NoComments] int not null,
	[IsActive] bit NOT NULL, 
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Gallory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] varchar(1000) NOT NULL,
	[UserId] [int] NOT NULL, 
	[Date] Datetime NOT NULL,
	[IsActive] bit NOT NULL, 	
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[GalloryDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GalloryId] int not null,
	[Tag] varchar(255) NOT NULL,
	[Description] varchar(1000) NOT NULL,
	[PhotoUrl] varchar(255) not null,
	[Date] Datetime NOT NULL,
	[IsActive] bit NOT NULL, 	
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO

CREATE TABLE CommentType
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] varchar(256) not null, --- Gallory Commnets, Forum Comments, Poll Comments, Notice Comments, Vendor comments
	[IsActive] Bit not null,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO


CREATE TABLE [Comments]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentTypeId] int not null, --- Gallory Commnets, Forum Comments, Poll Comments, Notice Comments, Vendor comments
	[UserId] int not null,
	[SourceId] int not null, -- Id from GolloryDetailId or Id From NoticeId or Id From PollId, Id From VendorId
	[Date] smalldatetime not null,
	[IsActive] Bit not null,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO



GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_CommentType] FOREIGN KEY([CommentTypeId])
REFERENCES [dbo].[CommentType] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_CommentType]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_User]
GO
ALTER TABLE [dbo].[Forum]  WITH CHECK ADD  CONSTRAINT [FK_Forum_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Forum] CHECK CONSTRAINT [FK_Forum_User]
GO
ALTER TABLE [dbo].[Gallory]  WITH CHECK ADD  CONSTRAINT [FK_Gallory_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Gallory] CHECK CONSTRAINT [FK_Gallory_User]
GO
ALTER TABLE [dbo].[GalloryDetails]  WITH CHECK ADD  CONSTRAINT [FK_GalloryDetails_Gallory] FOREIGN KEY([GalloryId])
REFERENCES [dbo].[Gallory] ([Id])
GO
ALTER TABLE [dbo].[GalloryDetails] CHECK CONSTRAINT [FK_GalloryDetails_Gallory]
GO
ALTER TABLE [dbo].[NoticeBoard]  WITH CHECK ADD  CONSTRAINT [FK_NoticeBoard_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[NoticeBoard] CHECK CONSTRAINT [FK_NoticeBoard_User]
GO
ALTER TABLE [dbo].[Poll]  WITH CHECK ADD  CONSTRAINT [FK_Poll_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Poll] CHECK CONSTRAINT [FK_Poll_User]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_ServiceRequest_Status]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_User_RequesterId] FOREIGN KEY([RequesterId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_ServiceRequest_User_RequesterId]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_User_VendorId] FOREIGN KEY([VendorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_ServiceRequest_User_VendorId]
GO
ALTER TABLE [dbo].[Society]  WITH CHECK ADD  CONSTRAINT [FK_Society_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Society] CHECK CONSTRAINT [FK_Society_City]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserType] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Society] FOREIGN KEY([SocietyId])
REFERENCES [dbo].[Society] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Society]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
ALTER TABLE [dbo].[UserSociety]  WITH CHECK ADD  CONSTRAINT [FK_UserSociety_Society] FOREIGN KEY([SocietyId])
REFERENCES [dbo].[Society] ([Id])
GO
ALTER TABLE [dbo].[UserSociety] CHECK CONSTRAINT [FK_UserSociety_Society]
GO
ALTER TABLE [dbo].[UserSociety]  WITH CHECK ADD  CONSTRAINT [FK_UserSociety_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserSociety] CHECK CONSTRAINT [FK_UserSociety_User]
GO
ALTER TABLE [dbo].[VendorInformation]  WITH CHECK ADD  CONSTRAINT [FK_VendorInformation_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[VendorInformation] CHECK CONSTRAINT [FK_VendorInformation_User]
GO
ALTER TABLE [dbo].[VendorInformation]  WITH CHECK ADD  CONSTRAINT [FK_VendorInformation_VendorType] FOREIGN KEY([VendorTypeId])
REFERENCES [dbo].[VendorType] ([Id])
GO
ALTER TABLE [dbo].[VendorInformation] CHECK CONSTRAINT [FK_VendorInformation_VendorType]
GO



