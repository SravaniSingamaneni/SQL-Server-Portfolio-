Select c.customerName, o.OrderId, o.Amount, p.PaymentStatus
From Customer c
inner join Orders o on c.CustomerId=o.CustomerId
inner join payments p on o.orderId=p.orderId