create table Payments (
PaymentId int primary key,
OrderId int, FOREIGN KEY (OrderId) references Orders (OrderId),
PaymentStatus varchar(50),
PaymentDate datetime DEFAULT Getdate(),
PaymentModifiedDate datetime DEFAULT Getdate()
);