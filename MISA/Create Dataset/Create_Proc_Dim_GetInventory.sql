/*========================================================================
                 ----------------------- 
                 PROC_DIM_GetInventory
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
@FromDate DATETIME  From date of the Created Date
@ToDate   DATETIME  To date of the Created Date

Module
1. Create table
2. Create paramater
3. Insert data into table with proc
========================================================================
How to Start?

Step 1 : Execute this File.
Step 2 : Run the SQL command below.
EXEC PROC_DIM_GetInventory
@FromDate = '2000-01-01 00:00:00.000',
@ToDate    = '2100-12-31 23:59:59.000'
SELECT * FROM dbo.DIM_GetInventory
========================================================================*/

/*========================================================================
1. Create table
========================================================================*/

CREATE OR ALTER PROCEDURE PROC_DIM_GetInventory
@FromDate DATETIME,
@ToDate DATETIME
AS
BEGIN
	IF EXISTS (SELECT
			*
		FROM INFORMATION_SCHEMA.TABLES
		WHERE Table_Schema = 'dbo'
		AND Table_Name = 'DIM_GetInventory')
		BEGIN
			TRUNCATE TABLE dbo.DIM_GetInventory
		END
	ELSE
		BEGIN
			CREATE TABLE DIM_GetInventory(
				InventoryItemID UNIQUEIDENTIFIER,
				BranchID UNIQUEIDENTIFIER,
				BarCode NVARCHAR(255),
				InventoryItemCode NVARCHAR(255),
				InventoryItemName NVARCHAR(255),
				InventoryItemType INT,
				InventoryItemCategoryList NVARCHAR(MAX),
				InventoryItemCategoryCode NVARCHAR(MAX),
				Description NVARCHAR(255),
				UnitID UNIQUEIDENTIFIER,
				GuarantyPeriod NVARCHAR(255),
				MinimumStock MONEY,
				InventoryItemSource NVARCHAR(255),
				DefaultStockID UNIQUEIDENTIFIER,
				InventoryAccount NVARCHAR(255),
				COGSAccount NVARCHAR(255),
				SaleAccount NVARCHAR(255),
				PurchaseDiscountRate MONEY,
				UnitPrice MONEY,
				SalePrice1 MONEY,
				SalePrice2 MONEY,
				SalePrice3 MONEY,
				FixedSalePrice MONEY,
				IsUnitPriceAfterTax BIT,
				TaxRate MONEY,
				ImportTaxRate MONEY,
				ExportTaxRate MONEY,
				InventoryCategorySpecialTaxID UNIQUEIDENTIFIER,
				IsSystem BIT,
				Inactive BIT,
				IsSaleDiscount BIT,
				DiscountType INT,
				IsFollowSerialNumber BIT,
				CostMethod INT,
				CreatedDate DATETIME,
				CreatedBy NVARCHAR(255),
				ModifiedDate DATETIME,
				ModifiedBy NVARCHAR(255),
				InventoryItemCategoryName NVARCHAR(MAX),
				Specificity NVARCHAR(MAX),
				PurchaseDescription NVARCHAR(255),
				SaleDescription NVARCHAR(255),
				TACareerGroupID INT,
				Image VARBINARY(MAX),
				FixedUnitPrice MONEY,
				FrontEndFormula NVARCHAR(MAX),
				BackEndFormula NVARCHAR(MAX),
				BaseOnFormula INT,
				DiscountAccount NVARCHAR(255),
				SaleOffAccount NVARCHAR(255),
				ReturnAccount NVARCHAR(255)
			)
		END
/*========================================================================
2. Create paramater
========================================================================*/
--NULL
/*========================================================================
3. Insert data into table with select * from InventoryItem
========================================================================*/

	INSERT INTO dbo.DIM_GetInventory
	SELECT * FROM dbo.InventoryItem
	WHERE
		dbo.InventoryItem.CreatedDate > @FromDate
	AND
		dbo.InventoryItem.CreatedDate < @ToDate
END

--DROP PROCEDURE PROC_DIM_GetInventory