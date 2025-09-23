SELECT DISTINCT email AS Email
FROM Person
WHERE email IN (
    SELECT email AS count 
    FROM Person 
    GROUP BY email
    HAVING  count(email) >= 2
)
