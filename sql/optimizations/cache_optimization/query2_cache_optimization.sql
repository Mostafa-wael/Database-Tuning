/**
 cache optimization
*/
-- query 2 before cache optimization
-- try to run this query before the cache optimization
-- twice and see that no difference in time execution 

-- query 2 after cache optimization
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

DO SLEEP(1);

SELECT u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id
FROM users u
CROSS JOIN user_posts up
CROSS JOIN posts p
CROSS JOIN user_comments uc
CROSS JOIN comments c
CROSS JOIN replies r
CROSS JOIN likes l
group by p.id , u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id
order by p.id , u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id;
where count(l.id) > 7;

ALTER SESSION SET USE_CACHED_RESULT=FALSE;

DO SLEEP(1);

SELECT u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id
FROM users u
CROSS JOIN user_posts up
CROSS JOIN posts p
CROSS JOIN user_comments uc
CROSS JOIN comments c
CROSS JOIN replies r
CROSS JOIN likes l
group by p.id , u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id
order by p.id , u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id;
where count(l.id) > 7;

-- query 2 before cache optimization
ALTER SESSION SET USE_CACHED_RESULT=TRUE;

SELECT u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id
FROM users u
CROSS JOIN user_posts up
CROSS JOIN posts p
CROSS JOIN user_comments uc
CROSS JOIN comments c
CROSS JOIN replies r
CROSS JOIN likes l
group by p.id , u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id
order by p.id , u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id;
where count(l.id) > 7;


SELECT u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id
FROM users u
CROSS JOIN user_posts up
CROSS JOIN posts p
CROSS JOIN user_comments uc
CROSS JOIN comments c
CROSS JOIN replies r
CROSS JOIN likes l
group by p.id , u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id
order by p.id , u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id;
where count(l.id) > 7;
