(SELECT name AS results FROM 
     (SELECT count(rating), user_id FROM MovieRating
     GROUP BY user_id) s
     JOIN Users u ON s.user_id = u.user_id
     ORDER BY count DESC, name ASC LIMIT 1)
UNION ALL
(SELECT title AS results FROM 
    (SELECT movie_id, avg(rating) AS rating_avg FROM MovieRating WHERE created_at::VARCHAR LIKE '2020-02-%' GROUP BY movie_id) t
    JOIN Movies m ON t.movie_id = m.movie_id
    ORDER BY rating_avg DESC, title ASC LIMIT 1)