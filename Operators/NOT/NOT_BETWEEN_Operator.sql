/*
The NOT BETWEEN operator is used in the WHERE clause to select rows where a value falls outside a specified inclusive range.

The NOT BETWEEN operator can be used with numeric, text, or date values.

The following SQL selects all customers with a CustomerID NOT between 10 and 60:
*/

select * from customer(Nolock)
where CustomerId NOT BETWEEN 10 AND 60