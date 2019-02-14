/*========================================================================
                 ----------------------- 
                 PROC_FACT_GetSalesBookDetail
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
EXEC PROC_FACT_GetSalesBookDetail
@FromDate = '2000-01-01 00:00:00.000',
@ToDate    = '2100-12-31 23:59:59.000'
SELECT * FROM dbo.FACT_GetSalesBookDetail
========================================================================*/


/*========================================================================
1. Create table
========================================================================*/
CREATE OR ALTER PROCEDURE PROC_FACT_GetSalesBookDetail
@FromDate DATETIME,
@ToDate DATETIME
AS
BEGIN
	IF EXISTS (SELECT
			*
		FROM INFORMATION_SCHEMA.TABLES
		WHERE Table_Schema = 'dbo'
		AND Table_Name = 'FACT_GetSalesBookDetail')
		BEGIN
			TRUNCATE TABLE dbo.FACT_GetSalesBookDetail
		END
	ELSE
		BEGIN
			CREATE TABLE FACT_GetSalesBookDetail (
				RowNum INT,
				RefID UNIQUEIDENTIFIER,
				RefDetailID UNIQUEIDENTIFIER,
				SaleLedgerID INT,
				PostedDate DATETIME,
				RefDate DATETIME,
				RefNo NVARCHAR(255),
				InvDate DATETIME,
				InvNo NVARCHAR(500),
				JournalMemo NVARCHAR(255),
				DESCRIPTION NVARCHAR(255),
				AccountObjectCode NVARCHAR(255),
				AccountObjectName NVARCHAR(255),
				AccountObjectAddress NVARCHAR(255),
				AccountObjectTaxCode NVARCHAR(255),
				Tel NVARCHAR(255),
				ContactName NVARCHAR(255),
				ContactTitle NVARCHAR(255),
				ContactMobile NVARCHAR(255),
				ContactEmail NVARCHAR(255),
				InventoryItemCode NVARCHAR(255),
				InventoryItemName NVARCHAR(500),
				IsPromotion BIT,
				UnitName NVARCHAR(255),
				SaleQuantity MONEY,
				PromotionSaleQuantity MONEY,
				PromotionSaleMainQuantity MONEY,
				PromotionReturnQuantity MONEY,
				PromotionReturnMainQuantity MONEY,
				NotPromotionSaleQuantity MONEY,
				NotPromotionSaleMainQuantity MONEY,
				NotPromotionReturnQuantity MONEY,
				NotPromotionReturnMainQuantity MONEY,
				ExchangeRate MONEY,
				UnitPriceOC MONEY,
				UnitPrice MONEY,
				FixedSaleUnitPrice MONEY,
				MainUnitName NVARCHAR(255),
				MainConvertRate MONEY,
				MainQuantity MONEY,
				MainUnitPrice MONEY,
				SaleAmountOC MONEY,
				SaleAmount MONEY,
				ExportTaxAmount MONEY,
				DiscountAmountOC MONEY,
				DiscountAmount MONEY,
				ReturnQuantity MONEY,
				ReturnMainQuantity MONEY,
				ReturnAmountOC MONEY,
				ReturnAmount MONEY,
				ReduceAmountOC MONEY,
				ReduceAmount MONEY,
				VATAmountOC MONEY,
				VATAmount MONEY,
				ReceiptAmountOC MONEY,
				ReceiptAmount MONEY,
				EmployeeCode NVARCHAR(255),
				EmployeeName NVARCHAR(255),
				OrganizationUnitCode NVARCHAR(255),
				DepartmentName NVARCHAR(255),
				ProvinceOrCity NVARCHAR(255),
				District NVARCHAR(255),
				WardOrCommune NVARCHAR(255),
				OrderRefNo NVARCHAR(255),
				ContractCode NVARCHAR(255),
				RefType INT,
				RefTypeName NVARCHAR(500),
				AccountObjectGroupListCode NVARCHAR(MAX),
				AccountObjectCategoryName NVARCHAR(MAX),
				InventoryItemCategoryCode NVARCHAR(MAX),
				InventoryItemCategoryName NVARCHAR(MAX),
				InventoryItemSource NVARCHAR(MAX),
				BranchName NVARCHAR(255),
				ListItemCode NVARCHAR(MAX),
				ListItemName NVARCHAR(MAX),
				MasterCustomField1 NVARCHAR(255),
				MasterCustomField2 NVARCHAR(255),
				MasterCustomField3 NVARCHAR(255),
				MasterCustomField4 NVARCHAR(255),
				MasterCustomField5 NVARCHAR(255),
				MasterCustomField6 NVARCHAR(255),
				MasterCustomField7 NVARCHAR(255),
				MasterCustomField8 NVARCHAR(255),
				MasterCustomField9 NVARCHAR(255),
				MasterCustomField10 NVARCHAR(255),
				CustomField1 NVARCHAR(255),
				CustomField2 NVARCHAR(255),
				CustomField3 NVARCHAR(255),
				CustomField4 NVARCHAR(255),
				CustomField5 NVARCHAR(255),
				CustomField6 NVARCHAR(255),
				CustomField7 NVARCHAR(255),
				CustomField8 NVARCHAR(255),
				CustomField9 NVARCHAR(255),
				CustomField10 NVARCHAR(255),
				StockCode INT,
				StockName NVARCHAR(255),
				DebitAccount INT,
				CreditAccount INT,
				DiscountAccount INT,
				VATAccount INT,
				ExportTaxAccount INT,
				LotNo NVARCHAR(255),
				ExpiryDate NVARCHAR(255),
				PanelLengthQuantity MONEY,
				PanelHeightQuantity MONEY,
				PanelWidthQuantity MONEY,
				PanelRadiusQuantity MONEY,
				PanelQuantity MONEY,
				ProjectWorkCode NVARCHAR(255),
				ProjectWorkName NVARCHAR(255),
				CostUnitPrice MONEY,
				CostAmount MONEY,
				OutWardInwardRefNo NVARCHAR(255),
				CostAccount INT,
				StockAccount INT
			)
		END

/*========================================================================
2. Create paramater
========================================================================*/
	-- Tạo biến danh sách hàng hóa và danh sách khách hàng
	DECLARE @listInventoryItemID nvarchar(max)
	DECLARE @listAccountObjectID nvarchar(max)
	-- Trong ví dụ này lấy tất cả danh sách hàng hóa
	SELECT
		@listInventoryItemID = COALESCE(@listInventoryItemID + ',', ',') + CONVERT(nvarchar(50), InventoryItemID)
	FROM InventoryItem
	SET @listInventoryItemID = LOWER(@listInventoryItemID + ',')

	-- Trong ví dụ này lấy tất cả khách hàng
	SELECT
		@listAccountObjectID = COALESCE(@listAccountObjectID + ',', ',') + CONVERT(nvarchar(50), AccountObjectID)
	FROM AccountObject
	SET @listAccountObjectID = LOWER(@listAccountObjectID + ',')

/*========================================================================
3. Insert data into table with proc
========================================================================*/
	INSERT INTO FACT_GetSalesBookDetail
	EXEC [dbo].[Proc_SAR_GetSalesBookDetail]	@FromDate 					= @FromDate,    --'2000-12-01 00:00:00.000',
												@ToDate 					= @ToDate, --'2100-12-23 23:59:59.000',
												@BranchID 					= NULL,
												@IncludeDependentBranch 	= 0,
												@InventoryItemID 			= @listInventoryItemID,
												@OrganizationUnitID 		= NULL,
												@AccountObjectID 			= @listAccountObjectID,
												@EmployeeID 				= NULL,
												@AccountObjectGroupID 		= NULL,
												@IsWorkingWithManagementBook= 0

END

--DROP PROCEDURE PROC_FACT_GetSalesBookDetail