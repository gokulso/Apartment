CREATE FUNCTION [dbo].[Split]
(   
    @InputString VARCHAR (MAX), 
    @Delimiter VARCHAR (10)
)
RETURNS @TempTable TABLE ([Id] INT IDENTITY (1, 1) NOT NULL,
                          [Values] VARCHAR (8000) NULL)
AS
BEGIN
 
    DECLARE  @Length INT
            ,@Index INT
            ,@LastIndex INT
            ,@Counter INT
 
    SET @InputString = @InputString + @Delimiter
    SET @Length = len(@InputString)
    SET @Index = 1
    SET @Counter = 1
 
    WHILE (@Counter < @Length)
    BEGIN
 
        IF charindex(@Delimiter, @InputString, @Index) > 0 
        BEGIN
 
            SET @lastIndex = charindex(@Delimiter, @InputString, @Index) - @Index
 
            INSERT INTO @TempTable ([Values]) 
            SELECT substring(@InputString, @Index, @LastIndex)
 
            SET @Index = charindex(@Delimiter, @InputString, @Index) + len(@Delimiter)
 
        END
 
        SET @Counter = @Counter + 1
 
    END
 
RETURN
END
 
GO


CREATE PROCEDURE uspRegisterSociety
(
--Society Variables
	@Name Varchar(256), 
	@Address1 Varchar(256), 
	@Address2 Varchar(256), 
	@CityId int, 
	@Mobile Varchar(16), 
	@Phone Varchar(16), 
	@SocietyEmail Varchar(64), 
	@Website Varchar(256),

--Users Variables
	@UserEmail Varchar(64), 
	@Password Varchar(64), 
	@UserTypeId int, 
	@IsOwner bit, 
	@JoinDate datetime, 
	@InterCom int, 
	@IsStayingHere bit,

--Member Variables 
	@MemberName Varchar(256),
	@DOB datetime, 
	@GenderId int,
	@BadgeNumber int, 
	@Wing  Varchar(64), 
	@FlatNumber int, 
	@MemberMobile Varchar(16), 
	@MemberPhone Varchar(16)
)
AS
BEGIN
SET NOCOUNT ON 

	DECLARE @Status int = 0,
			@SocietyId int,
			@UserId int,
			@RoleId int,
			@RelationId int,
			@MemberId int = 0

	IF EXISTS (SELECT * FROM Society WHERE Email = @SocietyEmail )
	BEGIN

		SET @Status = 1 --- Society allready exists
		SELECT @Status AS [Status], @SocietyId AS SocietyId, @UserId AS UserId, @MemberId AS MemberId --- Society allready exists
		RETURN 

	END

	IF EXISTS (SELECT * FROM [User] WHERE Email = @UserEmail)
	BEGIN

		SET @Status = 2 --- User allready exists
		SELECT @Status AS [Status], @SocietyId AS SocietyId, @UserId AS UserId, @MemberId AS MemberId --- User allready exists
		RETURN 

	END


	BEGIN TRY 

		-- Insert Society 

		INSERT INTO [dbo].[Society]
			   ([Name]
			   ,[Address1]
			   ,[Address2]
			   ,[CityId]
			   ,[Mobile]
			   ,[Phone]
			   ,[Email]
			   ,[Website]
			   ,[CreatedDate]
			   ,[IsActive])
		 VALUES
			   (@Name
			   ,@Address1
			   ,@Address2 
			   ,@CityId
			   ,@Mobile
			   ,@Phone
			   ,@SocietyEmail
			   ,@Website
			   ,GETDATE()
			   ,0)

		SET @SocietyId = SCOPE_IDENTITY() 

		INSERT INTO [dbo].[User]
			   ([Email]
			   ,[Password]
			   ,[UserTypeId]
			   ,[IsOwner]
			   ,[JoinDate]
			   ,[InterCom]
			   ,[IsStayingHere]
			   ,[IsActive])
		 VALUES
			   (@UserEmail
			   ,@Password
			   ,@UserTypeId
			   ,@IsOwner
			   ,@JoinDate
			   ,@InterCom
			   ,@IsStayingHere
			   ,0)

		SET @UserId = SCOPE_IDENTITY()
	
		INSERT INTO [dbo].[UserSociety]
			   ([UserId]
			   ,[SocietyId]
			   ,[IsActive])
		 VALUES
			   (@UserId
			   ,@SocietyId
			   ,0)

		SELECT @RoleId = Id 
		FROM Role 
		WHERE Name = 'Admin'
	
		INSERT INTO [UserRole]
			   ([UserId]
			   ,[SocietyId]
			   ,[RoleId]
			   ,[IsActive])
		 VALUES
			   (@UserId
			   ,@SocietyId
			   ,@RoleId
			   ,0)
			   
		SELECT @RelationId = Id 
		FROM Relation 
		WHERE Name = 'Self'

		INSERT INTO [dbo].[MemberInformation]
			   ([UserId]
			   ,[RelationId]
			   ,[Name]
			   ,[DOB]
			   ,[GenderId] 
			   ,[BadgeNumber]
			   ,[Wing]
			   ,[FlatNumber]
			   ,[Mobile]
			   ,[Phone]
			   ,[Email]
			   ,[CreatedDate] 
			   ,[IsActive])
		 VALUES
			   (@UserId
			   ,@RelationId
			   ,@MemberName 
			   ,@DOB
			   ,@GenderId 
			   ,@BadgeNumber
			   ,@Wing
			   ,@FlatNumber
			   ,@MemberMobile 
			   ,@MemberPhone 
			   ,@UserEmail 
			   ,GETDATE()
			   ,0)

		SET @Status = 0
		SELECT @Status AS [Status], @SocietyId AS SocietyId, @UserId AS UserId, @MemberId AS MemberId

	END TRY 
	BEGIN CATCH 

		SET @Status = 100 -- Some Error 
		SELECT @Status AS [Status], @SocietyId AS SocietyId, @UserId AS UserId, @MemberId AS MemberId

	END CATCH 
		   
SET NOCOUNT OFF
END


GO

IF OBJECT_ID('uspGetCountry') IS NOT NULL
	DROP PROCEDURE uspGetCountry

GO

CREATE PROCEDURE uspGetCountry 
AS
BEGIN
SET NOCOUNT ON

	SELECT Name 
	FROM Country (NOLOCK)
	WHERE IsEnabled = 1

SET NOCOUNT OFF
END

GO

IF OBJECT_ID('uspGetState') IS NOT NULL
	DROP PROCEDURE uspGetState

GO

CREATE PROCEDURE uspGetState
(
	@CountryId int = 0
)
AS
BEGIN
SET NOCOUNT ON

	SELECT Name 
	FROM State (NOLOCK)
	WHERE (@CountryId = 0 OR CountryId = @CountryId)
		   AND IsEnabled = 1

SET NOCOUNT OFF
END

GO

IF OBJECT_ID('uspGetCity') IS NOT NULL
	DROP PROCEDURE uspGetCity

GO

CREATE PROCEDURE uspGetCity
(
	@StateId int = 0
)
AS
BEGIN
SET NOCOUNT ON

	SELECT Name 
	FROM City (NOLOCK)
	WHERE (@StateId = 0 OR StateId = @StateId)
		   AND IsEnabled = 1

SET NOCOUNT OFF
END

GO

IF OBJECT_ID('uspGetRelation') IS NOT NULL
	DROP PROCEDURE uspGetRelation

GO

CREATE PROCEDURE uspGetRelation
AS
BEGIN
SET NOCOUNT ON

	SELECT Name 
	FROM Relation (NOLOCK)
	WHERE IsActive = 1

SET NOCOUNT OFF
END

GO

IF OBJECT_ID('uspAddMembers') IS NOT NULL
	DROP PROCEDURE uspAddMembers

GO

CREATE PROCEDURE uspAddMembers
(
	@UserId int,
	@SocietyId int,
	@RelationId int,
	@Name Varchar(256),
	@DOB datetime, 
	@GenderId int,
	@BadgeNumber int, 
	@Wing Varchar(64), 
	@FlatNumber int, 
	@Mobile Varchar(16), 
	@Phone Varchar(16),
	@Email Varchar(64)

)
AS
BEGIN
SET NOCOUNT ON

	DECLARE @Status int = 0 

	IF EXISTS (	SELECT * 
				FROM [dbo].[MemberInformation] 
				WHERE UserId = @UserId
					  AND Name = @Name	)
	BEGIN

		SET @Status = 1 --- Member allready exists
		SELECT @Status AS [Status]
		RETURN 

	END	

	INSERT INTO [dbo].[MemberInformation]
           ([UserId]
           ,[RelationId]
           ,[Name]
           ,[DOB]
		   ,[GenderId]
           ,[BadgeNumber]
           ,[Wing]
           ,[FlatNumber]
           ,[Mobile]
           ,[Phone]
           ,[Email]
		   ,[CreatedDate] 
           ,[IsActive])
     VALUES
           (@UserId
           ,@RelationId
           ,@Name
           ,@DOB
		   ,@GenderId
           ,@BadgeNumber
           ,@Wing
           ,@FlatNumber
           ,@Mobile
           ,@Phone
           ,@Email
		   ,GETDATE()
           ,1)

	SET @Status = 0 --- Member added successfully
	SELECT @Status AS [Status]

SET NOCOUNT OFF
END

GO

CREATE PROCEDURE uspAddUser
(
	@SocietyId int,

	--Users Variables
	@Email Varchar(64), 
	@Password Varchar(64), 
	@UserTypeId int, 
	@IsOwner bit, 
	@JoinDate datetime, 
	@InterCom int, 
	@IsStayingHere bit,

	-- Member variables
	@Name Varchar(256),
	@DOB datetime, 
	@BadgeNumber int, 
	@Wing Varchar(64), 
	@FlatNumber int, 
	@Mobile Varchar(16), 
	@Phone Varchar(16),
	@GenderId int,

	@RoleId varchar(1000)

)
AS
BEGIN
SET NOCOUNT ON

	DECLARE @Status int = 0,
			@UserId int = 0,
			@RelationId int = 0 

	IF EXISTS (	SELECT * 
				FROM [dbo].[User] u
				INNER JOIN [dbo].[UserSociety] us 
					ON (u.Id = us.UserId)
				WHERE us.SocietyId = @SocietyId 
					  AND u.Email = @Email )
	BEGIN

		SET @Status = 1 --- User allready exists for society
		SELECT @Status AS [Status]
		RETURN 

	END	

	IF NOT EXISTS (	SELECT * 
					FROM [dbo].[User] 
					WHERE Email = @Email )
	BEGIN

		INSERT INTO [dbo].[User]
			   ([Email]
			   ,[Password]
			   ,[UserTypeId]
			   ,[IsOwner]
			   ,[JoinDate]
			   ,[InterCom]
			   ,[IsStayingHere]
			   ,[IsActive])
		 VALUES
			   (@Email
			   ,@Password
			   ,@UserTypeId
			   ,@IsOwner
			   ,@JoinDate
			   ,@InterCom
			   ,@IsStayingHere
			   ,1)
		
		SET @UserId = SCOPE_IDENTITY()

		IF NOT EXISTS (	SELECT *
						FROM [dbo].[UserSociety]
						WHERE UserId = @UserId 
							  AND SocietyId = @SocietyId )
		BEGIN
									  	
			INSERT INTO [dbo].[UserSociety]
				   ([UserId]
				   ,[SocietyId]
				   ,[IsActive])
			 VALUES
				   (@UserId
				   ,@SocietyId
				   ,1)
		END

		-- Add comma seperated roles
		INSERT INTO [UserRole]
			   ([UserId]
			   ,[SocietyId]
			   ,[RoleId]
			   ,[IsActive])
		SELECT @UserId, @SocietyId, [Values] AS RoleId, 1
		FROM [dbo].[Split] (@RoleId, ',')
			   
		SELECT @RelationId = Id 
		FROM Relation 
		WHERE Name = 'Self'

		IF EXISTS (	SELECT * 
					FROM [dbo].[MemberInformation] 
					WHERE UserId = @UserId)
		BEGIN

			INSERT INTO [dbo].[MemberInformation]
					([UserId]
					,[RelationId]
					,[Name]
					,[DOB]
					,[GenderId]
					,[BadgeNumber]
					,[Wing]
					,[FlatNumber]
					,[Mobile]
					,[Phone]
					,[Email]
					,[CreatedDate] 
					,[IsActive])
				VALUES
					(@UserId
					,@RelationId
					,@Name
					,@DOB
					,@GenderId 
					,@BadgeNumber
					,@Wing
					,@FlatNumber
					,@Mobile
					,@Phone
					,@Email
					,GETDATE()
					,1)
		END	

	END

	SET @Status = 0 --- User added successfully
	SELECT @Status AS [Status]

SET NOCOUNT OFF
END

GO

CREATE PROCEDURE uspGetMemberInformation
(
	@SocietyId Int,
	@UserId int
)
AS
BEGIN
SET NOCOUNT ON

	DECLARE @RelationId int

	SELECT @RelationId = Id 
	FROM Relation 
	WHERE Name = 'Self'

	SELECT 
		 mi.Name
		,mi.DOB
		,mi.BadgeNumber
		,mi.Wing
		,mi.FlatNumber
		,mi.Mobile
		,mi.Phone
		,mi.Email
		,g.Name AS Gender
		,mi.CreatedDate
		,mi.IsActive
	FROM MemberInformation mi (NOLOCK)
	INNER JOIN UserSociety us (NOLOCK)
		ON (mi.UserId = us.UserId)
	INNER JOIN Gender g (NOLOCK)
		ON (mi.GenderId = g.Id)
	WHERE mi.UserId = @UserId
		  AND us.SocietyId = @SocietyId
		  AND mi.RelationId = @RelationId 

SET NOCOUNT OFF
END

GO

CREATE PROCEDURE uspGetResidents
(
	@SocietyId Int,
	@UserId int
)
AS
BEGIN
SET NOCOUNT ON

	DECLARE @RelationId int

	SELECT @RelationId = Id 
	FROM Relation 
	WHERE Name = 'Self'

	SELECT 
		 mi.Name
		,mi.Wing
		,mi.FlatNumber
		,mi.Phone
		,u.InterCom
		,u.IsStayingHere
		,g.Name AS Gender
		,mi.CreatedDate
		,mi.IsActive
	FROM MemberInformation mi (NOLOCK)
	INNER JOIN UserSociety us (NOLOCK)
		ON (mi.UserId = us.UserId)
	INNER JOIN [User] u (NOLOCK)
		ON (us.UserId = u.Id)
	INNER JOIN Gender g (NOLOCK)
		ON (mi.GenderId = g.Id)
	WHERE us.SocietyId = @SocietyId
		  AND mi.RelationId = @RelationId 

SET NOCOUNT OFF
END

GO

CREATE PROCEDURE uspGetVendors
(
	@SocietyId Int,
	@UserId int
)
AS
BEGIN
SET NOCOUNT ON

	DECLARE @RelationId int

	SELECT @RelationId = Id 
	FROM Relation 
	WHERE Name = 'Self'

	SELECT 
		 vi.Name
		,vi.Wing
		,vi.ShopNumber
		,vi.Mobile
		,vi.Phone
		,vi.Email
		,g.Name AS Gender
		,vi.IsActive
	FROM [dbo].[VendorInformation] vi (NOLOCK)
	INNER JOIN [VendorType] vt (NOLOCK)
		ON (vi.VendorTypeId = vt.Id)
	INNER JOIN UserSociety us (NOLOCK)
		ON (vi.UserId = us.UserId)
	INNER JOIN Gender g (NOLOCK)
		ON (vi.GenderId = g.Id)
	WHERE us.SocietyId = @SocietyId

SET NOCOUNT OFF
END

GO

IF OBJECT_ID('uspGetNoticeBoard') IS NOT NULL
	DROP PROCEDURE uspGetNoticeBoard

GO

CREATE PROCEDURE uspGetNoticeBoard
(
	@SocietyId Int,
	@UserId int
)
AS
BEGIN
SET NOCOUNT ON

	DECLARE @RelationId int

	SELECT @RelationId = Id 
	FROM Relation 
	WHERE Name = 'Self'

	SELECT TOP 5
		 nb.Notice, 
		 nb.Date, 
		 mi.Name AS PostedBy,
		 nb.Expiry,
		 nb.IsPublic 		 
	FROM [dbo].[NoticeBoard] nb (NOLOCK)
	INNER JOIN [MemberInformation] mi (NOLOCK)
		ON (nb.CreatedById = mi.UserId)
	WHERE nb.SocietyId = @SocietyId
		  AND nb.IsActive = 1
	ORDER BY Date DESC

SET NOCOUNT OFF
END

GO

CREATE PROCEDURE [dbo].[uspInsertNoticeBoard]
(
	@SocietyId Int,
	@UserId int,
	@Notice varchar(7000),
	@Expiry datetime,
	@FrequencyId int,
	@ExecuteOn	varchar(64),
	@IsPublic bit,
	@IsActive bit
)
AS
BEGIN
SET NOCOUNT ON
	

	INSERT INTO [dbo].[NoticeBoard]
		(CreatedById
		,SocietyId
		,Notice
		,Date
		,Expiry
		,FrequencyId
		,ExecuteOn
		,IsPublic
		,IsActive)
	SELECT   @UserId 
			,@SocietyId
			,@Notice
			,GETDATE()
			,@Expiry
			,@FrequencyId
			,@ExecuteOn
			,@IsPublic
			,@IsActive

SET NOCOUNT OFF
END


GO

CREATE PROCEDURE uspGetForum
(
	@SocietyId Int,
	@UserId int
)
AS
BEGIN
SET NOCOUNT ON

	DECLARE @RelationId int

	SELECT @RelationId = Id 
	FROM Relation 
	WHERE Name = 'Self'

	SELECT TOP 5
		  f.Forum
		 ,f.Date
	FROM [dbo].[Forum] f (NOLOCK)
	INNER JOIN UserSociety us (NOLOCK)
		ON (f.UserId = us.UserId)
	WHERE us.SocietyId = @SocietyId
		  AND f.IsActive = 1
	ORDER BY Date DESC

SET NOCOUNT OFF
END

GO

