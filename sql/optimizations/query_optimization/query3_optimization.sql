
-- get the posts with max likes in every city
-- EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body, u.city, COUNT(l.id) AS likes_count
-- FROM posts p
-- JOIN user_posts up ON up.post_id = p.id
-- JOIN users u ON u.id = up.user_id
-- JOIN likes l ON l.post_id = p.id
-- GROUP BY u.city, p.body
-- ORDER BY likes_count DESC;

-- rewrite the query using the cte on city and post body
EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body, u.city, COUNT(l.id) AS likes_count
FROM posts p
INNER JOIN user_posts up ON up.post_id = p.id
INNER JOIN users u ON u.id = up.user_id
INNER JOIN likes l ON l.post_id = p.id
WHERE u.city = 'city 1'
GROUP BY u.city, p.body
ORDER BY likes_count DESC;








