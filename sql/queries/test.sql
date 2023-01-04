EXPLAIN (ANALYZE TRUE, TIMING TRUE)SELECT up.post_id , p.body , p.title  
FROM  users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
INNER JOIN posts p ON p.id = up.post_id
INNER JOIN comments c ON c.id = uc.comment_id
WHERE u.age > 28 and u.City = 'city 1' and
p.title LIKE '%title 1%' and p.body LIKE '%body 2%' 
GROUP BY up.post_id, p.body, p.title;


EXPLAIN (ANALYZE TRUE, TIMING TRUE)SELECT up.post_id , p.body , p.title  
FROM  users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
INNER JOIN posts p ON p.id = up.post_id
INNER JOIN comments c ON c.id = uc.comment_id
WHERE u.age > 28 and u.City = 'city 1' and
p.title LIKE '%title 1%' and p.body LIKE '%body 2%' 
GROUP BY up.post_id, p.body, p.title;