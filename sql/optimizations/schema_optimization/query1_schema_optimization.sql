-- query 1
SELECT p.body FROM posts p
JOIN users u ON u.id = p.user_id
JOIN likes l ON l.post_id = p.id
WHERE u.city = 'city 1'
GROUP BY p.id
HAVING COUNT(l.id) > 20;