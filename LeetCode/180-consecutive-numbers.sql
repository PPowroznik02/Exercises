WITH NewLogs AS (
    SELECT id, num,
    LEAD(num, 1) OVER (ORDER BY id) AS next_num,
    LEAD(num, 2) OVER (ORDER BY id) AS second_num,
    LEAD(id, 1) OVER (ORDER BY id) AS next_id,
    LEAD(id, 2) OVER (ORDER BY id) AS second_id
    FROM Logs
    ORDER BY id
)

SELECT DISTINCT num AS ConsecutiveNums 
FROM NewLogs
WHERE num = next_num 
AND num = second_num
AND next_num = second_num
AND id + 1 = next_id
AND id + 2 = second_id
