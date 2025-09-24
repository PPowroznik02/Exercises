WITH cte AS
(
    SELECT e.employee_id,
    (CASE WHEN num_departments = 1 THEN department_id WHEN primary_flag = 'Y' THEN department_id END) AS department_id
    FROM Employee e
    JOIN (
        SELECT employee_id, COUNT(*) AS num_departments FROM Employee
        GROUP BY employee_id
    ) AS h ON h.employee_id = e.employee_id
)
SELECT * FROM cte
WHERE department_id IS NOT null
