/*
The IS NULL operator is used to test for empty values (NULL values).

The following SQL lists all customers with a NULL value in the "Cust_Address1" field
*/

Select CustomerId, CustomerName, Cust_Address1 
from Customer (Nolock)
Where Cust_Address1 IS NULL

/*
The IS NOT NULL operator is used to test for non-empty values (NOT NULL values).

The following SQL lists all customers with a value in the "Cust_Address1" field:
*/

Select CustomerId, CustomerName, Cust_Address2 
from Customer (Nolock)
Where Cust_Address1 IS NOT NULL