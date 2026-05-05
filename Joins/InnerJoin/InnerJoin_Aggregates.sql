SELECT c.CustomerName, SUM(o.Amount) AS TotalAmount
FROM Customer c
INNER JOIN Orders o
ON c.CustomerId = o. CustomerId
GROUP BY c.CustomerName;