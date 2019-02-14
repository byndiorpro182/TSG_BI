/*========================================================================
                ------------------------- 
                 	CREATE_STAGING_AREA		
                -------------------------
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
01. CREATE DATABASE STAGING_MARKETING
02. CREATE TABLE SaleDetail
03. CREATE TABLE MarketingCosts
04. CREATE TABLE OppStatus
05. CREATE TABLE AdwordKeyword
06. CREATE TABLE TargetMarketing
07. CREATE TABLE DIM_Customer
08. CREATE TABLE DIM_Employee
09. CREATE TABLE DIM_IventoryItem
10. CREATE TABLE DIM_InventoryGroup
11. CREATE TABLE DIM_MarketingChannel
12. CREATE TABLE DIM_OppStatus
13. CREATE TABLE DIM_Calender
14. CREATE TABLE LOG_ETL

========================================================================
How to Start?

Step 1 : Execute this File.
========================================================================*/


--DROP DATABASE STAGING_MARKETING
CREATE DATABASE STAGING_MARKETING
GO

USE STAGING_MARKETING
GO

CREATE TABLE SaleDetail
(
	[PostedDate] DATETIME NULL ,
	[CreateOn] DATETIME NULL ,
	[CustomerCode] NVARCHAR (255) NULL ,
	[CustomerName] NVARCHAR (255) NULL ,
	[ProductCode] NVARCHAR (255) NULL ,
	[ProductName] NVARCHAR (500) NULL ,
	[ProductGroupCode] NVARCHAR (255) NULL ,
	[ProductGroup] NVARCHAR (255) NULL ,
	[NewBuy/Renew] NVARCHAR (255) NULL ,
	[UnitName] NVARCHAR (255) NULL ,
	[Quantily] INT NULL ,
	[SaleAmount] MONEY NULL ,
	[EmployeeCode] NVARCHAR (255) NULL ,
	[EmployeeName] NVARCHAR (255) NULL ,
	[MarketingChannelCode] NVARCHAR (255) NULL ,
	[MarketingChannel] NVARCHAR (255) NULL ,
	[ExecutionStartTime] DATETIME NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[TaskName] NVARCHAR (255) NULL 
)
GO

CREATE TABLE MarketingCost
(
	[DateCost] DATETIME NULL ,
	[MarketingChannelCode] NVARCHAR (255) NULL ,
	[MarketingChannel] NVARCHAR (255) NULL ,
	[CampaignGroupCode] NVARCHAR (255) NULL ,
	[CampaignGroup] NVARCHAR (255) NULL ,
	[Cost] MONEY NULL ,
	[Cost/Day] MONEY NULL ,
	[Rank] MONEY NULL ,
	[Views] INT NULL ,
	[ExecutionStartTime] DATETIME NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[TaskName] NVARCHAR (255) NULL 
)
GO

CREATE TABLE OppStatus
(
	[EmployeeCode] NVARCHAR (255) NULL ,
	[Owner] NVARCHAR (255) NULL ,
	[CreatedOn] DATETIME NULL ,
	[Topic] NVARCHAR (500) NULL ,
	[ProductGroupCode] NVARCHAR (255) NULL ,
	[ProductGroup] NVARCHAR (255) NULL ,
	[CustomerCode] NVARCHAR (255) NULL ,
	[CustomerName] NVARCHAR (255) NULL ,
	[CloseDate] DATETIME NULL ,
	[Revenue] MONEY NULL ,
	[Estimated Margin] MONEY NULL ,
	[MarketingChannelCode] NVARCHAR (255) NULL ,
	[MarketingChannel] NVARCHAR (255) NULL ,
	[OppStatusCode] NVARCHAR (255) NULL ,
	[OppStatus] NVARCHAR (255) NULL ,
	[ExecutionStartTime] DATETIME NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[TaskName] NVARCHAR (255) NULL 
)
GO

CREATE TABLE AdwordKeyword
(
	[Date] DATETIME NULL ,
	[ON/OFF] NVARCHAR (255) NULL ,
	[CampaignGroupCode] NVARCHAR (255) NULL ,
	[CampaignGroup] NVARCHAR (255) NULL ,
	[Keyword] NVARCHAR (255) NULL ,
	[Status] NVARCHAR (255) NULL ,
	[Clicks] MONEY NULL ,
	[Views] MONEY NULL ,
	[Cost] MONEY NULL ,
	[Rank] MONEY NULL ,
	[ExecutionStartTime] DATETIME NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[TaskName] NVARCHAR (255) NULL 
)
GO

CREATE TABLE TargetMarketing
(
	[TargetDate] DATETIME NULL ,
	[MarketingChannelCode] NVARCHAR (255) NULL ,
	[MarketingChannel] NVARCHAR (255) NULL ,
	[ProductGroupCode] NVARCHAR (255) NULL ,
	[ProductGroup] NVARCHAR (255) NULL ,
	[Cost] MONEY NULL ,
	[TargetOpp] INT NULL ,
	[Revenue] MONEY NULL ,
	[Profit] MONEY NULL ,
	[ExecutionStartTime] DATETIME NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[TaskName] NVARCHAR (255) NULL 
)
GO

CREATE TABLE DIM_Calender
(
	[DateTime] DATETIME NULL ,
	[Year] INT NULL ,
	[Quarter] INT NULL ,
	[Month] INT NULL ,
	[WeekNum] INT NULL ,
	[WeekDay] INT NULL ,
	[Day] INT NULL ,
	[DayOfWeek] NVARCHAR (255) NULL ,
	[ExecutionStartTime] DATETIME NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[TaskName] NVARCHAR (255) NULL 
)
GO

CREATE TABLE DIM_OppStatus
(
	[OppStatusCode] NVARCHAR (255) NULL ,
	[OppStatusName] NVARCHAR (255) NULL ,
	[ExecutionStartTime] DATETIME NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[TaskName] NVARCHAR (255) NULL 
)
GO

CREATE TABLE DIM_Customer
(
	[CustomerCode] NVARCHAR (255) NULL ,
	[CustomerName] NVARCHAR (255) NULL ,
	[CustomerAddress] NVARCHAR (255) NULL ,
	[CustomerCategoryKey] NVARCHAR (255) NULL ,
	[CustomerTaxCode] NVARCHAR (255) NULL ,
	[DebitDayAllowed] INT NULL ,
	[MaximumDebitAllowed] INT NULL ,
	[CustomerTypes] NVARCHAR (255) NULL ,
	[IsSupplier] BIT NULL ,
	[StopActive] BIT NULL ,
	[Branch] NVARCHAR (255) NULL ,
	[City] NVARCHAR (255) NULL ,
	[Country] NVARCHAR (255) NULL ,
	[ExecutionStartTime] DATETIME NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[TaskName] NVARCHAR (255) NULL 
)
GO

CREATE TABLE DIM_Employee
(
	[EmployeeCode] NVARCHAR (255) NULL ,
	[EmployeeName] NVARCHAR (255) NULL ,
	[EmployeeDepartment] NVARCHAR (255) NULL ,
	[StopActive] BIT NULL ,
	[Branch] NVARCHAR (255) NULL ,
	[DomainName] NVARCHAR (255) NULL ,
	[ExecutionStartTime] DATETIME NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[TaskName] NVARCHAR (255) NULL 
)
GO

CREATE TABLE DIM_InventoryItem
(
	[ProductCode] NVARCHAR (255) NULL ,
	[ProductName] NVARCHAR (500) NULL ,
	[ProductGroup] NVARCHAR (255) NULL ,
	[UnitName] NVARCHAR (255) NULL ,
	[StopActive] BIT NULL ,
	[ExecutionStartTime] DATETIME NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[TaskName] NVARCHAR (255) NULL 
)
GO

CREATE TABLE DIM_InventoryGroup
(
	[ProductCodeGroup] NVARCHAR (255) NULL ,
	[ProductNameGroup] NVARCHAR (255) NULL ,
	[ExecutionStartTime] DATETIME NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[TaskName] NVARCHAR (255) NULL 
)
GO

CREATE TABLE DIM_MarketingChannel
(
	[MarketingChannelCode] NVARCHAR (255) NULL ,
	[MarketingChannelName] NVARCHAR (255) NULL ,
	[ExecutionStartTime] DATETIME NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[TaskName] NVARCHAR (255) NULL 
)
GO

CREATE TABLE LOG_ETL
(
	[DateRun] DATETIME NULL ,
	[MachineName] NVARCHAR (255) NULL ,
	[UserName] NVARCHAR (255) NULL ,
	[PackageName] NVARCHAR (255) NULL ,
	[StartDateTime] DATETIME NULL ,
	[EndDateTime] DATETIME NULL ,
	[RowCount] MONEY NULL ,
	[Status] BIT NULL 
)