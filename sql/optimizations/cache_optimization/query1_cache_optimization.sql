/**
 cache optimization
*/
-- query 1 before cache optimization
-- try to run this query before the cache optimization
-- twice and see that no difference in time execution 

-- query 1 after cache optimization

ALTER SESSION SET USE_CACHED_RESULT=FALSE;

DO SLEEP(1);

SELECT * 
FROM users 
WHERE id in (
  SELECT user_id 
  FROM user_posts 
  group by user_id
) and
id in (
  SELECT user_id 
  FROM user_comments
  group by user_id
)
and age > 28
;

ALTER SESSION SET USE_CACHED_RESULT=FALSE;


DO SLEEP(1);


SELECT * 
FROM users 
WHERE id in (
  SELECT user_id 
  FROM user_posts 
  group by user_id
) and
id in (
  SELECT user_id 
  FROM user_comments
  group by user_id
)
and age > 28
;


-- query 1 before cache optimization
ALTER SESSION SET USE_CACHED_RESULT=TRUE;


DO SLEEP(1);

SELECT * 
FROM users 
WHERE id in (
  SELECT user_id 
  FROM user_posts 
  group by user_id
) and
id in (
  SELECT user_id 
  FROM user_comments
  group by user_id
)
and age > 28
;


ALTER SESSION SET USE_CACHED_RESULT=TRUE;
DO SLEEP(1);

SELECT * 
FROM users 
WHERE id in (
  SELECT user_id 
  FROM user_posts 
  group by user_id
) and
id in (
  SELECT user_id 
  FROM user_comments
  group by user_id
)
and age > 28
;
