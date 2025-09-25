SELECT DISTINCT t1.id,
    (CASE 
        WHEN t1.p_id IS null THEN 'Root'
        WHEN t1.p_id IS NOT null AND t2.id IS NOT null THEN 'Inner'
        WHEN t1.p_id IS NOT null AND t2.id IS null THEN 'Leaf'
        END
    ) AS type
FROM Tree t1
LEFT JOIN Tree t2 ON t2.p_id = t1.id
