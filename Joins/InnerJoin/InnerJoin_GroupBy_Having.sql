SELECT c. customerName, Sum(o.Amount) AS TotalAmount
From Customer c
Inner Join Orders o
on c.CustomerId = o.CustomerId 
--Where c.CustomerId=4
Group By c.CustomerName
Having Sum(o.amount)>1000;

--------------------------------------------------------------------
-- Get Customers who
--Have at least one failed payment
--But also have at least one completed payment
select c.CustomerName
from Customer c
inner join orders o on c.customerId=o.customerId
inner join payments p on o.orderId=p.orderId
group by c.customerName
Having count(case when p.paymentStatus = 'Completed' then 1 end)>0
	And count(case when p.paymentStatus ='failed' then 1 end)>0
--Having sum(case when p.paymentStatus = 'Completed' then 1 else 0 end)>=1
--	And sum(case when p.paymentStatus ='failed' then 1 else 0 end)>=1

---------------------------------------------------------------------------------
--This guarantees:
--At least one payment
--All payments are Completed
--Alternative Solution Using GROUP BY + HAVING
select c.CustomerName
from Customer c
inner join orders o on c.customerId=o.customerId
inner join payments p on o.orderId=p.orderId
group by c.customerName
Having Count(*)=sum(case when p.paymentStatus = 'Completed' then 1 else 0 End);