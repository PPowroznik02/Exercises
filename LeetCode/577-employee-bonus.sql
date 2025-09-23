SELECT name, bonus FROM Employee 
FULL Outer Join Bonus on Employee.empId = Bonus.empId 
WHERE Bonus.bonus IS NULL or Bonus.bonus < 1000