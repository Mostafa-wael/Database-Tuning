USE optimized_db;

--query 4
-- We want to find all the followers of a certian user that have more than 5 comments on all the users posts
EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.id , p.body , p.title  
FROM  users u
INNER JOIN posts p ON u.id = p.user_id
INNER JOIN comments c ON u.id = c.user_id
WHERE u.age > 28 and u.City = 'city 1' and
p.title LIKE '%title 1%' and p.body LIKE '%body 2%' 
GROUP BY p.id, p.body, p.title;




