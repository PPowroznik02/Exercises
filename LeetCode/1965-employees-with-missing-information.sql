SELECT COALESCE(s.employee_id, e.employee_id) AS employee_id 
FROM Salaries s
FULL OUTER JOIN Employees e ON e.employee_id = s.employee_id
WHERE name IS null OR salary IS null
ORDER BY employee_id ASC
