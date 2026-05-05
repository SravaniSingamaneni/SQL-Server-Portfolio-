SELECT 
    c.CustomerName,
    p.PaymentStatus
FROM Customer c
CROSS JOIN Payments p;