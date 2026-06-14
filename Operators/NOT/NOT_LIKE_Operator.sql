/*
The NOT LIKE operator is used in the WHERE clause to exclude rows that match a specified character pattern.

There are two wildcards often used in conjunction with the NOT LIKE operator:

A percent sign % - represents zero, one, or multiple characters
A underscore sign _ - represents a single character
The following SQL selects all customers that do NOT start with the letter "A":
*/

SELECT * FROM Customer
WHERE CustomerName NOT LIKE 'A%';