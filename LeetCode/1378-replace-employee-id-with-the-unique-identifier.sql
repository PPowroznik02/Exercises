SELECT unique_id, name FROM Employees e
FULL OUTER JOIN EmployeeUNI euni ON euni.id = e.id
WHERE name IS NOT null
