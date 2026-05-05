--Get customers whose latest order was failed.
-- without using windows functions
select c.CustomerName,c.CustomerId
from customer c
inner join orders o on c.CustomerId=o.CustomerId
inner join payments p on o.OrderId=p.OrderId
where o.OrderDate=
(
	select max(ord.OrderDate) from orders ord
	where ord.CustomerId=c.CustomerId
)
AND p.PaymentStatus='Failed'