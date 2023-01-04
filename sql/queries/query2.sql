-- query2
-- SELECT uc.comment_id, up.post_id FROM users u
-- CROSS JOIN user_posts up
-- CROSS JOIN user_comments uc
-- WHERE u.age > 30 and u.city = 'city 1' 
-- GROUP BY up.post_id , uc.comment_id
-- HAVING count(up.post_id) > 5 and count(uc.comment_id) > 5;


-- convert to inner join
SELECT uc.comment_id, up.post_id FROM users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
WHERE u.age > 25 and u.city = 'city 1'
GROUP BY up.post_id , uc.comment_id;
