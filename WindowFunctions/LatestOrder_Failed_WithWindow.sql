-- With using windows functions
with latestOrders As
(
	select o.OrderId,o.CustomerId,o.OrderDate,
	ROW_NUMBER() over
	(
		PARTITION by o.customerId
		order by o.OrderDate DESC
	)as rn
	from Orders o
)
select c.CustomerName,c.CustomerId 
from latestOrders lo
inner join Payments p on lo.OrderId=p.OrderId
inner join customer c on lo.CustomerId=c.CustomerId
where lo.rn=1
and PaymentStatus = 'Failed';