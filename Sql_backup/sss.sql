USE [master]
GO
/****** Object:  Database [NTILU]    Script Date: 11/26/2015 13:44:56 ******/
CREATE DATABASE [NTILU] ON  PRIMARY 
( NAME = N'NTILU', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\NTILU.mdf' , SIZE = 242688KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NTILU_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\NTILU_log.ldf' , SIZE = 102144KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NTILU] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NTILU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NTILU] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [NTILU] SET ANSI_NULLS OFF
GO
ALTER DATABASE [NTILU] SET ANSI_PADDING OFF
GO
ALTER DATABASE [NTILU] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [NTILU] SET ARITHABORT OFF
GO
ALTER DATABASE [NTILU] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [NTILU] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [NTILU] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [NTILU] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [NTILU] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [NTILU] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [NTILU] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [NTILU] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [NTILU] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [NTILU] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [NTILU] SET  DISABLE_BROKER
GO
ALTER DATABASE [NTILU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [NTILU] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [NTILU] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [NTILU] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [NTILU] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [NTILU] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [NTILU] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [NTILU] SET  READ_WRITE
GO
ALTER DATABASE [NTILU] SET RECOVERY SIMPLE
GO
ALTER DATABASE [NTILU] SET  MULTI_USER
GO
ALTER DATABASE [NTILU] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [NTILU] SET DB_CHAINING OFF
GO
USE [NTILU]
GO
/****** Object:  Schema [Setup]    Script Date: 11/26/2015 13:44:56 ******/
CREATE SCHEMA [Setup] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [Membership]    Script Date: 11/26/2015 13:44:56 ******/
CREATE SCHEMA [Membership] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [Administartion]    Script Date: 11/26/2015 13:44:56 ******/
CREATE SCHEMA [Administartion] AUTHORIZATION [dbo]
GO
/****** Object:  Table [Setup].[Zone]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Setup].[Zone](
	[ZoneID] [int] IDENTITY(1,1) NOT NULL,
	[Zone] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZoneID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Membership].[Voucher]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Membership].[Voucher](
	[VoucherID] [bigint] IDENTITY(1,1) NOT NULL,
	[Amount] [nvarchar](50) NULL,
	[VoucherDate] [nvarchar](50) NULL,
	[VoucherNo] [nvarchar](50) NULL,
	[Narration] [nvarchar](max) NULL,
	[Purpose] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UserID] [nvarchar](50) NULL,
	[District] [nvarchar](50) NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Setup].[Post]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Setup].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[PostName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Setup].[MemberType]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Setup].[MemberType](
	[MemberTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MemberTypeName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_MemberType] PRIMARY KEY CLUSTERED 
(
	[MemberTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Membership].[Membership]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Membership].[Membership](
	[MembershipID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Zone] [nvarchar](50) NULL,
	[District] [nvarchar](50) NULL,
	[VDC] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[DateofBirth] [date] NULL,
	[CurrentCity] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[FatherName] [nvarchar](50) NULL,
	[MotherName] [nvarchar](50) NULL,
	[CitizenShipNO] [nvarchar](50) NULL,
	[LicenseNo] [nvarchar](50) NULL,
	[LicenseType] [nvarchar](50) NULL,
	[MembershipDate] [date] NULL,
	[ValidDate] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[Post] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Photo] [nvarchar](100) NULL,
	[Education] [nvarchar](50) NULL,
	[IsVerified] [bit] NULL,
	[UserDistrict] [nvarchar](50) NULL,
	[AttachedFile] [nchar](500) NULL,
	[Symbol] [nvarchar](50) NULL,
	[MembershipNo] [nvarchar](50) NULL,
	[NameInEnglish] [nvarchar](150) NULL,
 CONSTRAINT [PK__Membersh__92A7859903317E3D] PRIMARY KEY CLUSTERED 
(
	[MembershipID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Administartion].[LoginUser]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Administartion].[LoginUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](50) NULL,
	[UserAddress] [nvarchar](50) NULL,
	[UserDistrict] [nvarchar](50) NULL,
	[UserMobile] [nvarchar](50) NULL,
	[UserPost] [nvarchar](50) NULL,
	[UserRole] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](50) NULL,
	[UserPhoto] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[TimeStamp] [timestamp] NULL,
	[Isactive] [bit] NULL,
	[UserCentral] [bit] NULL,
 CONSTRAINT [PK__LoginUSe__1788CCAC37A5467C] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Setup].[License]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Setup].[License](
	[LicenseID] [int] IDENTITY(1,1) NOT NULL,
	[License] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_License] PRIMARY KEY CLUSTERED 
(
	[LicenseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Setup].[Education]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Setup].[Education](
	[EducationID] [int] IDENTITY(1,1) NOT NULL,
	[EducationName] [nvarchar](50) NULL,
	[EducationDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Education] PRIMARY KEY CLUSTERED 
(
	[EducationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Setup].[District]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Setup].[District](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[District] [nvarchar](50) NOT NULL,
	[ZoneID] [int] NULL,
 CONSTRAINT [PK__District__85FDA4A629572725] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDistrict1]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDistrict1](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](50) NULL,
	[UserAddress] [nvarchar](50) NULL,
	[UserDistrict] [nvarchar](50) NULL,
	[UserMobile] [nvarchar](50) NULL,
	[UserPost] [nvarchar](50) NULL,
	[UserRole] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](50) NULL,
	[UserPhoto] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[TimeStamp] [timestamp] NULL,
	[Isactive] [bit] NULL,
	[UserCentral] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDistrict]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDistrict](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](50) NULL,
	[UserAddress] [nvarchar](50) NULL,
	[UserDistrict] [nvarchar](50) NULL,
	[UserMobile] [nvarchar](50) NULL,
	[UserPost] [nvarchar](50) NULL,
	[UserRole] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](50) NULL,
	[UserPhoto] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[TimeStamp] [timestamp] NULL,
	[Isactive] [bit] NULL,
	[UserCentral] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Setup].[Unit]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Setup].[Unit](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [bigint] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Membership].[RenewMembership]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Membership].[RenewMembership](
	[RenewID] [int] IDENTITY(1,1) NOT NULL,
	[MembershipID] [int] NULL,
	[RenewDate] [date] NULL,
	[Amount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[RenewID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Setup].[VDC]    Script Date: 11/26/2015 13:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Setup].[VDC](
	[VdcID] [int] IDENTITY(1,1) NOT NULL,
	[VDC] [nvarchar](50) NOT NULL,
	[ZoneID] [int] NULL,
	[DistrictID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VdcID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [Membership].[VarificationSearch]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Membership].[VarificationSearch]
  @SearchText	NVARCHAR(50)=NULL,
  @DateFrom		date=NULL,
  @DateTo		date=NULL,
  @UserDistrict NVARCHAR (50) = NULL,
  @UserID		bit = NULL,
  @Flag			CHAR(1)
  
  
	AS
		if @Flag='s'
			BEGIN
			if @UserDistrict='76'
			begin
				SELECT mm.MembershipID,mm.Name,z.Zone,d.District,mm.VDC,mm.City,mm.DateofBirth,mm.CurrentCity,mm.Gender,mm.FatherName,mm.MotherName,mm.CitizenShipNO,mm.LicenseNo,mm.MembershipDate,mm.ValidDate,u.UnitName,p.PostName,mm.Email,mm.Phone,mm.Mobile,mm.Photo
,
e.EducationName
				FROM Membership.Membership mm 
				INNER JOIN Setup.Zone z ON mm.Zone=z.ZoneID 
				INNER JOIN Setup.District d ON mm.District=d.DistrictID 
				LEFT JOIN Setup.Unit u ON mm.Unit = u.UnitID 
				LEFT JOIN Setup.Post p ON mm.Post=p.PostID 
				LEFT JOIN Setup.Education e ON mm.Education = e.EducationID
				WHERE   (mm.IsVerified is null or IsVerified='1') AND convert(date, mm.MembershipDate)  BETWEEN convert(date,@DateFrom)  and convert(date,@DateTo) ;
				end
				ELSE
				BEGIN
				SELECT mm.MembershipID,mm.Name,z.Zone,d.District,mm.VDC,mm.City,mm.DateofBirth,mm.CurrentCity,mm.Gender,mm.FatherName,mm.MotherName,mm.CitizenShipNO,mm.LicenseNo,mm.MembershipDate,mm.ValidDate,u.UnitName,p.PostName,mm.Email,mm.Phone,mm.Mobile,mm.Photo,e.EducationName
				FROM Membership.Membership mm 
				INNER JOIN Setup.Zone z ON mm.Zone=z.ZoneID 
				INNER JOIN Setup.District d ON mm.District=d.DistrictID 
				LEFT JOIN Setup.Unit u ON mm.Unit = u.UnitID 
				LEFT JOIN Setup.Post p ON mm.Post=p.PostID 
				LEFT JOIN Setup.Education e ON mm.Education = e.EducationID
				WHERE (mm.IsVerified is null or IsVerified='false') AND convert(date, mm.MembershipDate) BETWEEN convert(date,@DateFrom) and convert(date,@DateTo);
				END
			END
			
			
			--[Membership].[VarificationSearch]
			
		--exec 	[Membership].[VarificationSearch] @Datefrom='1993-01-01', @Dateto='1993-12-01',@Flag='s',@UserDistrict='76'


--select * from Membership.Membership where convert(date,membershipDate) BETWEEN '1993-01-01' and '1993-01-01'

--select * from Membership.Membership where membershipdate ='01-01-1993'


--	SELECT * FROM Membership.Membership mm 
--				INNER JOIN Setup.Zone z ON mm.Zone=z.ZoneID 
--				INNER JOIN Setup.District d ON mm.District=d.DistrictID 
--				INNER JOIN Setup.Unit u ON mm.Unit = u.UnitID 
--				INNER JOIN Setup.Post p ON mm.Post=p.PostID 
--				INNER JOIN Setup.Education e ON mm.Education = e.EducationID
GO
/****** Object:  StoredProcedure [dbo].[uspRole]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspRole] 
	@RoleID				 int=NULL,
	@Role				nvarchar(50) =NULL,
    
    @Flag char(1) 
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	
	
	if @flag='i'
	begin
	BEGIN TRAN
	
			INSERT INTO dbo.Role([Role])
			SELECT  @Role
	
	Select 1 ErrorCode, 'Record Successfully Inserted' mes, scope_Identity() id              
	COMMIT
	end
	
	if @flag='s'
	
		BEGIN
				BEGIN TRAN
					--SELECT * FROM [dbo].[Role]   
					--WHERE @RoleID = RoleID
					--COMMIT
					--SELECT 1 ErroCode, @@rowcount mes, @RoleID id
					
					SELECT [RoleID], [Role] FROM   [dbo].[Role]   
					WHERE ([RoleID] =@RoleID  OR @RoleID   IS NULL) 
					COMMIT
					SELECT 1 ErroCode, @@rowcount mes, @RoleID id
			
				END
GO
/****** Object:  StoredProcedure [Membership].[uspAggregate]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Membership].[uspAggregate]
  @Flag char(50),
  @SearchText NVARCHAR(50)=NULL,
  @UserDistrict NVARCHAR (50) = NULL,
  @District NVARCHAR (50) = NULL,
  @Gender NVARCHAR (50)= NULL,
  @MembershipYear NVARCHAR (50) = NULL,
  @LicenseType NVARCHAR (50) = NULL,
  @Education NVARCHAR (50) = NULL,
  @Zone NVARCHAR (50) = NULL

  
AS
BEGIN

IF(@Flag='Name')

BEGIN
	if @UserDistrict=76
		begin
			Select  [MembershipID],[Name],[Zone],d.District as [DistrictName],[VDC],[City],[DateofBirth],[CurrentCity],[Gender],[FatherName],[MotherName],[CitizenShipNO],[LicenseNo],[LicenseType],[MembershipDate],[ValidDate],[Unit],p.PostName,[Email],[Phone],[Mobile],[Photo],[Education],[IsVerified],[UserDistrict],[AttachedFile],[Symbol] 
			from Membership.Membership mm INNER JOIN Setup.Post p 
			on mm.Post=p.PostID INNER JOIN Setup.District d
			on mm.District=d.DistrictID
			where Name like @SearchText + '%'
		END
	ELSE
		BEGIN
			Select  [MembershipID],[Name],[Zone],d.District as [DistrictName],[VDC],[City],[DateofBirth],[CurrentCity],[Gender],[FatherName],[MotherName],[CitizenShipNO],[LicenseNo],[LicenseType],[MembershipDate],[ValidDate],[Unit],p.PostName,[Email],[Phone],[Mobile],[Photo],[Education],[IsVerified],[UserDistrict],[AttachedFile],[Symbol] 
			from Membership.Membership mm INNER JOIN Setup.Post p 
			on mm.Post=p.PostID INNER JOIN Setup.District d
			on mm.District=d.DistrictID
			where Name like @SearchText + '%'  and (mm.UserDistrict=@UserDistrict )
		END
		
		

END



IF(@Flag='Mobile')

BEGIN
Select *
from Membership.Membership mm
where  Mobile LIKE @SearchText + '%' 
END
end
IF(@Flag='CitizenShipNo')

BEGIN
Select *
from Membership.Membership mm
where  CitizenShipNo LIKE @SearchText + '%' 
END

IF(@Flag='FatherName')

BEGIN
Select *
from Membership.Membership mm
where  FatherName LIKE @SearchText + '%'  
END

IF(@Flag='Zone')

BEGIN
--SELECT COUNT (*) as Total,
-- Zone
-- from Membership.Membership GROUP BY Zone 

SELECT COUNT (*) as Total,
z.Zone as District
 from Membership.Membership mm INNER JOIN Setup.Zone z ON mm.District = z.ZoneID GROUP BY z.Zone;
 
END




IF(@Flag='District')

BEGIN
--SELECT COUNT (*) as Total,
-- District
-- from Membership.Membership GROUP BY District 

SELECT COUNT (*) as Total,
d.District as District
 from Membership.Membership mm INNER JOIN Setup.District d ON mm.District = d.DistrictID GROUP BY d.District;
 
END


IF(@Flag='Gender')

BEGIN
SELECT COUNT (*) as Total,
 Gender
 from Membership.Membership GROUP BY Gender 
 
 END

IF(@Flag='Education')

BEGIN
SELECT COUNT (*) as Total,
 Education
 from Membership.Membership GROUP BY Education 
 
 END

IF(@Flag='LicenseType')

BEGIN
SELECT COUNT (*) as Total,
 LicenseType
 from Membership.Membership GROUP BY LicenseType 
END

IF(@Flag='Gender')

BEGIN
SELECT COUNT (*) as Total,
 MembershipDate
 from Membership.Membership GROUP BY MembershipDate
END
GO
/****** Object:  StoredProcedure [Setup].[usp_Zone]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [Setup].[usp_Zone] 

    @ZoneID			int	=null,
	@Zone			NVARCHAR(50)= null,
    @Flag				char(1)
    AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	if @flag='i'
		BEGIN
			--BEGIN TRY
				BEGIN TRAN
				
					INSERT INTO [Setup].[Zone]
					([Zone])
					
					SELECT  @Zone
					
					SELECT 1 ErroCode, 'Record Successfully Inserted.' mes, SCOPE_IDENTITY()id
								               
				COMMIT
	--		END TRY
	--		BEGIN CATCH
	--SELECT ERROR_PROCEDURE() AS ErrorProcedure
	--		exec [Error].[Sp_Error_log] @flag='i';
	--			IF @@TRANCOUNT>0
	--				ROLLBACK TRAN;
	--				SELECT 0 ErroCode, ERROR_MESSAGE() mes, SCOPE_IDENTITY() id
	--				exec [Error].[Sp_Error_log] @flag='i';
	--		END CATCH
		END 
		
		
	if @flag='u'
	
		BEGIN
			--BEGIN TRY
				BEGIN TRAN

				UPDATE
				 [Setup].[Zone] 
			 SET    
			[Zone]=@Zone
			
				WHERE  [ZoneID]= @ZoneID 
				
				SELECT 1 ErroCode, 'Record Successfully Updated.' mes, @ZoneID  
			
				COMMIT
		--END TRY
		--	BEGIN CATCH
		--		IF @@TRANCOUNT>0
		--			ROLLBACK TRAN;
		--			SELECT 0 ErroCode, ERROR_MESSAGE() mes, SCOPE_IDENTITY() id
		--			exec [Error].[Sp_Error_log] @flag='i';
		--	END CATCH
		END 
		
if @flag='d'
	
		BEGIN
			--BEGIN TRY
				BEGIN TRAN
					DELETE
					FROM   [Setup].[Zone]
					
					WHERE  [ZoneID] = @ZoneID
					
					SELECT 1 ErroCode, 'Record Successfully Deleted.' mes, @ZoneID   id
				COMMIT
			--END TRY
			--BEGIN CATCH
			--	IF @@TRANCOUNT>0
			--		ROLLBACK TRAN;
			--		SELECT 0 ErroCode, ERROR_MESSAGE() mes, SCOPE_IDENTITY() id
			--		exec [Error].[Sp_Error_log] @flag='i';
			--END CATCH
		END 
		
if @flag='s'
	
		BEGIN
			--BEGIN TRY
				BEGIN TRAN
					SELECT [ZoneID],[Zone]
					FROM   [Setup].[Zone ] 
					WHERE  ([ZoneID] =@ZoneID  OR  @ZoneID   IS NULL) 
					
					SELECT 1 ErroCode, @@rowcount mes, @ZoneID id
			--END TRY
			--		BEGIN CATCH
			--			IF @@TRANCOUNT>0
			--				ROLLBACK TRAN;
			--				SELECT 0 ErroCode, ERROR_MESSAGE() mes, SCOPE_IDENTITY() id
			--				exec [Error].[Sp_Error_log] @flag='i';
			--		END CATCH
				END
GO
/****** Object:  StoredProcedure [Administartion].[usp_LoginUser]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Administartion].[usp_LoginUser] 
	@UserID				 INT=NULL,
	@UserName			NVARCHAR(50) =NULL,
    @UserPassword		 NVARCHAR(50) = NULL,
    @UserAddress		NVARCHAR(50) = NULL,
    @UserDistrict		NVARCHAR (50) = NULL,
    @UserMobile			NVARCHAR(50)	=NULL,
    @UserPost			NVARCHAR(50) = NULL,
    @UserRole			NVARCHAR(50) = NULL,
    @UserEmail			 NVARCHAR(50) = NULL,
    @UserPhoto			 NVARCHAR(50) = NULL,
    @CreatedBy			NVARCHAR(50) = NULL,
    @Isactive            BIT		  = NULL,
    @SearchText			NVARCHAR (50) = NULL,
    @Flag CHAR(1) 
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	
	
	IF @flag='i'
	BEGIN
	BEGIN TRAN
	
			INSERT INTO Administartion.LoginUser ([UserName],[UserPassword],[UserAddress],[UserDistrict],[UserMobile],[UserPost],[UserRole],[UserEmail],[CreatedDate],[CreatedBy],[Isactive])
			SELECT @UserName, @UserPassword, @UserAddress, @UserDistrict, @UserMobile, @UserPost,@UserRole,@UserEmail,GETDATE(), @CreatedBy, @Isactive
	
	SELECT 1 ErrorCode, 'Record Successfully Inserted' mes, SCOPE_IDENTITY() id              
	COMMIT
	END


IF @Flag = 'l'
 BEGIN
	
	BEGIN TRY
 	IF EXISTS( SELECT 'x' FROM Administartion.LoginUser WHERE UserName = @UserName AND UserPassword=@UserPassword AND UserDistrict = @UserDistrict) 
	BEGIN
	DECLARE @districtID INT
	SET @districtID=(SELECT UserDistrict FROM Administartion.LoginUser WHERE UserName = @UserName AND UserPassword=@UserPassword AND UserDistrict = @UserDistrict)
	SET @UserID=(SELECT UserID FROM Administartion.LoginUser WHERE UserName = @UserName AND UserPassword=@UserPassword AND UserDistrict = @UserDistrict)
	SELECT 1 errorCode, 'Successfully Login ' mes, @UserID  UserID , @UserName UserName, @districtID districtID
	END
	ELSE
	BEGIN
		SELECT 0 errorcode, 'User name or password didn''t matched. Please try again' mes,0 UserID
	END
	END TRY
	BEGIN CATCH
	 
	SELECT 0 errorcode, ERROR_MESSAGE() mes,0 UserID
	END CATCH
	END
	
	--IF @Flag = 's'
	--BEGIN 
	--BEGIN TRAN 
	--select * from Administartion.LoginUser 
	--where UserName like + '%'
	--COMMIT
	--END
	
	

	
	IF @Flag = 's'
	BEGIN
	BEGIN TRAN
	SELECT [UserID],[UserName] FROM Administartion.LoginUser
	WHERE ([UserID] = @UserID OR @UserID IS NULL)
	COMMIT
	END

	
	IF @Flag = 'd'
	BEGIN
	BEGIN TRAN 
	
	DELETE FROM Administartion.LoginUser 
	WHERE UserID = @UserID
	
	END
	
	IF @Flag = 'U'
	BEGIN 
	BEGIN TRAN 
	SELECT * FROM Administartion.LoginUser 
	
	COMMIT
	END
	
	
--IF(@Flag='UserName')

--BEGIN
--Select *
--from Administartion.LoginUser 
--where  UserName LIKE @SearchText + '%' and UserDistrict=@UserDistrict 
--END

--IF(@Flag='Mobile')

--BEGIN
--Select *
--from Administartion.LoginUser
--where  UserMobile LIKE @SearchText + '%' and UserDistrict=@UserDistrict 
--END
GO
/****** Object:  StoredProcedure [Setup].[usp_License]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Setup].[usp_License]

	@LicenseID int=NULL,
    @License nvarchar(50) = NULL,
    @Description nvarchar(max) = Null,
    @Flag char(1)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	
	if @Flag='i'
	BEGIN
	BEGIN TRAN
	
	INSERT INTO [Setup].[License] 
	([License],[Description] )
	SELECT @License ,@Description 
	         
	         
	         Select 1 ErrorCode, 'Record Successfully Inserted' mes, scope_Identity() id
	COMMIT
	END

	
	if @Flag='U'
	BEGIN
	BEGIN TRAN

	UPDATE [Setup].[License]
	SET    [License] = @License ,[Description] =@Description 
			
	WHERE  [LicenseID] = @LicenseID
	
Select 1 ErrorCode, 'Record Successfully Updated' mes, @LicenseID id
	COMMIT

END
	if @Flag='D'
	BEGIN
	BEGIN TRAN

	DELETE
	FROM   [Setup].[License]
	WHERE  [LicenseID] = @LicenseID
Select 1 ErrorCode, 'Record Successfully Deleted' mes,@LicenseID id
	COMMIT
	END

	if @Flag='S'
	BEGIN
SELECT [LicenseID], [License] ,[Description] 
	FROM   [Setup].[License] 
	WHERE  ([LicenseID] = @LicenseID OR @LicenseID IS NULL) 
	END
GO
/****** Object:  StoredProcedure [Setup].[usp_Education]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Setup].[usp_Education] 
	@EducationID	int=NULL,
    @EducationName	 nvarchar(50) = NULL,
    @EducationDescription	 nvarchar(max) = NULL,
    @flag			 char(1)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	 if @Flag='i'
	 
	 begin
	BEGIN TRAN
	
	INSERT INTO [Setup].[Education] ([EducationName],[EducationDescription] )
	SELECT @EducationName ,@EducationDescription 
	

Select 1 ErrorCode, 'Record Successfully Inserted' mes, scope_Identity() id
	COMMIT
	end

if @flag='u'
	
		BEGIN
			BEGIN TRY
				BEGIN TRAN

				UPDATE
				[Setup] .[Education] 
			 SET    
			[EducationName]=@EducationName,[EducationDescription]=@EducationDescription
			
				WHERE  [EducationID] = @EducationID
				
				SELECT 1 ErroCode, 'Record Successfully Updated.' mes, @EducationID
			
				COMMIT
		END TRY
			BEGIN CATCH
				IF @@TRANCOUNT>0
					ROLLBACK TRAN;
					SELECT 0 ErroCode, ERROR_MESSAGE() mes, SCOPE_IDENTITY() id
					exec [Error].[Sp_Error_log] @flag='i';
			END CATCH
		END 




 


	 if @Flag='d'
	 begin
	BEGIN TRAN

	DELETE
	FROM   [Setup].[Education]
	WHERE  [EducationID] = @EducationID



Select 1 ErrorCode, 'Record Successfully Deleted' mes, @EducationID id
	COMMIT
	
	end

if @Flag='s'
Begin

	--SELECT [EducationID],[EducationName],[EducationDescription]
	--FROM   [Setup].[Education] 
	--WHERE  ([EducationID] = @EducationID OR @EducationID IS NULL) 

			BEGIN TRY
				BEGIN TRAN
					SELECT [EducationID],[EducationName],[EducationDescription]
	FROM   [Setup].[Education] 
	WHERE  ([EducationID] = @EducationID OR @EducationID IS NULL) 
					
				COMMIT
			END TRY
					BEGIN CATCH
						IF @@TRANCOUNT>0
							ROLLBACK TRAN;
							SELECT 0 ErroCode, ERROR_MESSAGE() mes, SCOPE_IDENTITY() id
							--exec [Error].[Sp_Error_log] @flag='i';
					END CATCH
				END

if @flag='f'
begin
 select [EducationName],[EducationDescription]  from [Setup].[Education] 
 WHERE EducationID=@EducationID
end
GO
/****** Object:  StoredProcedure [Setup].[usp_District]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [Setup].[usp_District] 
	@DistrictID			INT =NULL,
	@ZoneID				INT	=null,
	@District			NVARCHAR(50)= null,
    @Flag				CHAR(1)
    AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	if @flag='i'
		BEGIN
			--BEGIN TRY
				BEGIN TRAN
				
					INSERT INTO [Setup].[District]
					([ZoneID],[District])					
					SELECT  @ZoneID,@District
					
					SELECT 1 ErroCode, 'Record Successfully Inserted.' mes, SCOPE_IDENTITY()id
								               
				COMMIT
	--		END TRY
	--		BEGIN CATCH
	--SELECT ERROR_PROCEDURE() AS ErrorProcedure
	--		exec [Error].[Sp_Error_log] @flag='i';
	--			IF @@TRANCOUNT>0
	--				ROLLBACK TRAN;
	--				SELECT 0 ErroCode, ERROR_MESSAGE() mes, SCOPE_IDENTITY() id
	--				exec [Error].[Sp_Error_log] @flag='i';
	--		END CATCH
		END 
		
		
	if @flag='u'
	
		BEGIN
			--BEGIN TRY
				BEGIN TRAN

				UPDATE
				 [Setup].[District] 
			 SET    
			[ZoneID]=@ZoneID,District=@District
			
				WHERE  [DistrictID]= @DistrictID 
				
				SELECT 1 ErroCode, 'Record Successfully Updated.' mes, @ZoneID  
			
				COMMIT
		--END TRY
		--	BEGIN CATCH
		--		IF @@TRANCOUNT>0
		--			ROLLBACK TRAN;
		--			SELECT 0 ErroCode, ERROR_MESSAGE() mes, SCOPE_IDENTITY() id
		--			exec [Error].[Sp_Error_log] @flag='i';
		--	END CATCH
		END 
		
if @flag='d'
	
		BEGIN
			--BEGIN TRY
				BEGIN TRAN
					DELETE
					FROM   [Setup].[District]
					
					WHERE  [DistrictID] = @DistrictID
					
					SELECT 1 ErroCode, 'Record Successfully Deleted.' mes, @DistrictID   id
				COMMIT
			--END TRY
			--BEGIN CATCH
			--	IF @@TRANCOUNT>0
			--		ROLLBACK TRAN;
			--		SELECT 0 ErroCode, ERROR_MESSAGE() mes, SCOPE_IDENTITY() id
			--		exec [Error].[Sp_Error_log] @flag='i';
			--END CATCH
		END 
		
if @flag='s'
	
		BEGIN
			--BEGIN TRY
				BEGIN TRAN
					SELECT [DistrictID],[ZoneID],[District]
					FROM   [Setup].[District]  
					WHERE  ([DistrictID] =@DistrictID  OR  @DistrictID   IS NULL) 
					COMMIT
					SELECT 1 ErroCode, @@rowcount mes, @DistrictID id
			--END TRY
			--		BEGIN CATCH
			--			IF @@TRANCOUNT>0
			--				ROLLBACK TRAN;
			--				SELECT 0 ErroCode, ERROR_MESSAGE() mes, SCOPE_IDENTITY() id
			--				exec [Error].[Sp_Error_log] @flag='i';
			--		END CATCH
				END


IF @Flag='z'
BEGIN
	SELECT * FROM [Setup].District WHERE ZoneID=@ZoneID
end
GO
/****** Object:  StoredProcedure [Membership].[useVoucher]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Membership].[useVoucher]
@VoucherID int= NULL,
@Amount NVARCHAR(50) = NULL,
@VoucherDate NVARCHAR(50) = NULL,
@VoucherNo NVARCHAR(50) = NULL,
@Narration NVARCHAR(MAX) = NULL,
@Purpose NVARCHAR(MAX) = NULL,
@CreatedDate NVARCHAR(50) = NULL,
@UserID NVARCHAR(50) = NULL,
@District NVARCHAR(50) = NULL,
@Flag char (1)

AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	IF @Flag = 'i'
	BEGIN
	BEGIN TRAN
	INSERT INTO Membership.Voucher([VoucherID] ,[Amount],[VoucherDate],[VoucherNo],[Narration],[Purpose],[CreatedDate],[UserID])
	SELECT @UserID, @Amount, @VoucherDate, @VoucherNo, @Narration, @Purpose, GETDATE(), @UserID
	END
GO
/****** Object:  StoredProcedure [Setup].[usp_Unit]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [Setup].[usp_Unit] @flag='s'

CREATE PROC [Setup].[usp_Unit]
 
	@UnitID int=NULL,
    @UnitName nvarchar(50) = NULL,
    @Description nvarchar(max) = NULL,
    @flag char(1)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	if @Flag='i'
	BEGIN
	BEGIN TRAN
	
	INSERT INTO [Setup].[Unit] ([UnitName],[Description] )
	SELECT @UnitName ,@Description 
	
select 1 ErorrCode, 'Record Successfully Inserted' mes,scope_Identity() id
	
	COMMIT
	END
If @Flag='u'
	BEGIN
	BEGIN TRAN

	UPDATE [Setup].[Unit]
	SET    [UnitName] = @UnitName ,[Description] = @Description 
	WHERE  [UnitID] = @UnitID
		select 1 ErorrCode, 'Record Successfully updated' mes,@UnitID id
	COMMIT
	END
IF @Flag='d'


BEGIN
	
	BEGIN TRAN

	DELETE
	FROM   [Setup].[Unit]
	WHERE  [UnitID] = @UnitID
		select 1 ErorrCode, 'Record Successfully Deleted' mes,@UnitID id
	COMMIT
	END



IF @flag='s'
Begin
SELECT [UnitID], [UnitName] ,[Description] 
	FROM   [Setup].[Unit] 
	WHERE  ([UnitID] = @UnitID OR @UnitID IS NULL) 
END
GO
/****** Object:  StoredProcedure [Setup].[usp_SearchForRenew]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Setup].[usp_SearchForRenew]
  @Flag char(50),
  @SearchText NVARCHAR(50)=NULL,
  @UserDistrict NVARCHAR (50) = NULL
    
AS
BEGIN
	IF(@Flag='All')

	BEGIN
		Select mm.MembershipID, mm.name,mm.City,mm.mobile,mm.email,mm.ValidDate as'LastRenewedDate'
		from Membership.Membership mm
		where datediff(day,convert(date,mm.ValidDate),convert(date,getdate()))>=30 and mm.UserDistrict=@UserDistrict


	END


else IF(@Flag='FirstName')

	BEGIN
	if @UserDistrict=76
	BEGIN
	Select  [MembershipID],[Name],d.District as [DistrictName],[VDC],[City],[CurrentCity],[Gender],[ValidDate]  as'LastRenewedDate',[Unit],p.PostName,[Email],[Phone],[Mobile],[Symbol] 
			from Membership.Membership mm INNER JOIN Setup.Post p 
			on mm.Post=p.PostID INNER JOIN Setup.District d
			on mm.District=d.DistrictID
			
		where datediff(day,convert(date,mm.ValidDate),convert(date,getdate()))>=30 and Name like @SearchText +'%' 
	END
	
		ELSE
		BEGIN
				Select  [MembershipID],[Name],d.District as [DistrictName],[VDC],[City],[CurrentCity],[Gender],[ValidDate]  as'LastRenewedDate',[Unit],p.PostName,[Email],[Phone],[Mobile],[Symbol] 
			from Membership.Membership mm INNER JOIN Setup.Post p 
			on mm.Post=p.PostID INNER JOIN Setup.District d
			on mm.District=d.DistrictID
			
		where datediff(day,convert(date,mm.ValidDate),convert(date,getdate()))>=30 and Name like @SearchText +'%'  and mm.UserDistrict=@UserDistrict
		end
		
select @SearchText
	END

	else IF(@Flag='mobile')

	BEGIN
		Select mm.MembershipID, mm.name,mm.City,mm.mobile,mm.email,mm.ValidDate as'LastRenewedDate'
		from Membership.Membership mm
		where datediff(day,convert(date,mm.ValidDate),convert(date,getdate()))>=30 and Mobile  like '%'  and mm.UserDistrict=@UserDistrict

	END
	
	else IF(@Flag='CitizenShipNo')

	BEGIN
		Select mm.MembershipID, mm.name,mm.City,mm.mobile,mm.email,mm.ValidDate as'LastRenewedDate'
		from Membership.Membership mm
		where datediff(day,convert(date,mm.ValidDate),convert(date,getdate()))>=30 and CitizenShipNO   like '%'  and mm.UserDistrict=@UserDistrict

	END
	
	
	
	
end
GO
/****** Object:  StoredProcedure [Membership].[usp_Search]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Membership].[usp_Search]
  @Flag char(50),
  @SearchText NVARCHAR(50)=NULL,
  @UserDistrict NVARCHAR (50) = NULL
  
AS
BEGIN
IF(@Flag='Name')

BEGIN
	if @UserDistrict=76
		begin
			Select  [MembershipID],[Name],[Zone],d.District as [DistrictName],[VDC],[City],[DateofBirth],[CurrentCity],[Gender],[FatherName],[MotherName],[CitizenShipNO],[LicenseNo],[LicenseType],[MembershipDate],[ValidDate],[Unit],p.PostName,[Email],[Phone],[Mobile],[Photo],[Education],[IsVerified],[UserDistrict],[AttachedFile],[Symbol] 
			from Membership.Membership mm INNER JOIN Setup.Post p 
			on mm.Post=p.PostID INNER JOIN Setup.District d
			on mm.District=d.DistrictID
			where Name like @SearchText + '%'
		END
	ELSE
		BEGIN
			Select  [MembershipID],[Name],[Zone],d.District as [DistrictName],[VDC],[City],[DateofBirth],[CurrentCity],[Gender],[FatherName],[MotherName],[CitizenShipNO],[LicenseNo],[LicenseType],[MembershipDate],[ValidDate],[Unit],p.PostName,[Email],[Phone],[Mobile],[Photo],[Education],[IsVerified],[UserDistrict],[AttachedFile],[Symbol] 
			from Membership.Membership mm INNER JOIN Setup.Post p 
			on mm.Post=p.PostID INNER JOIN Setup.District d
			on mm.District=d.DistrictID
			where Name like @SearchText + '%'  and (mm.UserDistrict=@UserDistrict )
		END
		
		

END

--IF(@Flag='District')

--BEGIN
--SELECT COUNT (*) as Total,
-- mm.MembershipID,d.District,mm.Name,mm.Gender,mm.Zone,mm.VDC,mm.DateofBirth,mm.MembershipDate 
-- from Membership.Membership mm INNER JOIN Setup.District d ON mm.District = d.DistrictID WHERE mm.MembershipID = MembershipID Group BY mm.MembershipID,mm.Name,mm.Gender,mm.Zone,mm.VDC,mm.DateofBirth,mm.MembershipDate, d.District
--END

IF(@Flag='District')

BEGIN
Select *
from Membership.Membership mm
where  District = District 
END



IF(@Flag='Mobile')

BEGIN
Select *
from Membership.Membership mm
where  Mobile LIKE @SearchText + '%' 
END
end
IF(@Flag='CitizenShipNo')

BEGIN
Select *
from Membership.Membership mm
where  CitizenShipNo LIKE @SearchText + '%' 
END

IF(@Flag='FatherName')

BEGIN
Select *
from Membership.Membership mm
where  FatherName LIKE @SearchText + '%'  
END

IF(@Flag='Zone')

BEGIN
Select *
from Membership.Membership mm
where Zone LIKE @SearchText + '%' 
END


IF(@Flag='District')

BEGIN
Select *
from Membership.Membership mm
where  District LIKE @SearchText + '%' 
END

IF(@Flag='LicenseType')

BEGIN
Select *
from Membership.Membership mm
where LicenseType LIKE @SearchText + '%' 
END

IF(@Flag='Gender')

BEGIN
Select *
from Membership.Membership mm
where Gender LIKE @SearchText + '%' 
END
GO
/****** Object:  StoredProcedure [Setup].[usp_Post]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Setup].[usp_Post] 
  @PostID int=NULL,
    @PostName nvarchar(50) = NULL,
    @Description nvarchar(max) =NULL,
    @Flag char(1)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	if @Flag='i'
	BEGIN
	BEGIN TRAN
	
	INSERT INTO [Setup].[Post] 
	([PostName],[Description] )
	SELECT @PostName ,@Description
	select 1 ErorrCode, 'Record Successfully Inserted' mes,scope_Identity() id
	COMMIT
	END
if @Flag='u' 
	BEGIN
	BEGIN TRAN

	UPDATE [Setup].[Post]
	SET    [PostName] = @PostName ,[Description] = @Description 
	WHERE  [PostID] = @PostID
	
		select 1 ErorrCode, 'Record Successfully Updated' mes,@PostID id

	COMMIT
	END
	
if @Flag='d'
BEGIN
	
	
 begin try
	BEGIN TRAN

	DELETE
	FROM   [Setup].[Post]
	WHERE  [PostID] = @PostID



Select 1 ErrorCode, 'Record Successfully Deleted' mes, @PostID id
	COMMIT
	
	end try
	begin catch
	Select 0 ErrorCode, ERROR_MESSAGE() mes, @PostID id

	end catch
	
end


If @Flag='s'
BEGIN

SELECT [PostID], [PostName] ,[Description] 
	FROM   [Setup].[Post] 
	WHERE  ([PostID] = @PostID OR @PostID IS NULL) 
END
GO
/****** Object:  StoredProcedure [Setup].[usp_MemberType]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Setup].[usp_MemberType] 
	@MemberTypeID int=NULL,
    @MemberTypeName nvarchar(50) = NULL,
    @Description nvarchar(max) = NULL,
    @Flag char(1)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON 
	 
	If @flag='i'
	BEGIN
	BEGIN TRAN
	
	INSERT INTO [Setup].[MemberType] ([MemberTypeName],[Description] )
	SELECT @MemberTypeName , @Description
	
	
             Select 1 erorrCode,'Record Sucessfully Inserted' mes,scope_Identity() id
	COMMIT
	END
If @Flag='u'
BEGIN
	
	BEGIN TRAN

	UPDATE [Setup].[MemberType]
	SET    [MemberTypeName] = @MemberTypeName , [Description] =@Description 
	WHERE  [MemberTypeID] = @MemberTypeID
	
	Select 1 erorrCode,'Record Sucessfully Updated' mes,@MemberTypeID id

	COMMIT
	END
if @Flag='d'
BEGIN
	BEGIN TRAN

	DELETE
	FROM   [Setup].[MemberType]
	WHERE  [MemberTypeID] = @MemberTypeID
Select 1 erorrCode,'Record Sucessfully Deleted' mes,@MemberTypeID id
	COMMIT
END
if @Flag='s'
BEGIN

SELECT [MemberTypeID], [MemberTypeName] ,[Description]
	FROM   [Setup].[MemberType] 
	WHERE  ([MemberTypeID] = @MemberTypeID OR @MemberTypeID IS NULL) 
	END
GO
/****** Object:  StoredProcedure [Membership].[usp_Membership]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from Membership.Membership
--exec [Membership].[usp_Membership]  @flag='v',@IsVerified="true",@MembershipID=28

CREATE PROC [Membership].[usp_Membership] 
	@MembershipID		int=NULl,
    @Name				nvarchar(50) = NULL,
    @Zone				nvarchar(50) = NULL,
    @District			nvarchar(50) = NULL,
    @VDC				nvarchar(50) = NULL,
    @City				nvarchar(50) = NULL,
    @DateofBirth		date		 = NULL,
    @CurrentCity		nvarchar(50) = Null,
    @Gender				nvarchar(50) = Null,
    @FatherName			nvarchar(50) = NULL,
    @MotherName			nvarchar(50) = NULL,
    @CitizenShipNO		nvarchar(50) = NULL,
    @LicenseNo			nvarchar(50) = NULL,
    @LicenseType		nvarchar(50) = NULL,
    @MembershipDate		date = NULL,
    @ValidDate			date = NULL,
    @Unit				nvarchar(50) = NULL,
    @Post				nvarchar(50) = NULL,
    @Email				varchar(50)  = NULL,
    @Phone				nvarchar(50) = NULL,
    @Mobile				nvarchar(50) = NULL,
    @Photo				nvarchar(100) = NULL,
    @Education			nvarchar(50) = NULL,
    @UserDistrict		nchar(50),
    @IsVerified			bit=NULL,
    @UserID				bit = NULL,
	@Symbol				nvarchar(50) = NULL,
	@MembershipNo	nvarchar(50) = NULL,
	@NameInEnglish	nvarchar(150) = NULL,
    @Flag				char(1)
   
    
    
	AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	if @flag='i'
	begin
	BEGIN TRAN
	
	

	
	
			INSERT INTO [Membership].[Membership] ([Name], [Zone], [District],[VDC], [City], [DateofBirth],[CurrentCity],[Gender],[FatherName], [MotherName], [CitizenShipNO], [LicenseNo], [LicenseType], [MembershipDate], [ValidDate], [Unit], [Post], [Email], [Phone], [Mobile], [Photo], [Education],[UserDistrict], Symbol, MembershipNo, NameInEnglish)
			SELECT @Name, @Zone, @District, @VDC, @City, @DateofBirth,@CurrentCity,@Gender, @FatherName, @MotherName, @CitizenShipNO, @LicenseNo, @LicenseType, @MembershipDate, @ValidDate, @Unit, @Post, @Email, @Phone, @Mobile, @Photo, @Education, @UserDistrict, @Symbol, @MembershipNo, @NameInEnglish
	
	Select 1 ErrorCode, 'Record Successfully Inserted' mes, scope_Identity() id              
	COMMIT
	end
	
	if @flag='u'
	begin
	
	BEGIN TRAN


	--UPDATE [Membership].[Membership]
	--SET    [Name] = @Name, [Zone] = @Zone, [District] = @District, [VDC] = @VDC, [City] = @City, [DateofBirth] = @DateofBirth, [FatherName] = @FatherName, [MotherName] = @MotherName, [CitizenShipNO] = @CitizenShipNO, [LicenseNo] = @LicenseNo, [LicenseType]  = @LicenseType, [MembershipDate] = @MembershipDate, [ValidDate] = @ValidDate, [Unit] = @Unit, [Post] = @Post, [Email] = @Email, [Phone] = @Phone, [Mobile] = @Mobile, [Photo] = @Photo, [Education] = @Education, [IsVerified] = @IsVerified
	--WHERE  [MembershipID] = @MembershipID
	
	UPDATE [Membership].[Membership]
	SET    [Name] = @Name, [Zone] = @Zone, [District] = @District, [VDC] = @VDC, [City] = @City, [DateofBirth] = @DateofBirth, [FatherName] = @FatherName, [MotherName] = @MotherName, [CitizenShipNO] = @CitizenShipNO, [LicenseNo] = @LicenseNo, [LicenseType] =
 @LicenseType, [MembershipDate] = @MembershipDate, [ValidDate] = @ValidDate, [Unit] = @Unit, [Post] = @Post, [Email] = @Email, [Phone] = @Phone, [Mobile] = @Mobile, [Photo] = @Photo, [Education] = @Education,[IsVerified] = @IsVerified, Symbol=@Symbol, MembershipNo=@MembershipNo, NameInEnglish=@NameInEnglish
	WHERE  [MembershipID] = @MembershipID 
	
	Select 1 ErrorCode, 'Record Successfully Updated' mes, @MembershipID  id

	COMMIT
	end
	
	
if @flag='d'
	begin
	
	BEGIN TRAN

	DELETE
	FROM   [Membership].[Membership]
	WHERE  [MembershipID] = @MembershipID
Select 1 ErrorCode, 'Record Successfully Deleted' mes, @MembershipID  id
	COMMIT
	end


if @flag='s'
	begin

	SELECT mm.Name,z.Zone,d.District,mm.VDC,mm.City,CONVERT(VARCHAR,mm.DateofBirth,109) AS DateofBirth,mm.FatherName,mm.MotherName,mm.CitizenShipNO,mm.LicenseNo,l.License,mm.MembershipDate,mm.ValidDate,u.UnitName,p.PostName,mm.Email,mm.Phone,mm.Mobile,mm.Photo,mm.IsVerified FROM Membership.Membership mm 
	INNER JOIN Setup.Zone z ON mm.Zone=z.ZoneID 
	INNER JOIN Setup.District d ON mm.District = d.DistrictID 
	LEFT JOIN Setup.License l ON mm.LicenseType = l.LicenseID 
	LEFT JOIN Setup.Unit u ON mm.Unit=u.UnitID 
	LEFT JOIN Setup.Post p ON mm.Post = p.PostID where [MembershipID]=@MembershipID 
	
	end
	
	
	If @flag='L'
	BEGIN
	
	select mm.Name,mm.FatherName,mm.MotherName,z.Zone, d.District,
	mm.CitizenShipNo,mm.MembershipDate,mm.DateofBirth,mm.LicenseNo,
	mm.Email,mm.city,mm.Mobile,mm.Phone,e.EducationName,mm.ValidDate,
	p.postname,u.UnitName, mm.photo
	from membership.Membership mm
	inner join setup.Zone z on mm. Zone=Z.ZoneID
	inner join setup.District d on mm. district=d.districtID
	inner join setup.Vdc v on mm. VDC=V.VDCID
	inner join setup.post p on mm.post=p.postID
	inner join setup.Unit u on mm.Unit=u.UnitID
	inner join setup.Education e on mm.education= e.educationID
	COMMIT	
	END


if @flag='v'
	begin
	
	BEGIN TRAN
	UPDATE [Membership].[Membership]
	SET       [IsVerified] = @IsVerified
	WHERE  [MembershipID] = @MembershipID
	
	Select 1 ErrorCode, 'Member successfully verified.' mes, @MembershipID  id

	COMMIT
	end
	
	
	if @flag='d'
	begin
	
	BEGIN TRAN
	UPDATE [Membership].[Membership]
	SET    [UserDistrict]  = @UserDistrict
	WHERE  [MembershipID] = @MembershipID
	
	Select 1 ErrorCode, 'Member successfully verified.' mes, @UserDistrict id

	COMMIT
	end
GO
/****** Object:  StoredProcedure [Membership].[usp_RenewMembership]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
CREATE PROC [Membership].[usp_RenewMembership] 
	@RenewID int=NULL,
    @MembershipID int = NULL,
    @RenewDate date = NULL,
    @Amount Decimal(10,2)=NULL,
    @Isvalid bit=null,
    @Flag char(1)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	If @flag='i'
	BEGIN
	BEGIN TRAN
	
	
	if exists(select top 1 * FROM Membership.Membership where IsVerified=@Isvalid and MembershipID=@MembershipID)
	BEGIN
		
	INSERT INTO [Membership].[RenewMembership] ([MembershipID], [RenewDate],[Amount])
	SELECT @MembershipID, @RenewDate, @Amount
	
	update Membership.membership
	set ValidDate=@RenewDate 
	where membershipID=@membershipID
	
	select 1 ErrorCode,'Member of ITWAN Successfully Renewed!'mes,Scope_Identity() id
	END
	ELSE
	BEGIN
		select 1 ErrorCode,'Member of ITWAN is not Verified.'mes,Scope_Identity() id
	END
	COMMIT
	if @@error<>0
	ROLLBACK
	select 1 Errorcode, ERROR_MESSAGE() mes, 1 id
	END

	if @Flag='u'
	BEGIN
	BEGIN TRAN

	UPDATE [Membership].[RenewMembership]
	SET    [MembershipID] = @MembershipID, [RenewDate] = @RenewDate,[Amount]= @Amount
	WHERE  [RenewID] = @RenewID
		select 1 ErrorCode,'Record Successfully Updated'mes,@RenewID id
	COMMIT
	END


If @Flag='d'
BEGIN
	BEGIN TRAN

	DELETE
	FROM   [Membership].[RenewMembership]
	WHERE  [RenewID] = @RenewID
	
		select 1 ErrorCode,'Record Successfully Delete'mes,@RenewID id
	COMMIT
	END
If @flag='s'
BEGIN
	SELECT [RenewID], [MembershipID], [RenewDate] ,[Amount]
	FROM   [Membership].[RenewMembership] 
	WHERE  ([RenewID] = @RenewID OR @RenewID IS NULL) 
END
GO
/****** Object:  StoredProcedure [Setup].[usp_VDC]    Script Date: 11/26/2015 13:45:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [Setup].[usp_VDC] 
	@VdcID				INT =NULL ,
	@DistrictID			INT =NULL,
	@ZoneID				INT	=null,
	@VDC			NVARCHAR(50)= null,
    @Flag				CHAR(1)
    AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	if @flag='i'
		BEGIN
		
				BEGIN TRAN
				
					INSERT INTO [Setup].[VDC]
					([DistrictID],[ZoneID],[VDC])
					
					SELECT  @DistrictID,@ZoneID,@VDC
					
					SELECT 1 ErroCode, 'Record Successfully Inserted.' mes, SCOPE_IDENTITY()id
								               
				COMMIT
			
		END 
		
		
	if @flag='u'
	
		BEGIN
			
				BEGIN TRAN

				UPDATE
				 [Setup].[VDC] 
			 SET    
			[DistrictID]=@DistrictID,[ZoneID]=@ZoneID,[VDC]=@VDC
			
				WHERE  [VdcID]= @VdcID
				
				SELECT 1 ErroCode, 'Record Successfully Updated.' mes, @VdcID 
			
				COMMIT
		
		END 
		
if @flag='d'
	
		BEGIN
		
				BEGIN TRAN
					DELETE
					FROM   [Setup].[VDC]
					
					WHERE  [VdcID] = @VdcID
					
					SELECT 1 ErroCode, 'Record Successfully Deleted.' mes, @VdcID   id
				COMMIT
		
			
		END 
		
if @flag='s'
	
		BEGIN
		
				BEGIN TRAN
					SELECT [VdcID],[DistrictID],[ZoneID],[VDC]
					FROM   [Setup].[VDC]   
					WHERE  ([VdcID] =@VdcID  OR  @VdcID   IS NULL) 
			COMMIT
					SELECT 1 ErroCode, @@rowcount mes, @VdcID id
		end
IF @Flag='z'
BEGIN
	SELECT * FROM [Setup].VDC  WHERE DistrictID=@DistrictID  
end
GO
/****** Object:  StoredProcedure [Membership].[ExpireMembership]    Script Date: 11/26/2015 13:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Membership].[ExpireMembership]
  @SearchText	NVARCHAR(50)=NULL,
  @DateFrom		date=NULL,
  @DateTo		date=NULL,
  @UserDistrict NVARCHAR (50) = NULL,
  @UserID		bit = NULL,
  @Flag			CHAR(1)
  
  
	AS

			if @Flag = 's'
			BEGIN
			
			select * 
			
			from Membership.RenewMembership where convert(date,RenewDate) BETWEEN convert(date,@DateFrom) and convert(date,@DateTo)
			END
		
		if @Flag = 'e'
			BEGIN
			
		
			Select mm.MembershipID, mm.name,mm.City,mm.mobile,mm.email,mm.ValidDate as'ExpiryDate'
			from Membership.Membership mm
			where datediff(day,convert(date,mm.ValidDate),convert(date,getdate()))>=30 
			
			
			END
GO
/****** Object:  Default [validDate]    Script Date: 11/26/2015 13:45:00 ******/
ALTER TABLE [Membership].[Membership] ADD  CONSTRAINT [validDate]  DEFAULT (getdate()) FOR [ValidDate]
GO
/****** Object:  ForeignKey [FK__RenewMemb__Membe__4316F928]    Script Date: 11/26/2015 13:45:00 ******/
ALTER TABLE [Membership].[RenewMembership]  WITH CHECK ADD  CONSTRAINT [FK__RenewMemb__Membe__4316F928] FOREIGN KEY([MembershipID])
REFERENCES [Membership].[Membership] ([MembershipID])
GO
ALTER TABLE [Membership].[RenewMembership] CHECK CONSTRAINT [FK__RenewMemb__Membe__4316F928]
GO
/****** Object:  ForeignKey [FK__VDC__ZoneID__3C69FB99]    Script Date: 11/26/2015 13:45:00 ******/
ALTER TABLE [Setup].[VDC]  WITH CHECK ADD FOREIGN KEY([ZoneID])
REFERENCES [Setup].[Zone] ([ZoneID])
GO
