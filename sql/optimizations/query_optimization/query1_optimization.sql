
-- query 1
EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body FROM posts p
where p.id in (SELECT up.post_id FROM user_posts up JOIN users u ON u.id = up.user_id WHERE u.city = 'city 1') 
And p.id in (SELECT l.post_id FROM likes l GROUP BY l.post_id HAVING COUNT(l.id) > 20);

