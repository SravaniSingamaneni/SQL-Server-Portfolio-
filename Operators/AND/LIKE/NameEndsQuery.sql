
--Diaplay Data based on whose CustomerName ENDs with letter A and City is NEWARK
select * from Customer (Nolock)
where Cust_City ='Newark' AND CustomerName LIKE '%A'

-- Display only whose CustomerName ENDs with letter D and the excepted output columns areCustomerName,Customer_DOB, Cust_PhoneNumber
Select CustomerName,Customer_DOB, Cust_PhoneNumber
from Customer (Nolock)
where CustomerName LIKE '%D'

-- Display only only whose customerName ENDs with word BROWN
select * from Customer (Nolock)
Where CustomerName LIKE '%BROWN%'