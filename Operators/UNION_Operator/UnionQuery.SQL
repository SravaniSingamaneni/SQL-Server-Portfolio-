/*
The SQL UNION Operator
The UNION operator is used to combine the result-set of two or more SELECT statements.

The UNION operator automatically removes duplicate rows from the result set.

Requirements for UNION:

Every SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in every SELECT statement must also be in the same order
UNION Syntax:
		SELECT column_name(s) FROM table1
		UNION
		SELECT column_name(s) FROM table2;
Note: The column names in the result-set are usually equal to the column names in the first SELECT statement.
*/

SELECT Country FROM Customers
UNION
SELECT Country FROM Suppliers
ORDER BY Country;
-----------------------------------------------------
SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;