USE [master]
GO
/****** Object:  Database [DevNet]    Script Date: 6/10/2021 10:23:22 AM ******/
CREATE DATABASE [DevNet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DevNet', FILENAME = N'/opt/mssql/data/DevNet.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DevNet_log', FILENAME = N'/opt/mssql/data/DevNet_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DevNet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DevNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DevNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DevNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DevNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DevNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DevNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [DevNet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DevNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DevNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DevNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DevNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DevNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DevNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DevNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DevNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DevNet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DevNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DevNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DevNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DevNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DevNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DevNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DevNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DevNet] SET RECOVERY FULL 
GO
ALTER DATABASE [DevNet] SET  MULTI_USER 
GO
ALTER DATABASE [DevNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DevNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DevNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DevNet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DevNet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DevNet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DevNet', N'ON'
GO
ALTER DATABASE [DevNet] SET QUERY_STORE = OFF
GO
USE [DevNet]
GO
/****** Object:  Table [dbo].[areacode]    Script Date: 6/10/2021 10:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[areacode](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[SPCode] [nvarchar](2) NULL,
	[AREA] [nvarchar](20) NULL,
	[LOCATION] [nvarchar](300) NULL,
	[UNIT_CHG] [numeric](18, 6) NULL,
	[UNIT_MIN] [numeric](18, 6) NULL,
	[A_CHG] [numeric](18, 6) NULL,
	[A_MIN] [numeric](18, 6) NULL,
	[TYPE] [nvarchar](10) NULL,
	[GST_MIN] [real] NULL,
	[Trunk] [nvarchar](30) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
 CONSTRAINT [PK_areacode_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ccy]    Script Date: 6/10/2021 10:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ccy](
	[CCode] [nvarchar](3) NOT NULL,
	[BCode] [nvarchar](3) NOT NULL,
	[Rate] [numeric](18, 6) NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[CcyDiv] [int] NOT NULL,
	[RoundingType] [nvarchar](3) NULL,
	[DefaultTF] [nvarchar](1) NULL,
	[HASH] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ccycoutlink]    Script Date: 6/10/2021 10:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ccycoutlink](
	[CcyCode] [nvarchar](3) NULL,
	[CCode] [nvarchar](3) NULL,
	[LastModifiedDate] [datetime] NULL,
	[HASH] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gateway]    Script Date: 6/10/2021 10:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gateway](
	[CODE] [nvarchar](1) NULL,
	[SCODE] [nvarchar](2) NULL,
	[CShortDesc] [nvarchar](20) NULL,
	[HOSTNAME] [nvarchar](30) NULL,
	[IP] [nvarchar](20) NULL,
	[FullDesc] [nvarchar](50) NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastUpDate] [datetime] NULL,
	[HASH] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pref_sip_operators]    Script Date: 6/10/2021 10:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pref_sip_operators](
	[PREF] [int] NOT NULL,
	[AREA] [nvarchar](20) NULL,
	[UNIT_CHG] [numeric](18, 6) NULL,
	[QOS_RATE] [nvarchar](3) NULL,
	[SPCODE] [nvarchar](2) NULL,
	[GW] [nvarchar](1) NULL,
	[SIPSTATUS] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SfbFromEnd]    Script Date: 6/10/2021 10:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SfbFromEnd](
	[CODE] [nvarchar](3) NOT NULL,
	[CCODE] [nvarchar](3) NOT NULL,
	[DESCRIPTION] [nvarchar](100) NULL,
	[IP] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sip_operators]    Script Date: 6/10/2021 10:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sip_operators](
	[CODE] [nvarchar](2) NOT NULL,
	[CCODE] [nvarchar](3) NOT NULL,
	[CCYTYPE] [nvarchar](3) NOT NULL,
	[OPERATOR] [nvarchar](100) NULL,
	[IP] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sources]    Script Date: 6/10/2021 10:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sources](
	[CODE] [nvarchar](3) NULL,
	[CCODE] [nvarchar](3) NULL,
	[SCODE] [nvarchar](2) NULL,
	[CShortDesc] [nvarchar](20) NULL,
	[HOSTNAME] [nvarchar](30) NULL,
	[IP] [nvarchar](20) NULL,
	[FullDesc] [nvarchar](50) NULL,
	[TimeZone] [nvarchar](6) NULL,
	[IncludeTF] [nvarchar](1) NULL,
	[CDest] [nvarchar](30) NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastUpDate] [datetime] NULL,
	[HASH] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ssh_credentials]    Script Date: 6/10/2021 10:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ssh_credentials](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HOST] [nvarchar](30) NULL,
	[PORT] [nvarchar](4) NULL,
	[USERNAME] [nvarchar](50) NULL,
	[PASSWORD] [nvarchar](100) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[areacode] ADD  DEFAULT (NULL) FOR [AREA]
GO
ALTER TABLE [dbo].[areacode] ADD  DEFAULT (NULL) FOR [LOCATION]
GO
ALTER TABLE [dbo].[areacode] ADD  DEFAULT (NULL) FOR [UNIT_CHG]
GO
ALTER TABLE [dbo].[areacode] ADD  DEFAULT (NULL) FOR [UNIT_MIN]
GO
ALTER TABLE [dbo].[areacode] ADD  DEFAULT (NULL) FOR [A_CHG]
GO
ALTER TABLE [dbo].[areacode] ADD  DEFAULT (NULL) FOR [A_MIN]
GO
ALTER TABLE [dbo].[areacode] ADD  DEFAULT (NULL) FOR [TYPE]
GO
ALTER TABLE [dbo].[areacode] ADD  DEFAULT ((0)) FOR [GST_MIN]
GO
ALTER TABLE [dbo].[areacode] ADD  DEFAULT (NULL) FOR [Trunk]
GO
/****** Object:  StoredProcedure [dbo].[util_get_sip_rank]    Script Date: 6/10/2021 10:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Douglas Ochieng
-- Create date: 28/05/2021
-- Description:	/* set the prefered service provider acording to the cost of calls*/
-- =============================================
CREATE PROCEDURE [dbo].[util_get_sip_rank] 
	--Add the parameters for the stored procedure here
	@in_called_no nvarchar(50) --outgoing call
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare

	@tel_no_dial nvarchar (30)
    -- construct SQL
        BEGIN 	
		--check call type		
			BEGIN TRY
				begin
					Begin
						truncate Table pref_sip_operators -- check if table has data then clean it
					End
				end
				begin
						if LEFT(@in_called_no, 1)='0'  -- check for official calls 
							begin
								if LEFT(@in_called_no, 3)='000' --check the first three characters for international official calls
									begin
										set @tel_no_dial = RIGHT(@in_called_no, LEN(@in_called_no) - 3)
										insert into pref_sip_operators (PREF,AREA,UNIT_CHG,SPCODE,GW)
										select ROW_NUMBER() OVER(ORDER BY ac.AREA,ac.UNIT_CHG ASC) as RANK,ac.AREA,ac.UNIT_CHG,ac.SPCode, gw.CODE  
										from  areacode ac, gateway gw
										where ac.SPCode=gw.SCODE and @tel_no_dial like ac.area + '%' 
										order by ac.AREA,ac.UNIT_CHG
									end
								if LEFT(@in_called_no, 2)='00' --check the first two characters for local official calls
									begin
										set @tel_no_dial = RIGHT(@in_called_no, LEN(@in_called_no) - 2)
										insert into pref_sip_operators (PREF,AREA,UNIT_CHG,SPCODE,GW)
										select ROW_NUMBER() OVER(ORDER BY ac.AREA,ac.UNIT_CHG ASC) as RANK,ac.AREA,ac.UNIT_CHG,ac.SPCode, gw.CODE  
										from  areacode ac, gateway gw
										where ac.SPCode=gw.SCODE and @tel_no_dial like ac.area + '%' 
										order by ac.AREA,ac.UNIT_CHG 
									end
							end	
						if LEFT(@in_called_no, 1)='8'  -- check for personal calls 
							begin
								if LEFT(@in_called_no, 3)='800' --check the first three characters for international personal calls
									begin
										set @tel_no_dial = RIGHT(@in_called_no, LEN(@in_called_no) - 3)
										insert into pref_sip_operators (PREF,AREA,UNIT_CHG,SPCODE,GW)
										select ROW_NUMBER() OVER(ORDER BY ac.AREA,ac.UNIT_CHG ASC) as RANK,ac.AREA,ac.UNIT_CHG,ac.SPCode, gw.CODE  
										from  areacode ac, gateway gw
										where ac.SPCode=gw.SCODE and @tel_no_dial like ac.area + '%' 
										order by ac.AREA,ac.UNIT_CHG
									end
								if LEFT(@in_called_no, 2)='80' --check the first two characters for local personal calls
									begin
										set @tel_no_dial = RIGHT(@in_called_no, LEN(@in_called_no) - 2)
										insert into pref_sip_operators (PREF,AREA,UNIT_CHG,SPCODE,GW)
										select ROW_NUMBER() OVER(ORDER BY ac.AREA,ac.UNIT_CHG ASC) as RANK,ac.AREA,ac.UNIT_CHG,ac.SPCode, gw.CODE  
										from  areacode ac, gateway gw
										where ac.SPCode=gw.SCODE and @tel_no_dial like ac.area + '%' 
										order by ac.AREA,ac.UNIT_CHG
									end
							end
						if LEFT(@in_called_no, 2)<>'00' or LEFT(@in_called_no, 2)<>'80' --check if the call is neither official or personal
							begin
								set @tel_no_dial = @in_called_no
								insert into pref_sip_operators (PREF,AREA,UNIT_CHG,SPCODE,GW)
								select ROW_NUMBER() OVER(ORDER BY ac.AREA,ac.UNIT_CHG ASC) as RANK,ac.AREA,ac.UNIT_CHG,ac.SPCode, gw.CODE  
								from  areacode ac, gateway gw
								where ac.SPCode=gw.SCODE and @tel_no_dial like ac.area + '%' 
								order by ac.AREA,ac.UNIT_CHG
							end								
				end
			END TRY
			BEGIN CATCH
				IF @@ERROR <> 0
				BEGIN
					DECLARE @ErrorMessage  NVARCHAR(4000)
					DECLARE @ErrorSeverity INT
					DECLARE @ErrorState    INT
   
					SELECT @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE(),
							@ErrorMessage  = ERROR_MESSAGE()

					SET NOCOUNT OFF

					RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)
				END
			END CATCH 
		END
    -- execute the SQL
	--	EXEC sp_executesql @sql
	SET NOCOUNT OFF  
	RETURN
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'DevNet.areacode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'areacode'
GO
USE [master]
GO
ALTER DATABASE [DevNet] SET  READ_WRITE 
GO
