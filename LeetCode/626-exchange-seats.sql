SELECT (id - 1) AS id, student FROM Seat WHERE id % 2 = 0
UNION
SELECT (CASE WHEN id != (SELECT count(*) FROM Seat) THEN (id + 1) ELSE id END) AS id, student FROM Seat WHERE id % 2 = 1 
