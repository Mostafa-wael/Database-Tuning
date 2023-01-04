-- query 4
-- We want to get full details of all the posts that has 1 in the title and 2 in the body from users that are older than 28 and live in city 1
EXPLAIN (ANALYZE TRUE, TIMING TRUE) 
SELECT up.post_id , p.body , p.title  
FROM  users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
INNER JOIN posts p ON p.id = up.post_id
INNER JOIN comments c ON c.id = uc.comment_id
WHERE u.age > 28 and u.City = 'city 1' and
p.title LIKE '%title 1%' and p.body LIKE '%body 2%' 
GROUP BY up.post_id, p.body, p.title;