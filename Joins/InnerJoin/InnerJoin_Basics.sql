SELECT c.CustomerName, o.OrderId 
FROM Customer c
INNER JOIN Orders o 
ON c.CustomerId = o.CustomerId;