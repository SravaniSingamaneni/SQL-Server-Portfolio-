-- INNER JOIN + CASE Statement: Categorize customers based on total order value.
select c.CustomerName, Sum(o.Amount) As TotalAmount,
	Case when Sum(o.Amount) > 1000 then 'Jewlery'
		when Sum(o.Amount) > 300 then 'Electronics'
		else 'Regular' 
		End as CustomerCategory
from Customer c
inner join orders o on c.customerId=o.CustomerId
Group by c.CustomerName