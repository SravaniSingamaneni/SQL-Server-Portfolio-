--Get the top 2 customers by total completed payment amount,but only for customers who have no failed payments.
select top 2 c.CustomerName, sum(o.amount) AS TotalAmount
from customer c
inner join orders o on c.CustomerId=o.CustomerId
inner join payments p on o.OrderId=p.OrderId
group by c.CustomerName
having count(*)=sum(case when p.PaymentStatus='Completed' then 1 else 0 end)
order by TotalAmount desc