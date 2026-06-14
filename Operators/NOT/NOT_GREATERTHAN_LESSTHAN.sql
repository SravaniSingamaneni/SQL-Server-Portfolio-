/*
In SQL, the "NOT Greater Than" condition is most often expressed with the standard greater than or equal to (>=) operator.

The following SQL selects all customers with a CustomerID not greater than 50:
*/

Select * from Customer (Nolock)
Where NOT CustomerId > 10

/*
In SQL, the "NOT Less Than" condition is most often expressed with the standard less than or equal to (<=) operator.

The following SQL selects all customers with a CustomerID not less than 50:
*/

Select * from Customer (Nolock)
Where Not CustomerId < 9