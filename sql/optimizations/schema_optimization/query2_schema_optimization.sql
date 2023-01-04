--query 2
SELECT c.comment_id, p.post_id FROM users u
INNER JOIN posts p ON u.id = p.user_id
INNER JOIN comments c ON u.id = c.user_id
WHERE u.age > 25 and u.city = 'city 1'
GROUP BY p.post_id , c.comment_id;







