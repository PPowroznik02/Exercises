WITH cte AS
(
    SELECT * FROM Queue ORDER BY turn
), cte2 AS (
    SELECT person_id, person_name, turn, weight, 
    SUM(weight) OVER(ORDER BY turn) AS total_weight 
    FROM cte
)

SELECT person_name FROM cte2
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1
