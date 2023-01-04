/**
 cache optimization
*/
-- query 2 before cache optimization
-- try to run this query before the cache optimization
-- twice and see that no difference in time execution 

-- query 2 before cache optimization

EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT uc.comment_id, up.post_id FROM users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
WHERE u.age > 25 and u.city = 'Giza'
GROUP BY up.post_id , uc.comment_id;


EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT uc.comment_id, up.post_id FROM users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
WHERE u.age > 25 and u.city = 'Giza'
GROUP BY up.post_id , uc.comment_id;

-- query 2 after cache optimization
ALTER SYSTEM SET shared_buffers='2GB';

EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT uc.comment_id, up.post_id FROM users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
WHERE u.age > 25 and u.city = 'Giza'
GROUP BY up.post_id , uc.comment_id;



EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT uc.comment_id, up.post_id FROM users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
WHERE u.age > 25 and u.city = 'Giza'
GROUP BY up.post_id , uc.comment_id;
