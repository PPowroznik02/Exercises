SELECT min(u.name) AS name, COALESCE(sum(distance), 0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r ON r.User_id = u.id
GROUP BY u.id
ORDER BY travelled_distance DESC, min(u.name) ASC