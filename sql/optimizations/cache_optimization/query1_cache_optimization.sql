/**
 cache optimization
*/
-- query 1 before cache optimization
-- try to run this query before the cache optimization
-- twice and see that no difference in time execution 

-- query 1 after cache optimization


EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
WHERE u.city = 'Cairo'
GROUP BY p.id
HAVING COUNT(l.id) > 20;



EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
WHERE u.city = 'Cairo'
GROUP BY p.id
HAVING COUNT(l.id) > 20;


-- query 1 after cache optimization
ALTER SYSTEM SET shared_buffers='2GB';

EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
WHERE u.city = 'Cairo'
GROUP BY p.id
HAVING COUNT(l.id) > 20;


ALTER SYSTEM SET shared_buffers='2GB';

EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
WHERE u.city = 'Cairo'
GROUP BY p.id
HAVING COUNT(l.id) > 20;
