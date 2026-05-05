--INNER JOIN + Subquery : Get customers who placed more than 5 orders.
select c.CustomerName, o.OrderCount 
from customer c
inner join (select customerId, Count(*) As OrderCount from orders group by CustomerId)o
on c.customerId=o.customerId
where o.OrderCount>5