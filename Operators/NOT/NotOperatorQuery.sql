/*
The NOT operator is also used in combination with other operators to exclude data, such as:

	NOT LIKE
	NOT BETWEEN
	NOT IN
	IS NOT NULL
	NOT EXISTS

The NOT operator is used in the WHERE clause to return all records that DO NOT match the specified criteria. 
It reverses the result of a condition from true to false and vice-versa.

In this example, the NOT operator is used in combination with the = operator.
*/

SELECT * FROM Customer (Nolock)
Where NOT CustomerName = 'JAMES DAVID'