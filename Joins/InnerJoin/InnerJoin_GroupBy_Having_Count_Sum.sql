--Get customers who have more than 2 orders
--and total order amount greater than 1500
--Use COUNT and SUM properly.

Select c.customerName,count(ord.OrderId) as OrderCount,
	Sum(ord.Amount) as totalAmount 	
from customer c 
inner join orders ord on c.customerId=ord.customerId
Group by c.CustomerName
Having Sum(ord.amount)>1500 and Count(ord.OrderId)>2

-- Why didn’t you use WHERE instead of HAVING?
--You answer:Because COUNT() and SUM() are aggregate functions, and WHERE cannot filter on aggregate results. HAVING filters after grouping.
----------------------------------------------------------------------------------------------

--Get the top 2 customers by total completed payment amount,but only for customers who have no failed payments.
select top 2 c.CustomerName, sum(o.amount) AS TotalAmount
from customer c
inner join orders o on c.CustomerId=o.CustomerId
inner join payments p on o.OrderId=p.OrderId
group by c.CustomerName
having count(*)=sum(case when p.PaymentStatus='Completed' then 1 else 0 end)
order by TotalAmount desc

--------------------------------------------------------------------------------------------------

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