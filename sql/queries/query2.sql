-- query2
-- 2. Find all the comments and posts of a user that is older than 25 and lives in city 1
SELECT uc.comment_id, up.post_id FROM users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
WHERE u.age > 25 and u.city = 'city 1'
GROUP BY up.post_id , uc.comment_id;
