SELECT id,
MAX(CASE WHEN month = 'Jan' THEN revenue ELSE Null END) AS Jan_Revenue,
MAX(CASE WHEN month = 'Feb' THEN revenue ELSE Null END) AS Feb_Revenue,
MAX(CASE WHEN month = 'Mar' THEN revenue ELSE Null END) AS Mar_Revenue,
MAX(CASE WHEN month = 'Apr' THEN revenue ELSE Null END) AS Apr_Revenue,
MAX(CASE WHEN month = 'May' THEN revenue ELSE Null END) AS May_Revenue,
MAX(CASE WHEN month = 'Jun' THEN revenue ELSE Null END) AS Jun_Revenue,
MAX(CASE WHEN month = 'Jul' THEN revenue ELSE Null END) AS Jul_Revenue,
MAX(CASE WHEN month = 'Aug' THEN revenue ELSE Null END) AS Aug_Revenue,
MAX(CASE WHEN month = 'Sep' THEN revenue ELSE Null END) AS Sep_Revenue,
MAX(CASE WHEN month = 'Oct' THEN revenue ELSE Null END) AS Oct_Revenue,
MAX(CASE WHEN month = 'Nov' THEN revenue ELSE Null END) AS Nov_Revenue,
MAX(CASE WHEN month = 'Dec' THEN revenue ELSE Null END) AS Dec_Revenue
FROM Department 
GROUP BY id
ORDER BY id