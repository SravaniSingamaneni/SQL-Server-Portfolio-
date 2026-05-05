--INNER JOIN + Duplicate Issue: Employee with multiple orders creates duplicate rows.
select distinct c.customerName 
from customer c
inner join orders o on c.customerId=o.customerId

-- solution 2 for better 
select c.CustomerName
from customer c
where EXISTS(select 1 from orders o where o.customerId = c.customerId)
