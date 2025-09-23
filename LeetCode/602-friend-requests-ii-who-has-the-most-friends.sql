SELECT person_id AS id, sum(friends) AS num
FROM (
    (SELECT requester_id AS person_id, count(accepter_id) AS friends
    FROM RequestAccepted 
    GROUP BY requester_id)
    UNION ALL
    (SELECT accepter_id AS person_id, count(requester_id) AS friends
    FROM RequestAccepted
    GROUP BY accepter_id)
)
GROUP BY person_id
ORDER BY num DESC
LIMIT 1
