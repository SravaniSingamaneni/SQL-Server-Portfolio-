-- Get customers whose latest two orders were both failed
with latestTwoOrders As
(
	select o.OrderId,o.CustomerId,o.OrderDate,
	ROW_NUMBER() over
	(
		partition by o.customerId
		order by o.orderDate desc
	)AS ltrn
	from Orders o
)
select c.CustomerName,c.CustomerId
from latestTwoOrders lto
inner join payments p on lto.OrderId=p.OrderId
inner join customer c on lto.CustomerId=c.CustomerId
where lto.ltrn<=2 
group by c.CustomerName,c.CustomerId
having count(*)=2
and sum(case when p.PaymentStatus='Failed' then 1 else 0 end)=2;