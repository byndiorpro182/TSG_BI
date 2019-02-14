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
CREATE OR ALTER PROCEDURE PROC_FACT_GetReceivableDetailByInvoice
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


