-- query 1
SELECT u.* 
FROM users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
WHERE age > 28
GROUP BY u.id;
