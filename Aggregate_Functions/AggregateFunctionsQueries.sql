/*
SQL Aggregate Functions
An aggregate function is a function that performs a calculation on a set of values, and returns a single value.

Aggregate functions are often used with the GROUP BY clause of the SELECT statement. 
The GROUP BY clause splits the result-set into groups of values and the aggregate function can be used 
to return a single value for each group.

The most commonly used SQL aggregate functions are:

MIN() - returns the smallest value of a column
MAX() - returns the largest value of a column
COUNT() - returns the number of rows in a set
SUM() - returns the sum of a numerical column
AVG() - returns the average value of a numerical column
Aggregate functions ignore null values (except for COUNT(*)).
*/

-----------------------------------------MIN-----------------------------------------------------------------------
SELECT MIN(Price)
FROM Products;
/*
Set Column Name (Alias)
When using MIN(), the returned column will not have a name.

Use the AS keyword to give the column a descriptive name:
*/
SELECT MIN(Price) AS SmallestPrice
FROM Products;

/*
Use MIN() with Date Column
The following SQL returns the earliest BirthDate in the BirthDate column, in the Employees table:
*/
SELECT MIN(BirthDate) AS EarliestBirthdate
FROM Employees;

/*
Use MIN() with GROUP BY
Here we use the MIN() function and the GROUP BY clause, to return the smallest price for each category in the Products table:
*/
SELECT MIN(Price) AS SmallestPrice, CategoryID
FROM Products
GROUP BY CategoryID;

-------------------------------------------MAX-----------------------------------------------------------------------
/*
The SQL MAX() Function
The MAX() function returns the largest value of the selected column.

The MAX() function works with numeric, string, and date data types.
*/

SELECT MAX(Price)
From Products;

-----------------------------------------------COUNT--------------------------------------------------------------------
/*
The SQL COUNT() Function
The COUNT() function returns the number of rows that matches a specified criterion.

COUNT() Syntax

		SELECT COUNT([DISTINCT] column_name | *)
		FROM table_name
		WHERE condition;

The behavior of COUNT() depends on the argument used within the parentheses:

COUNT(*) - Counts the total number of rows in a table (including NULL values).
COUNT(columnname) - Counts all non-null values in the column.
COUNT(DISTINCT columnname) - Counts only the unique, non-null values in the column.
Using COUNT(*)
The following SQL uses COUNT(*), and counts the total number of rows in the "Products" table (will include NULL values):
*/
SELECT COUNT(*)
FROM Products;
/*
Using COUNT(column_name)
The COUNT(column_name) counts all non-null values in the specified column.

The following SQL counts all non-null values of the "ProductName" column:
*/
SELECT COUNT(ProductName)
FROM Products;
/*
Using COUNT(DISTINCT column_name)
You can ignore duplicates by using the DISTINCT keyword.

The COUNT(DISTINCT column_name) counts only the unique, non-null values in the column.

If DISTINCT is specified, rows with the same value for the specified column will be counted as one.

The following SQL counts the unique, non-null values of the "Price" column:
*/
SELECT COUNT(DISTINCT Price)
FROM Products;
/*
Add a WHERE Clause
You can add a WHERE clause to specify conditions:
*/
SELECT COUNT(ProductID)
FROM Products
WHERE Price > 20;
/*
Use an Alias
When using COUNT(), the returned column will not have a name. Use the AS keyword to give the column a descriptive name.
*/
SELECT COUNT(*) AS [Number of records]
FROM Products;
/*
Use COUNT() with GROUP BY
Here we use the COUNT() function and the GROUP BY clause, to return the number of records for EACH category in the "Products" table:
*/
SELECT COUNT(*) AS [Number of records], CategoryID
FROM Products
GROUP BY CategoryID;

----------------------------------------------------------SUM------------------------------------------------------------
/*
The SQL SUM() Function
The SUM() function is used to calculate the total sum of values within a numeric column.

The SUM() function ignores NULL values in the column.

The following SQL returns the sum of the Quantity field in the "OrderDetails" table:
*/
SELECT SUM(Quantity)
FROM OrderDetails;

/*
Add a WHERE Clause
You can add a WHERE clause to specify conditions.

The following SQL returns the sum of the Quantity field for the product with ProductID = 11, in the "OrderDetails" table:
*/
SELECT SUM(Quantity)
FROM OrderDetails
WHERE ProductId = 11;

/*
SUM() With an Expression
The parameter inside the SUM() function can also be an expression.

If we assume that each product in the "OrderDetails" table costs 10 dollars, we can find the total earnings in dollars 
by multiply each quantity with 10:

Example
Use an expression inside the SUM() function:
*/
SELECT SUM(Quantity * 10)
FROM OrderDetails;

----------------------------------------------------------AVG---------------------------------------------------------
/*
The SQL AVG() Function
The AVG() function returns the average value of a numeric column.

The AVG() function ignores NULL values in the column.
*/
Select AVG(Price)
From Products

/*
Higher Than Average
To list all records with a higher price than average, we can use the AVG() function in a sub query:

Example
Return all products with a higher price than the average price:
*/
SELECT * FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);