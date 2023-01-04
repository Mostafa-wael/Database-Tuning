
-- EXPLAIN (ANALYZE TRUE, TIMING TRUE)SELECT uc.comment_id, up.post_id FROM users u
-- INNER JOIN user_posts up ON u.id = up.user_id
-- INNER JOIN user_comments uc ON u.id = uc.user_id
-- WHERE u.age > 25 and u.city = 'city 1'
-- GROUP BY up.post_id , uc.comment_id;



EXPLAIN (ANALYZE TRUE, TIMING TRUE) 
with CTE as (SELECT * FROM users WHERE age > 25 and city = 'city 1')
SELECT uc.comment_id, up.post_id FROM CTE AS u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
GROUP BY up.post_id , uc.comment_id;




-- EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT uc.comment_id, up.post_id FROM (SELECT * FROM users WHERE age > 25 and city = 'Giza') AS u  
-- INNER JOIN user_posts up ON u.id = up.user_id 
-- INNER JOIN user_comments uc ON u.id = uc.user_id 
-- GROUP BY up.post_id , uc.comment_id;
