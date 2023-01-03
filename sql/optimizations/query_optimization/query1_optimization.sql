SELECT p.body FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
WHERE u.city = 'Cairo'
GROUP BY p.id
HAVING COUNT(l.id) > 20;
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


-----------------
1. Use a subquery: SELECT p.body FROM posts p JOIN user_posts up ON up.post_id = p.id JOIN users u ON u.id = up.user_id JOIN (SELECT post_id FROM likes GROUP BY post_id HAVING COUNT(*) > 20) l ON l.post_id = p.id WHERE u.city = 'Cairo' GROUP BY p.id; 
2. Use a join with a correlated subquery: SELECT p.body FROM posts p JOIN user_posts up ON up.post_id = p.id JOIN users u ON u.id = up.user_id JOIN likes l ON l.post_id = p.id AND (SELECT COUNT(*) FROM likes WHERE post_Id = l.post_Id) > 20 WHERE u.city = 'Cairo' GROUP BY p.body; 
3. Use window functions: SELECT body FROM (SELECT body, COUNT(*) OVER (PARTITION BY post_Id) AS cnt FROM posts JOIN user_posts on user_posts .post_Id= posts .Id JOIN users on users .Id=user _posts .user _Id JOIN likes on likes .post _Id=posts .Id WHERE users .city='Cairo' ) t WHERE cnt > 20; 
4. Use an index: CREATE INDEX cityIndex ON users (city); SELECT p.body FROM posts p JOIN user_posts up ON up.post_id = p.id JOIN users u ON u