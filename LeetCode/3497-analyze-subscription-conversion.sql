WITH cte AS (
    SELECT user_id, 
        activity_type,
        CASE WHEN activity_type = 'free_trial' THEN ROUND(AVG(activity_duration), 2)  ELSE null END AS trial_avg_duration,
        CASE WHEN activity_type = 'paid' THEN ROUND(AVG(activity_duration), 2) ELSE null END AS paid_avg_duration
    FROM UserActivity
    GROUP BY user_id, activity_type 
)

SELECT c1.user_id, c1.trial_avg_duration, c2.paid_avg_duration FROM cte c1
FULL OUTER JOIN cte c2 ON c1.user_id = c2.user_id
WHERE c1.trial_avg_duration IS NOT null AND c2.paid_avg_duration IS NOT NULL
ORDER BY user_id ASC
