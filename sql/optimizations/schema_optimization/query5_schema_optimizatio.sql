--query 5
select f.follower_id, 
FROM users u
INNER JOIN posts p ON p.user_id = u.id
INNER JOIN follows f ON u.id = f.user_id
INNER JOIN comments c ON c.post_id = f.follower_id
INNER JOIN replies r ON r.user_id = f.follower_id
INNER JOIN likes l ON l.user_id = f.follower_id
GROUP BY f.follower_id
WHERE u.city = 'city 1' and u.age > 20 and u.age < 30 and u.password LIKE 'password%' 
HAVING COUNT(comments.id) > 1 and COUNT(replies.id) > 1 and COUNT(likes.id) > 1
ORDER BY f.follower_id DESC;



    