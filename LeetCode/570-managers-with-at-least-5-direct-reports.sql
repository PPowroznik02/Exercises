SELECT name
FROM Employee
WHERE id IN (
    SELECT e1.id
    FROM Employee e1
    JOIN Employee e2 ON e1.id = e2.managerId
    GROUP BY e1.id
    HAVING count(e2.id) >= 5
)