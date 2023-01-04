-- query 1
-- for every user in city 1, get the body of posts they have with more than 20 likes
SELECT p.body FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
WHERE u.city = 'city 1'
GROUP BY p.id
HAVING COUNT(l.id) > 20;

