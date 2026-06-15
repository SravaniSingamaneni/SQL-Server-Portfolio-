---------------------CASE Select-------------------------------------
select EmployeeName, Salary, 
	CASE WHEN Salary > 100000 THEN 'HIGHEST'
		 WHEN Salary Between 50000 and 99999 THEN 'MEDIUM'
		 ELSE 'LOW'
	END
FROM Employees
---------------------CASE in Update----------------------------------
Update Employee SET
SalaryGrade = CASE When Salary >=100000 then 'A'
				When salary >= 50000 then 'B'
				Else 'C' 
			END
--------------Case in update: Increase salary based on condition-------
update Employee SET
Salary = CASE When DepartmentID = 1 then salary * 1.10
			When DepartmentID = 2 then salary * 1.05
			Else Salary
		End
-------------Case with Order by----------------------------------------
SELECT EmployeeName, DepartmentID, Salary
From Employee
Order By Case when DepartmentID = 3 Then 1
			when DepartmentID = 1 then 2
			when DepartmentID = 2 Then 3
			Else 4
		END
--------Prioritize high salary employees first--------------------------
select * 
from Employee
Order By case when salary > 100000 then 1
			when salary between 50000 and 100000 then 2
			else 3
		end
-------CASE in HAVING---------------------------------------------------
------------------Filter departments based on dynamic condition---------
select DepartmentID, SUM(salary) As TotalSalary
from Employee
Group by DepartmentID
Having CASE When Sum(salary) > 100000 then 1
			else 0
		END =1
-----------------Another version without using CASE---------------------
select DepartmentID, SUM(salary) As TotalSalary
from Employee
Group by DepartmentID
Having SUM(Salary) > 100000
---------------------CASE with SUBQUERY---------------------------------
------------Compare each employee salary with average salary------------
select EmployeeName, Salary,
	case when salary > (select AVG(Salary) from employee) then 'Above Average'
		else 'Below Average'
	END AS SalaryStatus
From Employee
---------------Department-level comparison using subquery---------------
select EmployeeName, DepartmentID, Salary,
	Case When salary >
			(
				select AVG(salary) 
				from employee e2 
				where e2.DepartmentID = e1. DepartmentID
			) 
		Then 'Above Average'
		else 'Below Average'
	END as Status
From Employee e1
-------------------Conditional Aggregation (CASE inside SUM)------------
------Find total salary for IT and non-IT separately--------------------
select Sum(CASE when DepartmentID = 1 then Salary else 0 END) AS IT_Salary,
	Sum(CASE when DepartmentID <> 1 then salary else 0 END) AS Other_Salary
From Employee
