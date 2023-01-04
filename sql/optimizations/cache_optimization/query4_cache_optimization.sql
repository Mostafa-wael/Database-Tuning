
/**
 cache optimization
*/
-- query 4 before cache optimization
-- try to run this query before the cache optimization
-- twice and see that no difference in time execution 

-- query 4 before cache optimization

SELECT up.post_id , p.body , p.title  
FROM  users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
INNER JOIN posts p ON p.id = up.post_id
INNER JOIN comments c ON c.id = uc.comment_id
WHERE u.age > 28 and u.City = 'city 1' and
p.title LIKE '%title 1%' and p.body LIKE '%body 2%' 
GROUP BY up.post_id, p.body, p.title;


SELECT up.post_id , p.body , p.title  
FROM  users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
INNER JOIN posts p ON p.id = up.post_id
INNER JOIN comments c ON c.id = uc.comment_id
WHERE u.age > 28 and u.City = 'city 1' and
p.title LIKE '%title 1%' and p.body LIKE '%body 2%' 
GROUP BY up.post_id, p.body, p.title;

-- query 4 after cache optimization

ALTER SYSTEM SET shared_buffers='2GB';

SELECT up.post_id , p.body , p.title  
FROM  users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
INNER JOIN posts p ON p.id = up.post_id
INNER JOIN comments c ON c.id = uc.comment_id
WHERE u.age > 28 and u.City = 'city 1' and
p.title LIKE '%title 1%' and p.body LIKE '%body 2%' 
GROUP BY up.post_id, p.body, p.title;


SELECT up.post_id , p.body , p.title  
FROM  users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
INNER JOIN posts p ON p.id = up.post_id
INNER JOIN comments c ON c.id = uc.comment_id
WHERE u.age > 28 and u.City = 'city 1' and
p.title LIKE '%title 1%' and p.body LIKE '%body 2%' 
GROUP BY up.post_id, p.body, p.title;





