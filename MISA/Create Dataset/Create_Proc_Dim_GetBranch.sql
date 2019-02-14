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

CREATE OR ALTER PROCEDURE PROC_DIM_GetBranch
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
