/*
Author: Sravani Sigamaneni
Stored Procedure Name: usp_Delete_Customer
Table: Customer  
Built-in Function: STRING_SPLIT
Exception Table: ExceptionLog  
Description: Deletes one or more existing customer records using TRY/CATCH exception handling.
             The actual deleted data is captured by the delete trigger (trg_Customer_Delete)
             and stored in the CustomerHistory table.  
*/

CREATE PROC usp_Delete_Customer
(
@CustomerIds varchar(max)  -- Example '1786,7986,5823'
)
/* Stored procedure begins*/ 
AS
BEGIN
	/* Try and Catch blocks: to handle exceptions while deleting the customer data*/  
	/* Try block starts */  
	BEGIN TRY
		/* Delete customers based on the comma-separated CustomerId list.
           STRING_SPLIT converts the list into a table of values. */

		DELETE FROM Customer 
		WHERE CustomerId IN (SELECT VALUE FROM string_split(@CustomerIds, ','))

		/* Sending custom message to UI to confirm that customer data is deleted based on CustomerId */  
		SELECT 'Customers Data Deleted Successfully!' AS Cust_Message;
		RETURN 0
	END TRY
	/* Try block ends and Catch block starts*/  
	BEGIN CATCH
		/* If any error occurs during updating, control moves to the CATCH block.  The error details are logged into the ExceptionLog table for future analysis.*/  
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
	   @CustomerIds,  
	   SUSER_NAME()  
	  )  
  
	RETURN 1 
	END CATCH
	/* Catch block ends */  
END
/* Stored Procedure Ends*/