/*SQL Server example*/

Select TOP 5 * 
from Customer (Nolock)

/*MySQL - The LIMIT Clause*/

SELECT * FROM Customer
LIMIT 3;

/*Oracle - The FETCH FIRST Clause*/

SELECT * FROM Customer
FETCH FIRST 3 ROWS ONLY;

/*
SQL TOP PERCENT Example
Here we will use the SELECT TOP clause with the percent syntax.

The following SQL selects the first 50% of the records from the "Customers" table (for SQL Server/MS Access):
*/

SELECT TOP 50 PERCENT * FROM Customers;

SELECT * FROM Customers
FETCH FIRST 50 PERCENT ROWS ONLY;

SELECT TOP 3 * FROM Customers
WHERE Country = 'Germany';

SELECT * FROM Customers
WHERE Country = 'Germany'
LIMIT 3;

SELECT * FROM Customers
WHERE Country = 'Germany'
FETCH FIRST 3 ROWS ONLY;

/*
SELECT TOP and ORDER BY
Add the ORDER BY keyword when you want to sort the result, and return the first 3 records of the sorted result.

For SQL Server and MS Access:
*/

SELECT TOP 3 * FROM Customers
ORDER BY CustomerName DESC;

SELECT * FROM Customers
ORDER BY CustomerName DESC
LIMIT 3;

SELECT * FROM Customers
ORDER BY CustomerName DESC
FETCH FIRST 3 ROWS ONLY;