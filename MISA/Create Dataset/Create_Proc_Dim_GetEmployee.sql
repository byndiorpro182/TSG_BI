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

CREATE OR ALTER PROCEDURE PROC_DIM_GetEmployee
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
