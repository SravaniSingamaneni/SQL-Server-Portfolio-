/*
Wildcard Characters
Symbol	Description
%	Represents zero or more characters
_	Represents a single character
[]	Represents any single character within the brackets *
^	Represents any character not in the brackets *
-	Represents any single character within the specified range *
{}	Represents any escaped character **
* Not supported in PostgreSQL and MySQL databases.

** Supported only in Oracle databases.
*/

--Diaplay Data based on whose CustomerName STARTs with letter G and City is NEWARK
select * from Customer (Nolock)
where Cust_City ='Newark' AND CustomerName LIKE 'G%'

-- Display only whose CustomerName STARTs with letter D and the excepted output columns areCustomerName,Customer_DOB, Cust_PhoneNumber
Select CustomerName,Customer_DOB, Cust_PhoneNumber
from Customer (Nolock)
where CustomerName LIKE 'D%'

-- Display only only whose customerName STARTs with word JAMES
select * from Customer (Nolock)
Where CustomerName LIKE '%JAMES%'

--Select all NEWARK customers that starts with either "D" or "A"
select * from Customer(Nolock)
where Cust_City ='Newark' AND (CustomerName LIKE 'D%' OR CustomerName LIKE 'A%')

--Without parenthesis, the SQL above will return all customers from Spain that starts with a "D", plus all customers that starts with an "A", regardless of the country value:
select * from Customer(Nolock)
where Cust_City ='Newark' AND CustomerName LIKE 'D%' OR CustomerName LIKE 'A%'

--Return all customers that starts with "b" and ends with "s":
SELECT * FROM Customer
WHERE CustomerName LIKE 'b%s';

--Return all customers that starts with "a" and are at least 3 characters in length:
SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';

--Return all customers that have "r" in the second position:
SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

--Return all customers from a City that starts with 'l' followed by one wildcard character, then 'nd' and then two wildcard characters:
SELECT * FROM Customers
WHERE city LIKE 'l_nd__';

--Return all customers starting with either "b", "s", or "p":
SELECT * FROM Customers
WHERE CustomerName LIKE '[bsp]%';

--Return all customers starting with "a", "b", "c", "d", "e" or "f":
SELECT * FROM Customers
WHERE CustomerName LIKE '[a-f]%';