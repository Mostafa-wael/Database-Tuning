USE optimized_db;

--query 3
SELECT p.body, u.city, COUNT(l.id) AS likes_count
FROM posts p
JOIN users u ON u.id = p.user_id
JOIN likes l ON l.post_id = p.id
WHERE u.city = 'city 1'
GROUP BY u.city, p.body
ORDER BY likes_count DESC;




