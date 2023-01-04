
EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body FROM posts p
where p.id in (SELECT up.post_id FROM user_posts up JOIN users u ON u.id = up.user_id WHERE u.city = 'Cairo') 
And p.id in (SELECT l.post_id FROM likes l GROUP BY l.post_id HAVING COUNT(l.id) > 20);


-- query 1
-- for every user in cairo, get the body of posts they have with more than 20 likes
-- SELECT p.body
-- FROM posts p
-- CROSS JOIN user_posts up
-- CROSS JOIN users u
-- CROSS JOIN likes l
-- WHERE u.city = 'Cairo' 
-- group by l.post_id, p.body
-- HAVING COUNT(l.id) > 20;

