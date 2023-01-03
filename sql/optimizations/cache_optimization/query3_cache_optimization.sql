/**
 cache optimization
*/
-- query 3 before cache optimization
-- try to run this query before the cache optimization
-- twice and see that no difference in time execution 

-- query 3 after cache optimization
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

SELECT p.id ,count(*)
FROM user_posts p
CROSS JOIN user_comments c
CROSS JOIN likes l
group by p.id , l.id 
having count(l.id) > 2;

ALTER SESSION SET USE_CACHED_RESULT=FALSE;

SELECT p.id ,count(*)
FROM user_posts p
CROSS JOIN user_comments c
CROSS JOIN likes l
group by p.id , l.id 
having count(l.id) > 2;


-- query 3 before cache optimization

ALTER SESSION SET USE_CACHED_RESULT=TRUE;

SELECT p.id ,count(*)
FROM user_posts p
CROSS JOIN user_comments c
CROSS JOIN likes l
group by p.id , l.id 
having count(l.id) > 2;

SELECT p.id ,count(*)
FROM user_posts p
CROSS JOIN user_comments c
CROSS JOIN likes l
group by p.id , l.id 
having count(l.id) > 2;

