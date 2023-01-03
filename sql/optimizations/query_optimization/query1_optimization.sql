-- query 1
-- for every user in cairo, get the body of posts they have with more than 20 likes
SELECT body FROM posts
WHERE user_id IN (
  SELECT id FROM users
  WHERE city = 'cairo'
) AND id IN (
  SELECT post_id FROM likes
  GROUP BY post_id
  HAVING COUNT(*) > 20
);