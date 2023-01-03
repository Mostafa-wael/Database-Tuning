
/**
 cache optimization
*/
-- query 4 before cache optimization
-- try to run this query before the cache optimization
-- twice and see that no difference in time execution 

-- query 4 after cache optimization
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

SELECT *
FROM users u 
CROSS JOIN follows f
CROSS JOIN comments c
CROSS JOIN posts p
GROUP BY c.user_id
order by c.id 
having count(c.id) > 5
where  c.body '%body22%' LIKE u.age > 29;

ALTER SESSION SET USE_CACHED_RESULT=FALSE;

SELECT *
FROM users u 
CROSS JOIN follows f
CROSS JOIN comments c
CROSS JOIN posts p
GROUP BY c.user_id
order by c.id 
having count(c.id) > 5
where  c.body '%body22%' LIKE u.age > 29;

-- query 4 before cache optimization

ALTER SESSION SET USE_CACHED_RESULT=TRUE;

SELECT *
FROM users u 
CROSS JOIN follows f
CROSS JOIN comments c
CROSS JOIN posts p
GROUP BY c.user_id
order by c.id 
having count(c.id) > 5
where  c.body '%body22%' LIKE u.age > 29;


SELECT *
FROM users u 
CROSS JOIN follows f
CROSS JOIN comments c
CROSS JOIN posts p
GROUP BY c.user_id
order by c.id 
having count(c.id) > 5
where  c.body '%body22%' LIKE u.age > 29;





