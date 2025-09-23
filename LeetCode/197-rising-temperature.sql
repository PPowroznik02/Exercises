SELECT current.id 
FROM Weather as current 
JOIN Weather as yesterday 
on current.recordDate = yesterday.recordDate + INTERVAL '1 day'
WHERE yesterday.temperature < current.temperature