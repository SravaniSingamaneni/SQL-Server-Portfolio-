create table Orders (
OrderId int primary key,
CustomerId int, FOREIGN KEY (CustomerId) references Customer (CustomerId),
Amount decimal(18,2),
OrderDate datetime DEFAULT Getdate(),
OrderModifiedDate datetime DEFAULT Getdate()
);