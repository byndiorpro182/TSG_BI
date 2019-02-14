/*========================================================================
                 ----------------------- 
                 Proc_FACT_GetSummaryIncomeBySAOrder
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
@FromDate DATETIME  From date of the reporting period
@ToDate   DATETIME  To date of the reporting period

Module
1. Create table
2. Create paramater
3. Insert data into table with proc
========================================================================
How to Start?

Step 1 : Execute this File.
Step 2 : Run the SQL command below.
EXEC Proc_FACT_GetSummaryIncomeBySAOrder
@FromDate = '2000-01-01 00:00:00.000',
@ToDate    = '2100-12-31 23:59:59.000'
SELECT * FROM dbo.FACT_GetSummaryIncomeBySAOrder
========================================================================*/

/*========================================================================
1. Create table
========================================================================*/
CREATE OR ALTER PROCEDURE Proc_FACT_GetSummaryIncomeBySAOrder
@FromDate DATETIME,
@ToDate DATETIME
AS
BEGIN
	IF EXISTS (	SELECT * FROM INFORMATION_SCHEMA.TABLES
				WHERE Table_Schema = 'dbo' AND Table_Name = 'FACT_GetSummaryIncomeBySAOrder')
		BEGIN
			TRUNCATE TABLE dbo.FACT_GetSummaryIncomeBySAOrder
		END
	ELSE
		BEGIN
			CREATE TABLE FACT_GetSummaryIncomeBySAOrder(
				RowNum INT,
				SAOrderRefID UNIQUEIDENTIFIER,
				SAOrderRefNo NVARCHAR(255),
				SAORefDate DATETIME,
				AccountObjectCode NVARCHAR(255),
				AccountObjectName NVARCHAR(255),
				ReceiptAmount MONEY,
				ReduceReceiptAmount MONEY,
				PureReceiptAmount MONEY,
				SaleFundAmount MONEY,
				SaleExpenditureAmount MONEY,
				ManagementExpenditureAmount MONEY,
				OtherExpenditureAmount MONEY,
				ProfitAmount MONEY,
				ProfitRate MONEY,
				BranchName NVARCHAR(255)
			)
		END

/*========================================================================
2. Create paramater
========================================================================*/
	-- Tạo biến danh sách hóa đơn
	DECLARE @ListSAOrderRefID NVARCHAR(MAX)
	-- Trong ví dụ này lấy tất cả hóa đơn
	SELECT
		@ListSAOrderRefID = COALESCE(@ListSAOrderRefID + ',', ',') + CONVERT(nvarchar(50), RefID)
	FROM SAOrder
	SET @ListSAOrderRefID = LOWER(@ListSAOrderRefID + ',')

/*========================================================================
3. Insert data into table with proc
========================================================================*/
	INSERT INTO FACT_GetSummaryIncomeBySAOrder
	EXEC	[dbo].[Proc_SAR_GetSummaryIncomeBySAOrder]  @FromDate 					= @FromDate,
														@ToDate 					= @ToDate,
														@BranchID 					= NULL,
														@IncludeDependentBranch 	= 0,
														@ListSAOrderRefID 			= @ListSAOrderRefID,
														@IsWorkingWithManagementBook= 0

END

--DROP PROCEDURE Proc_FACT_GetSummaryIncomeBySAOrder