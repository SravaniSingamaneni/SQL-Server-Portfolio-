SELECT c.CustomerName, o.OrderID, p.PaymentStatus
FROM Customer c
INNER JOIN Orders o
    ON c.CustomerId = o.CustomerId
INNER JOIN Payments p
    ON o.OrderId = p.OrderId
WHERE p.PaymentStatus = 'Completed';