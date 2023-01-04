--query 2
SELECT c.id, p.id FROM users u
INNER JOIN posts p ON u.id = p.user_id
INNER JOIN comments c ON u.id = c.user_id
WHERE u.age > 25 and u.city = 'city 1'
GROUP BY p.id , c.id;







