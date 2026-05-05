--INNER JOIN + Date Filtering: Get orders placed this month.
select c.customerName, o.OrderId, o.OrderDate
from customer c
inner join orders o on c.customerId=o.CustomerId
--WHERE o.OrderDate >= DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)
--AND o.OrderDate < DATEADD(MONTH, 1, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1))
where month(o.orderDate)=Month(Getdate())
AND year(o.OrderDate)=Year(GETDATE())