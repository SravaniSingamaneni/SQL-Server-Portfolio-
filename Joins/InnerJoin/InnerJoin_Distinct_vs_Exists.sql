-- Get customers who have ONLY completed payments
--(no pending, no failed)
--Using INNER JOIN.
select c.CustomerName
from customer c
where not exists 
(
	select 1 from orders o
	inner join payments p on o.orderId=p.orderId
	where o.customerId=c.CustomerId 
	And p.paymentStatus <> 'Completed'
)
And EXISTS
(
	select 1 from orders o
	inner join payments p on o.orderId=p.orderId
	where o.customerId=c.CustomerId
)
--1️ First NOT EXISTS removes customers having any non-completed payment
--2️ Second EXISTS ensures customer actually has payments