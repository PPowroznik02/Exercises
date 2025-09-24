SELECT user_id, MAX(time_stamp) AS last_stamp FROM Logins
WHERE date_part('year', time_stamp) = '2020'
GROUP BY user_id
ORDER BY last_stamp