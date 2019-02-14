/*========================================================================
                 ----------------------- 
                 	DROP_DATABASE
                 -----------------------
VERSION     : v1.0 
CREATE DATE : 2018-01-01
AUTHOR      : Hoàng Văn Hiếu (Dev of TSG)
MOBILE      : +84396891256
EMAIL       : hieu.hoang@tsg.net.vn
UNIQUENESS  : N/A
COMMENTS    : N/A
========================================================================
Information about paramater?
N/A

Module
1. DROP DATABASE [STAGING_MARKETING]
2. DROP DATABASE [MART_MARKETING]
========================================================================
How to Start?

Step 1 : Execute this File.
========================================================================*/




IF DB_ID('STAGING_MARKETING') IS NOT NULL
BEGIN
	EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'STAGING_MARKETING'
	USE [master]
	ALTER DATABASE [STAGING_MARKETING] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
	USE [master]
	DROP DATABASE [STAGING_MARKETING]
END



IF DB_ID('MART_MARKETING') IS NOT NULL
BEGIN
	EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'MART_MARKETING'
	USE [master]
	ALTER DATABASE [MART_MARKETING] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
	USE [master]
	DROP DATABASE [MART_MARKETING]
END