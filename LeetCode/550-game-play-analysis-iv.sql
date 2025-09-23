SELECT round(round(count(DISTINCT player_id), 2) / (SELECT count(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity
WHERE (player_id, event_date - INTERVAL '1' DAY) IN (
    SELECT player_id, MIN(event_date)
    FROM Activity
    GROUP BY player_id
)
