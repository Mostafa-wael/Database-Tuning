/**
 cache optimization
*/
-- query 3 before cache optimization
-- try to run this query before the cache optimization
-- twice and see that no difference in time execution 

-- query 3 after cache optimization

EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body, u.city, COUNT(l.id) AS likes_count
FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
GROUP BY u.city, p.body
ORDER BY likes_count DESC;



EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body, u.city, COUNT(l.id) AS likes_count
FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
GROUP BY u.city, p.body
ORDER BY likes_count DESC;



-- query 3 after cache optimization

ALTER SYSTEM SET shared_buffers='2GB';

EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body, u.city, COUNT(l.id) AS likes_count
FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
GROUP BY u.city, p.body
ORDER BY likes_count DESC;


EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body, u.city, COUNT(l.id) AS likes_count
FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
GROUP BY u.city, p.body
ORDER BY likes_count DESC;


