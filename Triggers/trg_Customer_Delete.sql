/*
Author: Sravani Singamaneni
Trigger Name: trg_Customer_Delete
Table: Customer
History Table: CustomerHistory
Description: AFTER DELETE trigger that automatically logs deleted customer 
             records into the CustomerHistory table for auditing and recovery.
*/

CREATE TRIGGER trg_Customer_Delete
ON Customer -- customer is tablename
AFTER DELETE 
AS
BEGIN
	SET NOCOUNT ON;
	/*
        The 'deleted' virtual table contains all rows that were deleted 
        from the Customer table. This trigger inserts those rows into 
        the CustomerHistory table for future reference or restoration.
    */

    INSERT INTO CustomerHistory
    (
        CustomerId,
        CustomerName,
        Customer_DOB,
        Cust_PhoneNumber,
        Cust_Email,
        Cust_Address1,
        Cust_Address2,
        Cust_City,
        Cust_County,
        Cust_ZipCode,
        Cust_PaymentMethod,
        Cust_AmountPaid,
        Cust_Rewards,
        Cust_TotalItems,
        Cust_Orders,
        Cust_OrderNumber,
        Cust_ReferenceNumber,
        Cust_CreatedDate,
        Cust_ModifiedDate,
        DeletedDate,
        DeletedBy
    )
    SELECT
        CustomerId,
        CustomerName,
        Customer_DOB,
        Cust_PhoneNumber,
        Cust_Email,
        Cust_Address1,
        Cust_Address2,
        Cust_City,
        Cust_County,
        Cust_ZipCode,
        Cust_PaymentMethod,
        Cust_AmountPaid,
        Cust_Rewards,
        Cust_TotalItems,
        Cust_Orders,
        Cust_OrderNumber,
        Cust_ReferenceNumber,
        Cust_CreatedDate,
        Cust_ModifiedDate,
        GETDATE() AS DeletedDate,
        SUSER_NAME() AS DeletedBy
    FROM deleted;
END;
GO