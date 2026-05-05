INSERT INTO Customer 
(CustomerId, CustomerName, Customer_DOB, Cust_PhoneNumber, Cust_Email,
Cust_Address1, Cust_Address2, Cust_City, Cust_County, Cust_ZipCode,
Cust_PaymentMethod, Cust_AmountPaid, Cust_Rewards, Cust_TotalItems,
Cust_Orders, Cust_OrderNumber, Cust_ReferenceNumber,
Cust_CreatedDate, Cust_ModifiedDate)
VALUES
(1,'John Smith','1990-05-10','1234567890','john@gmail.com','12 Main St',NULL,'Newark','Essex',7101,'Credit Card',1500.00,100,10,3,'ORD1001','REF001','2026-01-10','2026-01-15'),
(2,'Mary Johnson','1988-03-22','2234567890','mary@gmail.com','45 Park Ave',NULL,'Jersey City','Hudson',7302,'Debit Card',2500.00,200,15,4,'ORD1002','REF002','2026-01-12','2026-01-18'),
(3,'David Brown','1992-07-14','3234567890','david@gmail.com','78 River Rd',NULL,'Newark','Essex',7102,'UPI',500.00,50,5,1,'ORD1003','REF003','2026-02-01','2026-02-02'),
(4,'Emma Wilson','1995-11-30','4234567890','emma@gmail.com','22 Lake St',NULL,'Edison','Middlesex',8817,'Credit Card',3000.00,300,20,5,'ORD1004','REF004','2026-02-10','2026-02-12'),
(5,'Chris Lee','1993-09-09','5234567890','chris@gmail.com','99 Hill Rd',NULL,'Princeton','Mercer',8540,'Cash',0,0,0,0,NULL,NULL,'2026-02-15','2026-02-15'),
(6,'Sophia Clark','1991-12-18','6234567890','sophia@gmail.com','11 Green St',NULL,'Hoboken','Hudson',7030,'Debit Card',1200.00,80,8,2,'ORD1006','REF006','2026-02-18','2026-02-20'),
(7,'James White','1987-06-05','7234567890','james@gmail.com','77 Oak St',NULL,'Newark','Essex',7103,'Credit Card',1800.00,120,12,3,'ORD1007','REF007','2026-02-20','2026-02-25'),
(8,'Olivia Harris','1994-04-16','8234567890','olivia@gmail.com','34 Pine St',NULL,'Trenton','Mercer',8608,'UPI',900.00,60,6,2,'ORD1008','REF008','2026-02-22','2026-02-23'),
(9,'Daniel Young','1989-01-25','9234567890','daniel@gmail.com','56 Cedar St',NULL,'Edison','Middlesex',8816,'Credit Card',2200.00,150,14,4,'ORD1009','REF009','2026-02-25','2026-02-28'),
(10,'Ava King','1996-08-11','1034567890','ava@gmail.com','101 Maple St',NULL,'Newark','Essex',7104,'Debit Card',750.00,40,4,1,'ORD1010','REF010','2026-03-01','2026-03-01');