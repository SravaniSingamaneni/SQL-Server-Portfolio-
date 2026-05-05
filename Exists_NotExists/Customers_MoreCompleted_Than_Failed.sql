--Get customers who Have more completed payments than failed payments
-- What if we also want to show:CompletedCount and FailedCount
select c.CustomerName,
sum(case when p.paymentStatus='Completed' then 1 else 0 end) AS CompletedCount,
sum(case when p.paymentStatus='Failed' then 1 else 0 end) AS FailedCount
from customer c
inner join orders o on c.CustomerId=o.CustomerId
inner join payments p on o.OrderId=p.OrderId
group by c.CustomerName
having 
--count(case when p.PaymentStatus='Completed' then 1 end)
-->count(case when p.paymentStatus='Failed' then 1 end)
sum(case when p.PaymentStatus='Completed' then 1 else 0 end)
>sum(case when p.paymentStatus='Failed' then 1 else 0 end)