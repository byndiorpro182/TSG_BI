/*========================================================================
                 ----------------------- 
                 PROC_DIM_GetBranch
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
1. Create table
2. Create paramater
3. Insert data into table with proc
========================================================================
How to Start?

Step 1 : Execute this File.
Step 2 : Run the SQL command below.
EXEC PROC_DIM_GetBranch
SELECT * FROM dbo.DIM_GetBranch
========================================================================*/

/*========================================================================
1. Create table
========================================================================*/

CREATE /*OR ALTER*/ PROCEDURE PROC_DIM_GetBranch
AS
BEGIN
	IF EXISTS (SELECT
			*
		FROM INFORMATION_SCHEMA.TABLES
		WHERE Table_Schema = 'dbo'
		AND Table_Name = 'DIM_GetBranch')
		BEGIN
			TRUNCATE TABLE dbo.DIM_GetBranch
		END
	ELSE
		BEGIN
			CREATE TABLE DIM_GetBranch(
				OrganizationUnitID UNIQUEIDENTIFIER,
				BranchID UNIQUEIDENTIFIER,
				OrganizationUnitCode NVARCHAR(255),
				OrganizationUnitName NVARCHAR(255),
				IsSystem BIT,
				MISACodeID NVARCHAR(255),
				Grade NVARCHAR(255),
				ParentID UNIQUEIDENTIFIER,
				IsParent BIT,
				Address NVARCHAR(255),
				OrganizationUnitTypeID INT,
				BusinessRegistrationNumber NVARCHAR(255),
				BusinessRegistrationNumberIssuedDate DATETIME,
				BusinessRegistrationNumberIssuedPlace NVARCHAR(255),
				IsDependent BIT,
				IsPrivateVATDeclaration BIT,
				CostAccount NVARCHAR(255),
				Inactive NVARCHAR(255),
				CompanyTaxCode NVARCHAR(255),
				CompanyTel NVARCHAR(255),
				CompanyFax NVARCHAR(255),
				CompanyEmail NVARCHAR(255),
				CompanyWebsite NVARCHAR(255),
				CompanyBankAccountID NVARCHAR(255),
				CompanyOwnerName NVARCHAR(255),
				CompanyOwnerTaxCode NVARCHAR(255),
				DirectorTitle NVARCHAR(255),
				DirectorName NVARCHAR(255),
				ChiefOfAccountingTitle NVARCHAR(255),
				ChiefOfAccountingName NVARCHAR(255),
				StoreKeeperTitle NVARCHAR(255),
				StoreKeeperName NVARCHAR(255),
				CashierTitle NVARCHAR(255),
				CashierName NVARCHAR(255),
				ReporterTitle NVARCHAR(255),
				ReporterName NVARCHAR(255),
				IsPrintSigner BIT,
				IsGetReporterNameByUserLogIn BIT,
				CreatedBy NVARCHAR(255),
				CreatedDate DATETIME,
				ModifiedBy NVARCHAR(255),
				ModifiedDate DATETIME,
				SortMISACodeID NVARCHAR(500),
				CompanyDistrict NVARCHAR(500),
				CompanyCity NVARCHAR(500)
			)
		END
/*========================================================================
2. Create paramater
========================================================================*/
--NULL
/*========================================================================
3. Insert data into table with select * from OrganizationUnit
========================================================================*/

	INSERT INTO dbo.DIM_GetBranch
	SELECT * FROM dbo.OrganizationUnit
END

--DROP PROCEDURE PROC_DIM_GetBranch

GO

/*========================================================================
                 ----------------------- 
                 PROC_DIM_GetCustomer
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
EXEC PROC_DIM_GetCustomer
@FromDate = '2000-01-01 00:00:00.000',
@ToDate    = '2100-12-31 23:59:59.000'
SELECT * FROM dbo.DIM_GetCustomer
========================================================================*/

/*========================================================================
1. Create table
========================================================================*/

CREATE /*OR ALTER*/ PROCEDURE PROC_DIM_GetCustomer
@FromDate DATETIME,
@ToDate DATETIME
AS
BEGIN
	IF EXISTS (SELECT
			*
		FROM INFORMATION_SCHEMA.TABLES
		WHERE Table_Schema = 'dbo'
		AND Table_Name = 'DIM_GetCustomer')
		BEGIN
			TRUNCATE TABLE dbo.DIM_GetCustomer
		END
	ELSE
		BEGIN
			CREATE TABLE DIM_GetCustomer(
				AccountObjectID UNIQUEIDENTIFIER,
				AccountObjectCode NVARCHAR(255),
				AccountObjectName NVARCHAR(255),
				Gender BIT,
				BirthDate DATETIME,
				BirthPlace NVARCHAR(255),
				AgreementSalary MONEY,
				SalaryCoefficient MONEY,
				NumberOfDependent INT,
				InsuranceSalary MONEY,
				BankAccount NVARCHAR(255),
				BankName NVARCHAR(500),
				Address NVARCHAR(500),
				AccountObjectGroupList NVARCHAR(MAX),
				AccountObjectGroupListCode NVARCHAR(MAX),
				CompanyTaxCode NVARCHAR(255),
				Tel NVARCHAR(255),
				Mobile NVARCHAR(255),
				Fax NVARCHAR(255),
				EmailAddress NVARCHAR(255),
				Website NVARCHAR(255),
				PaymentTermID UNIQUEIDENTIFIER,
				MaximizeDebtAmount MONEY,
				DueTime DATETIME,
				IdentificationNumber NVARCHAR(255),
				IssueDate NVARCHAR(255),
				IssueBy NVARCHAR(255),
				Country NVARCHAR(255),
				ProvinceOrCity NVARCHAR(255),
				District NVARCHAR(255),
				WardOrCommune NVARCHAR(255),
				Prefix NVARCHAR(255),
				ContactName NVARCHAR(255),
				ContactTitle NVARCHAR(255),
				ContactMobile NVARCHAR(255),
				OtherContactMobile NVARCHAR(255),
				ContactFixedTel NVARCHAR(255),
				ContactEmail NVARCHAR(255),
				ContactAddress NVARCHAR(255),
				IsVendor BIT,
				IsCustomer BIT,
				IsEmployee BIT,
				AccountObjectType INT,
				Inactive INT,
				OrganizationUnitID UNIQUEIDENTIFIER,
				BranchID UNIQUEIDENTIFIER,
				CreatedDate DATETIME,
				CreatedBy NVARCHAR(255),
				ModifiedDate DATETIME,
				ModifiedBy NVARCHAR(255),
				ReceiptableDebtAmount NVARCHAR(255),
				ShippingAddress NVARCHAR(255),
				AccountObjectGroupListName NVARCHAR(255),
				EmployeeID UNIQUEIDENTIFIER,
				Description NVARCHAR(255),
				BankBranchName NVARCHAR(255),
				BankProvinceOrCity NVARCHAR(255),
				LegalRepresentative NVARCHAR(255),
				EInvoiceContactName NVARCHAR(255),
				EInvoiceContactEmail NVARCHAR(255),
				EInvoiceContactAddress NVARCHAR(500),
				EInvoiceContactMobile NVARCHAR(255)
			)
		END
/*========================================================================
2. Create paramater
========================================================================*/
--NULL
/*========================================================================
3. Insert data into table with select * from AccountObject
========================================================================*/

	INSERT INTO dbo.DIM_GetCustomer
	SELECT * FROM dbo.AccountObject
	WHERE
		dbo.AccountObject.IsCustomer = 1
	AND
		dbo.AccountObject.CreatedDate > @FromDate
	AND
		dbo.AccountObject.CreatedDate < @ToDate
END

--DROP PROCEDURE PROC_DIM_GetCustomer

GO

/*========================================================================
                 ----------------------- 
                 PROC_DIM_GetEmployee
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
EXEC PROC_DIM_GetEmployee
@FromDate = '2000-01-01 00:00:00.000',
@ToDate    = '2100-12-31 23:59:59.000'
SELECT * FROM dbo.DIM_GetEmployee
========================================================================*/

/*========================================================================
1. Create table
========================================================================*/

CREATE /*OR ALTER*/ PROCEDURE PROC_DIM_GetEmployee
@FromDate DATETIME,
@ToDate DATETIME
AS
BEGIN
	IF EXISTS (SELECT
			*
		FROM INFORMATION_SCHEMA.TABLES
		WHERE Table_Schema = 'dbo'
		AND Table_Name = 'DIM_GetEmployee')
		BEGIN
			TRUNCATE TABLE dbo.DIM_GetEmployee
		END
	ELSE
		BEGIN
			CREATE TABLE DIM_GetEmployee(
				AccountObjectID UNIQUEIDENTIFIER,
				AccountObjectCode NVARCHAR(255),
				AccountObjectName NVARCHAR(255),
				Gender BIT,
				BirthDate DATETIME,
				BirthPlace NVARCHAR(255),
				AgreementSalary MONEY,
				SalaryCoefficient MONEY,
				NumberOfDependent INT,
				InsuranceSalary MONEY,
				BankAccount NVARCHAR(255),
				BankName NVARCHAR(500),
				Address NVARCHAR(500),
				AccountObjectGroupList NVARCHAR(MAX),
				AccountObjectGroupListCode NVARCHAR(MAX),
				CompanyTaxCode NVARCHAR(255),
				Tel NVARCHAR(255),
				Mobile NVARCHAR(255),
				Fax NVARCHAR(255),
				EmailAddress NVARCHAR(255),
				Website NVARCHAR(255),
				PaymentTermID UNIQUEIDENTIFIER,
				MaximizeDebtAmount MONEY,
				DueTime DATETIME,
				IdentificationNumber NVARCHAR(255),
				IssueDate NVARCHAR(255),
				IssueBy NVARCHAR(255),
				Country NVARCHAR(255),
				ProvinceOrCity NVARCHAR(255),
				District NVARCHAR(255),
				WardOrCommune NVARCHAR(255),
				Prefix NVARCHAR(255),
				ContactName NVARCHAR(255),
				ContactTitle NVARCHAR(255),
				ContactMobile NVARCHAR(255),
				OtherContactMobile NVARCHAR(255),
				ContactFixedTel NVARCHAR(255),
				ContactEmail NVARCHAR(255),
				ContactAddress NVARCHAR(255),
				IsVendor BIT,
				IsCustomer BIT,
				IsEmployee BIT,
				AccountObjectType INT,
				Inactive INT,
				OrganizationUnitID UNIQUEIDENTIFIER,
				BranchID UNIQUEIDENTIFIER,
				CreatedDate DATETIME,
				CreatedBy NVARCHAR(255),
				ModifiedDate DATETIME,
				ModifiedBy NVARCHAR(255),
				ReceiptableDebtAmount NVARCHAR(255),
				ShippingAddress NVARCHAR(255),
				AccountObjectGroupListName NVARCHAR(255),
				EmployeeID UNIQUEIDENTIFIER,
				Description NVARCHAR(255),
				BankBranchName NVARCHAR(255),
				BankProvinceOrCity NVARCHAR(255),
				LegalRepresentative NVARCHAR(255),
				EInvoiceContactName NVARCHAR(255),
				EInvoiceContactEmail NVARCHAR(255),
				EInvoiceContactAddress NVARCHAR(500),
				EInvoiceContactMobile NVARCHAR(255)
			)
		END
/*========================================================================
2. Create paramater
========================================================================*/
--NULL
/*========================================================================
3. Insert data into table with select * from AccountObject
========================================================================*/

	INSERT INTO dbo.DIM_GetEmployee
	SELECT * FROM dbo.AccountObject
	WHERE
		dbo.AccountObject.IsEmployee = 1
	AND
		dbo.AccountObject.CreatedDate > @FromDate
	AND
		dbo.AccountObject.CreatedDate < @ToDate
END

--DROP PROCEDURE PROC_DIM_GetEmployee

GO

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

CREATE /*OR ALTER*/ PROCEDURE PROC_DIM_GetInventory
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

GO

/*========================================================================
                 ----------------------- 
                 PROC_DIM_GetVendor
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
EXEC PROC_DIM_GetVendor
@FromDate = '2000-01-01 00:00:00.000',
@ToDate    = '2100-12-31 23:59:59.000'
SELECT * FROM dbo.DIM_GetVendor
========================================================================*/

/*========================================================================
1. Create table
========================================================================*/

CREATE /*OR ALTER*/ PROCEDURE PROC_DIM_GetVendor
@FromDate DATETIME,
@ToDate DATETIME
AS
BEGIN
	IF EXISTS (SELECT
			*
		FROM INFORMATION_SCHEMA.TABLES
		WHERE Table_Schema = 'dbo'
		AND Table_Name = 'DIM_GetVendor')
		BEGIN
			TRUNCATE TABLE dbo.DIM_GetVendor
		END
	ELSE
		BEGIN
			CREATE TABLE DIM_GetVendor(
				AccountObjectID UNIQUEIDENTIFIER,
				AccountObjectCode NVARCHAR(255),
				AccountObjectName NVARCHAR(255),
				Gender BIT,
				BirthDate DATETIME,
				BirthPlace NVARCHAR(255),
				AgreementSalary MONEY,
				SalaryCoefficient MONEY,
				NumberOfDependent INT,
				InsuranceSalary MONEY,
				BankAccount NVARCHAR(255),
				BankName NVARCHAR(500),
				Address NVARCHAR(500),
				AccountObjectGroupList NVARCHAR(MAX),
				AccountObjectGroupListCode NVARCHAR(MAX),
				CompanyTaxCode NVARCHAR(255),
				Tel NVARCHAR(255),
				Mobile NVARCHAR(255),
				Fax NVARCHAR(255),
				EmailAddress NVARCHAR(255),
				Website NVARCHAR(255),
				PaymentTermID UNIQUEIDENTIFIER,
				MaximizeDebtAmount MONEY,
				DueTime DATETIME,
				IdentificationNumber NVARCHAR(255),
				IssueDate NVARCHAR(255),
				IssueBy NVARCHAR(255),
				Country NVARCHAR(255),
				ProvinceOrCity NVARCHAR(255),
				District NVARCHAR(255),
				WardOrCommune NVARCHAR(255),
				Prefix NVARCHAR(255),
				ContactName NVARCHAR(255),
				ContactTitle NVARCHAR(255),
				ContactMobile NVARCHAR(255),
				OtherContactMobile NVARCHAR(255),
				ContactFixedTel NVARCHAR(255),
				ContactEmail NVARCHAR(255),
				ContactAddress NVARCHAR(255),
				IsVendor BIT,
				IsCustomer BIT,
				IsEmployee BIT,
				AccountObjectType INT,
				Inactive INT,
				OrganizationUnitID UNIQUEIDENTIFIER,
				BranchID UNIQUEIDENTIFIER,
				CreatedDate DATETIME,
				CreatedBy NVARCHAR(255),
				ModifiedDate DATETIME,
				ModifiedBy NVARCHAR(255),
				ReceiptableDebtAmount NVARCHAR(255),
				ShippingAddress NVARCHAR(255),
				AccountObjectGroupListName NVARCHAR(255),
				EmployeeID UNIQUEIDENTIFIER,
				Description NVARCHAR(255),
				BankBranchName NVARCHAR(255),
				BankProvinceOrCity NVARCHAR(255),
				LegalRepresentative NVARCHAR(255),
				EInvoiceContactName NVARCHAR(255),
				EInvoiceContactEmail NVARCHAR(255),
				EInvoiceContactAddress NVARCHAR(500),
				EInvoiceContactMobile NVARCHAR(255)
			)
		END
/*========================================================================
2. Create paramater
========================================================================*/
--NULL
/*========================================================================
3. Insert data into table with select * from AccountObject
========================================================================*/

	INSERT INTO dbo.DIM_GetVendor
	SELECT * FROM dbo.AccountObject
	WHERE
		dbo.AccountObject.IsVendor = 1
	AND
		dbo.AccountObject.CreatedDate > @FromDate
	AND
		dbo.AccountObject.CreatedDate < @ToDate
END

--DROP PROCEDURE PROC_DIM_GetVendor

GO

/*========================================================================
                 ----------------------- 
                 PROC_FACT_GetReceivableDetailByInvoice
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
EXEC PROC_FACT_GetReceivableDetailByInvoice
@FromDate = '2000-01-01 00:00:00.000',
@ToDate    = '2100-12-31 23:59:59.000'
SELECT * FROM dbo.FACT_GetReceivableDetailByInvoice
========================================================================*/

/*========================================================================
1. Create table
========================================================================*/
CREATE /*OR ALTER*/ PROCEDURE PROC_FACT_GetReceivableDetailByInvoice
@FromDate DATETIME,
@ToDate DATETIME
AS
BEGIN
    IF EXISTS(  SELECT * FROM INFORMATION_SCHEMA.TABLES
                WHERE Table_Schema = 'dbo' AND Table_Name = 'FACT_GetReceivableDetailByInvoice')
        BEGIN
            TRUNCATE TABLE dbo.FACT_GetReceivableDetailByInvoice
        END    
    ELSE
        BEGIN
            CREATE TABLE FACT_GetReceivableDetailByInvoice(
                RowNum INT,
                AccountObjectCode NVARCHAR(255),
                AccountObjectName NVARCHAR(255),
                AccountObjectAddress NVARCHAR(500),
                AccountObjectGroupListCode NVARCHAR(MAX),
                AccountObjectGroupListName NVARCHAR(MAX),
                RefID UNIQUEIDENTIFIER,
                Reftype INT,
                PostedDate DATETIME,
                RefDate DATETIME,
                RefNo NVARCHAR(255),
                InvDate DATETIME,
                InvNo NVARCHAR(255),
                JournalMemo NVARCHAR(255),
                DueDate DATETIME,
                ExchangeRate MONEY,
                InvoiceAmountOC MONEY,
                InvoiceAmount MONEY,
                ExchangeDifferenceAmount MONEY,
                ReturnDiscountAmountOC MONEY,
                ReturnDiscountAmount MONEY,
                DiscountPaymentAmountOC MONEY,
                DiscountPaymentAmount MONEY,
                PaidAmountOC MONEY,
                PaidAmount MONEY,
                RemainAmountOC MONEY,
                RemainAmount MONEY,
                RemainDebtDay INT,
                RemainDebtGroup NVARCHAR(255),
                OverDebtDay INT,
                OverDebtGroup NVARCHAR(255),
                DebtStatus NVARCHAR(255),
                EmployeeName NVARCHAR(255),
                BranchName NVARCHAR(255),
                VATAmount MONEY,
                VATAmountOC MONEY,
                SaleAmount MONEY,
                SaleAmountOC MONEY,
                MasterCustomField1 NVARCHAR(255),
                MasterCustomField2 NVARCHAR(255),
                MasterCustomField3 NVARCHAR(255),
                MasterCustomField4 NVARCHAR(255),
                MasterCustomField5 NVARCHAR(255),
                MasterCustomField6 NVARCHAR(255),
                MasterCustomField7 NVARCHAR(255),
                MasterCustomField8 NVARCHAR(255),
                MasterCustomField9 NVARCHAR(255),
                MasterCustomField10 NVARCHAR(255)
            )
        END

/*========================================================================
2. Create paramater
========================================================================*/
    -- Tạo biến danh sách khách hàng
    DECLARE @listAccountObjectID nvarchar(max)
    -- Trong ví dụ này lấy tất cả danh sách khách hàng
    SELECT
        @listAccountObjectID = COALESCE(@listAccountObjectID + ',', ',') + CONVERT(nvarchar(50), AccountObjectID)
    FROM AccountObject
    SET @listAccountObjectID = LOWER(@listAccountObjectID + ',')

/*========================================================================
3. Insert data into table with proc
========================================================================*/
    INSERT INTO dbo.FACT_GetReceivableDetailByInvoice
    EXEC [dbo].[Proc_SAR_GetReceivableDetailByInvoice]  @FromDate                   = @FromDate,
                                                        @ToDate                     = @ToDate,
                                                        @BranchID                   = NULL,
                                                        @AccountNumber              = N'131',
                                                        @CurrencyID                 = N'VND',
                                                        @AccountObjectID            = @listAccountObjectID,
                                                        @IsWorkingWithManagementBook= 0,
                                                        @IncludeDependentBranch     = 0
END

--DROP PROCEDURE PROC_FACT_GetReceivableDetailByInvoice

GO

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
CREATE /*OR ALTER*/ PROCEDURE PROC_FACT_GetSalesBookDetail
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

GO

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
CREATE /*OR ALTER*/ PROCEDURE Proc_FACT_GetSummaryIncomeBySAOrder
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

GO



