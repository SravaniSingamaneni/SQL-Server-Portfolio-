-- Get customers whose second latest order was failed. With using windows functions
with SecondLatestOrders AS
(
	select o.orderId,o.CustomerId,o.OrderDate,
	ROW_NUMBER() over
	(
		partition by o.customerId
		order by o.OrderDate desc
	)As slrn
	from Orders o
)
select c.CustomerName,c.CustomerId 
from SecondLatestOrders slo
inner join Payments p on slo.OrderId=p.OrderId
inner join Customer c on slo.CustomerId=c.CustomerId
where slrn=2 
And p.PaymentStatus='Failed'