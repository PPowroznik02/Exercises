SELECT query_name, 
ROUND(SUM((ROUND(rating, 2)/position)) / COUNT (rating), 2) AS quality,
ROUND(ROUND(SUM(case when rating < 3 then 1 else 0 end), 2) / COUNT(*) * 100, 2) AS poor_query_percentage 
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name
