-- query 1
-- for every user in cairo, get the body of posts they have with more than 20 likes
SELECT p.body
FROM posts p
CROSS JOIN user_posts up
CROSS JOIN users u
CROSS JOIN likes l
WHERE u.city = 'cairo' 
group by l.post_id, p.body
HAVING COUNT(l.id) > 20;

-- how can we optimize this query?
-- 1. use innerjoins instead of cross joins

-- SELECT body FROM posts
-- WHERE user_id IN (
--   SELECT id FROM users
--   WHERE city = 'cairo'
-- ) AND id IN (
--   SELECT post_id FROM likes
--   GROUP BY post_id
--   HAVING COUNT(*) > 20
-- );


