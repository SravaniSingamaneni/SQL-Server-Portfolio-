/*
The NOT IN operator is used in the WHERE clause to exclude rows that match any value in a specified list or a subquery result set.

The following SQL selects all customers with City NOT IN "Newark" or "NewYork":

*/

Select * from Customer (Nolock)
Where Cust_City NOT IN ('Newark','NewYork');