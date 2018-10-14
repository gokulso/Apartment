USE Apartment
GO

CREATE FUNCTION fnGetUserName (@UserId int)
RETURNS VARCHAR(256)
AS
BEGIN

	RETURN  (
			SELECT Name 
			FROM MemberInformation (NOLOCK)
			WHERE UserId = UserId 
				  AND RelationId = (SELECT Id 
									FROM Relation 
									WHERE Name = 'Self')
			)

END

GO

CREATE PROCEDURE [dbo].[uspGetUserSessionData]
(
	@UserId int 
)
AS
BEGIN
SET NOCOUNT ON

	SELECT 
		s.Id AS SocietyId,
		u.Id AS UserId,
		s.CityId,
		u.UserTypeId
	FROM [dbo].[Society] s (NOLOCK)
	INNER JOIN [dbo].[UserSociety] us (NOLOCK)
		ON (s.Id = us.SocietyId)
	INNER JOIN [dbo].[User] u (NOLOCK)
		ON (us.USerId = u.Id)
	WHERE (us.UserId = @UserId)
		  
SET NOCOUNT OFF
END
 
 GO

 CREATE PROCEDURE [dbo].[uspGetMetaData]
(
	@ObjectName VARCHAR(255)
)
AS 
BEGIN
SET NOCOUNT ON

	DECLARE @strSQL Varchar(1000)
	SET @strSQL = 'SELECT Id, Name FROM ' + @ObjectName
	EXEC (@strSQL)

SET NOCOUNT OFF
END
GO


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


CREATE PROCEDURE [dbo].[uspRegisterSociety]
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
			@RelationId int

	IF EXISTS (SELECT * FROM Society WHERE Name = LTRIM(RTRIM(@Name)) AND CityId = @CityId )
	BEGIN

		SET @Status = 1 --- Society allready exists
		SELECT @Status AS [Status]
		RETURN 

	END

	IF EXISTS (SELECT * FROM [User] WHERE Email = @UserEmail)
	BEGIN

		SET @Status = 2 --- User allready exists
		SELECT @Status AS [Status]
		RETURN 

	END
	
	BEGIN TRY 

		BEGIN TRANSACTION
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
			   ,[IsActive]
			   ,[IsDefault] 
			   )
		 VALUES
			   (@UserId
			   ,@SocietyId
			   ,0
			   ,1
			   )

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

		COMMIT TRANSACTION
		SET @Status = 0
		SELECT @Status AS [Status]

	END TRY 
	BEGIN CATCH 

		SET @Status = 100 -- Some Error 
		SELECT @Status AS [Status]
		
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION

	END CATCH 
		   
SET NOCOUNT OFF
END


go


/*

EXEC uspRegisterSociety 
@Name = 'Rohit',
@Address1 = 'Katraj',
@Address2 = 'dsds',
@CityId = 1,
@Mobile = '1111111111',
@Phone = '123123',
@SocietyEmail = 'a.rajmane@gmail.com',
@Website = 'rrrr.rrrr.rrrr',
@UserEmail = 'a.rajmane@gmail.com',
@Password = 'qw',
@UserTypeId = 1,
@IsOwner = true,
@JoinDate = '2011-03-08',
@InterCom = 1,
@IsStayingHere = true,
@MemberName = 'Ganesh',
@DOB = '2011-03-27',
@GenderId = 1,
@BadgeNumber = 1,
@Wing = '44',
@FlatNumber = 2311,
@MemberMobile = '111111111',
@MemberPhone = '159866666'

*/




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

	SELECT Id,Name 
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

		IF NOT EXISTS (	SELECT * 
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

IF OBJECT_ID('uspGetNoticeType') IS NOT NULL
	DROP PROCEDURE uspGetNoticeType

GO

CREATE PROCEDURE uspGetNoticeType
AS
BEGIN
SET NOCOUNT ON

	SELECT 0 AS Id, 'ALL' AS Name
	UNION ALL
	SELECT Id, Name
	FROM [dbo].[NoticeType] (NOLOCK)
	WHERE IsEnabled = 1

SET NOCOUNT OFF
END

GO

IF OBJECT_ID('uspGetNoticeBoard') IS NOT NULL
	DROP PROCEDURE uspGetNoticeBoard

GO

CREATE PROCEDURE uspGetNoticeBoard
(
	@SocietyId Int,
	@UserId int,
	@NoticeTypeId int = 0,
	@FromDate datetime = null,
	@ToDate datetime = null
)
AS
BEGIN
SET NOCOUNT ON

	SELECT 
		 nb.Id AS NoticeId,
		 nt.Name AS NoticeType,
		 nb.subject,
		 nb.Notice, 
		 nb.Date, 
		 mi.Name AS PostedBy,
		 nb.Expiry,
		 nb.IsPublic, 	
		 CreatedBy = dbo.fnGetUserName (nb.CreatedById),
		 UpdatedBy = dbo.fnGetUserName (nb.UpdatedById)		  
	FROM [dbo].[NoticeBoard] nb (NOLOCK)
	INNER JOIN [MemberInformation] mi (NOLOCK)
		ON (nb.CreatedById = mi.UserId)
	INNER JOIN [NoticeType] nt (NOLOCK)
		ON (nb.NoticeTypeId = nt.Id)
	WHERE nb.SocietyId = @SocietyId
		  AND nb.IsActive = 1
		  AND (@NoticeTypeId = 0 OR nt.Id = @NoticeTypeId)
		  AND (@FromDate IS NULL OR nb.Date >= @FromDate)
		  AND (@ToDate IS NULL OR nb.Date <= @ToDate)
	ORDER BY Date DESC

SET NOCOUNT OFF
END

GO

CREATE PROCEDURE [dbo].[uspInsertNoticeBoard]
(
	@SocietyId Int,
	@UserId int,
	@NoticeTypeId int,
	@Subject varchar(255),
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
		,UpdatedById 
		,SocietyId
		,NoticeTypeId
		,[Subject]
		,Notice
		,Date
		,Expiry
		,FrequencyId
		,ExecuteOn
		,IsPublic
		,IsActive)
	SELECT   @UserId 
			,@UserId
			,@SocietyId
			,@NoticeTypeId
			,@Subject
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

CREATE PROCEDURE [dbo].[uspUpdateNoticeBoard]
(
	@NoticeId Int,
	@UserId int,
	@NoticeTypeId int,
	@Notice varchar(7000),
	@Expiry datetime,
	@FrequencyId int,
	@ExecuteOn varchar(64),
	@IsPublic bit,
	@IsActive bit
)
AS
BEGIN
SET NOCOUNT ON

	UPDATE [dbo].[NoticeBoard]
	SET	 UpdatedById = @UserId 
		,NoticeTypeId = @NoticeTypeId
		,Notice = @Notice
		,Expiry = @Expiry
		,FrequencyId = @FrequencyId
		,ExecuteOn = @ExecuteOn
		,IsPublic = @IsPublic
		,IsActive = @IsActive
	WHERE Id = @NoticeId 

SET NOCOUNT OFF
END

GO

CREATE PROCEDURE [dbo].[uspDeleteNoticeBoard]
(
	@NoticeId Int
)
AS
BEGIN
SET NOCOUNT ON

	-- need to confirm on hard or soft delete

	DELETE [dbo].[NoticeBoard]
	WHERE Id = @NoticeId 

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


CREATE PROCEDURE [dbo].[uspInsertComplaint]
(
	@SocietyId Int,
	@UserId int,
	@Subject varchar(255),
	@Description nvarchar(4000),
	@AssignedToVendtorTypeId int
)
AS
BEGIN
SET NOCOUNT ON

	DECLARE @ComplaintId int

	BEGIN TRY

		INSERT INTO Complaint 
		(
			CreatedById,
			SocietyId,
			Subject,
			CreatedDate,
			AssignedToVendtorTypeId,
			Status
		)
		SELECT 
			@UserId,
			@SocietyId,
			@Subject,
			GETDATE(),
			@AssignedToVendtorTypeId,
			1

		SET @ComplaintId = SCOPE_IDENTITY()

		INSERT INTO ComplaintDetail 
		(
			ComplaintId,
			CreatedById,
			Description,
			CommentDate		
		)
		SELECT 
			@ComplaintId,
			@UserId,
			@Description,
			GETDATE()

		SELECT @ComplaintId AS ComplaintId
		
	END TRY
	BEGIN CATCH

		SELECT -1 AS ComplaintId

	END CATCH 
	
SET NOCOUNT OFF
END



CREATE PROCEDURE uspGetComplaints
(
	@SocietyId Int,
	@UserId int
)
AS
BEGIN
SET NOCOUNT ON

	SELECT 
		[dbo].[fnGetUserName] (CreatedById),
		CASE WHEN CreatedById = @UserId THEN 1 ELSE 0 END AS IsComplaintOwner,
		Subject,
		Description,
		CreatedDate,
		ISNULL(vt.Name, 'Admin') AS AssignedTo,
		Status
	FROM Complaint c (NOLOCK)
	LEFT JOIN VendorType vt (NOLOCK)
		ON (c.AssignedToVendtorTypeId = vt.Id)
	WHERE SocietyId = @SocietyId

SET NOCOUNT OFF
END

GO

CREATE PROCEDURE uspCloseComplaint
(
	@SocietyId Int,
	@UserId int
)
AS
BEGIN
SET NOCOUNT ON

	UPDATE Complaint
	SET Status = 0 
	WHERE CreatedById = @UserId
		  AND SocietyId = @SocietyId
	
SET NOCOUNT OFF
END

GO

CREATE PROCEDURE uspGetVendorList
(
	@SocietyId int
)
AS
BEGIN
SET NOCOUNT ON

	SELECT 
		vi.Id,
		vi.Name,
		g.Name AS Gender,
		vi.BadgeNumber,
		vi.Wing,
		vi.ShopNumber,
		vi.Mobile,
		vi.Phone,
		vi.Email,
		vt.Name AS VendorType,
		vi.CreatedDate,
		vi.IsActive
	FROM [dbo].[VendorInformation] vi (NOLOCK)
	INNER JOIN [dbo].[Society] s (NOLOCK)
		ON (vi.SocietyId = s.Id)
	INNER JOIN VendorType vt (NOLOCK)
		ON (vi.VendorTypeId = vt.Id)
	INNER JOIN Gender g (NOLOCK)
		ON (vi.GenderId = g.Id)
	WHERE s.Id = @SocietyId

SET NOCOUNT OFF
END

GO

CREATE PROCEDURE uspAddVendor
(
@SocietyId int,
@Name varchar(255),
@GenderId int, 
@BadgeNumber int,
@Wing varchar(64),
@ShopNumber int,
@Mobile varchar(16),
@Phone varchar(16), 
@Email varchar(64),
@VendorTypeId int
)
AS
BEGIN
SET NOCOUNT ON

	INSERT INTO [dbo].[VendorInformation] 
	(
		UserId,
		SocietyId,
		Name,
		GenderId,
		BadgeNumber,
		Wing,
		ShopNumber,
		Mobile,
		Phone,
		Email,
		VendorTypeId,
		CreatedDate,
		IsActive
	)
	SELECT 
		0, -- currently non user members are added by admin
		@SocietyId,
		@Name,
		@GenderId,
		@BadgeNumber,
		@Wing,
		@ShopNumber,
		@Mobile,
		@Phone,
		@Email,
		@VendorTypeId,
		GETDATE() AS CreatedDate,
		1 AS IsActive
		
SET NOCOUNT OFF
END

GO

CREATE PROCEDURE uspUpdateVendor
(
	@Id int,
	@SocietyId int,
	@Name varchar(255),
	@GenderId int, 
	@BadgeNumber int,
	@Wing varchar(64),
	@ShopNumber int,
	@Mobile varchar(16),
	@Phone varchar(16), 
	@Email varchar(64),
	@VendorTypeId int
)
AS
BEGIN
SET NOCOUNT ON

	UPDATE [dbo].[VendorInformation] 
	SET
		Name = @Name,
		GenderId = @GenderId,
		BadgeNumber = @BadgeNumber,
		Wing = @Wing,
		ShopNumber = @ShopNumber,
		Mobile = @Mobile,
		Phone = @Phone,
		Email = @Email,
		VendorTypeId = @VendorTypeId
	WHERE Id = @Id
		
SET NOCOUNT OFF
END

GO

CREATE PROCEDURE uspDeleteVendor
(
	@Id int
)
AS
BEGIN
SET NOCOUNT ON

	UPDATE [dbo].[VendorInformation] 
	SET IsActive = 0 
	WHERE Id = @Id
		
SET NOCOUNT OFF
END

GO


CREATE PROCEDURE uspGetSocietyList
(
	@UserId int = 0, -- UserId would be zero if we get list of society for within given city
	@CityId int = 0 -- CityId would be zero if we want to get society list for logged user
)
AS
BEGIN
SET NOCOUNT ON

	SELECT 
		s.Id,
		s.Name,
		s.Address1,
		s.Address2,
		c.Name AS City,
		s.Mobile,
		s.Phone,
		s.Email,
		s.Website,
		s.CreatedDate,
		us.IsDefault,
		s.IsActive
	FROM [dbo].[Society] s (NOLOCK)
	INNER JOIN [dbo].[UserSociety] us (NOLOCK)
		ON (s.Id = us.SocietyId)
	INNER JOIN [dbo].[City] c (NOLOCK)
		ON (s.CityId = c.Id)
	WHERE (@UserId = 0 OR us.UserId = @UserId)
		  AND (@CityId = 0 OR c.Id = @CityId)
	
SET NOCOUNT OFF
END

GO


