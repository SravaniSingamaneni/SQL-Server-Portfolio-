/*
Author: Sravani Sigamaneni
Procedure Name: usp_Save_Customer
Table: Customer
Exception Table: ExceptionLog
Description: Inserts a new customer record with TRY/CATCH exception handling.
*/

CREATE PROC usp_Save_Customer
(
@CustomerName varchar(100),
@Customer_DOB varchar(20),
@Cust_PhoneNumber varchar(15),
@Cust_Email varchar(100),
@Cust_Address1 varchar(500),
@Cust_Address2 varchar(500),
@Cust_City varchar(100),
@Cust_County varchar(100),
@Cust_ZipCode int,
@Cust_PaymentMethod varchar(20),
@Cust_AmountPaid decimal(18,2),
@Cust_Rewards int,
@Cust_TotalItems int,
@Cust_Orders int, 
@Cust_OrderNumber varchar(25),
@Cust_ReferenceNumber varchar(25) 
)
/* Stored procedure begins*/
AS
BEGIN
	/* Try and Catch blocks: to handle exceptions while inserting the customer data*/
	/* Try block starts */

	BEGIN TRY
		/*	CustomerId is an IDENTITY primary key, so SQL Server auto‑generates it.
			Cust_CreatedDate and Cust_ModifiedDate have default GETDATE() values,
			so they do not need to be passed from the UI.*/

		INSERT INTO Customer
			(
				CustomerName,Customer_DOB,Cust_PhoneNumber,
				Cust_Email,Cust_Address1,Cust_Address2,Cust_City,
				Cust_County,Cust_ZipCode,Cust_PaymentMethod,Cust_AmountPaid,
				Cust_Rewards,Cust_TotalItems,Cust_Orders,Cust_OrderNumber,
				Cust_ReferenceNumber
			) 
		VALUES
			(
				@CustomerName, @Customer_DOB, @Cust_PhoneNumber,
				@Cust_Email, @Cust_Address1, @Cust_Address2, @Cust_City, 
				@Cust_County, @Cust_ZipCode, @Cust_PaymentMethod, @Cust_AmountPaid,
				@Cust_Rewards, @Cust_TotalItems, @Cust_Orders, @Cust_OrderNumber,
				@Cust_ReferenceNumber
			)
		/* Sending custom message to UI to confirm that customer data is inserted */
		SELECT 'Customer Data Successfully added!' AS Cust_Message;
		RETURN 0

	END TRY
	/* Try block ends and Catch block starts*/
	BEGIN CATCH
	/* If any error occurs during insertion, control moves to the CATCH block.
	The error details are logged into the ExceptionLog table for future analysis.*/
		INSERT INTO ExceptionLog 
		(
			ErrorMessage,
            ErrorProcedure,
            ErrorLine,
            ErrorNumber,
            ErrorSeverity,
            ErrorState,
            InputParameters,
            UserName
		)
		VALUES
		(
			ERROR_MESSAGE(),
			ERROR_PROCEDURE(),
			ERROR_LINE(),
			ERROR_NUMBER(),
			ERROR_SEVERITY(),
			ERROR_STATE(),
			null,
			SUSER_NAME()
		)

		RETURN 1
	END CATCH
	/* Catch block ends */
END
/* Stored Procedure Ends*/