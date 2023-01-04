-- get the posts with max likes in every city
SELECT p.body, u.city, COUNT(l.id) AS likes_count
FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
WHERE u.city = 'city 1'
GROUP BY u.city, p.body
ORDER BY likes_count DESC;


-- rewrite the query using cross join
-- SELECT p.body, u.city, COUNT(l.id) AS likes_count
-- FROM posts p
-- CROSS JOIN user_posts up
-- CROSS JOIN users u
-- CROSS JOIN likes l
-- WHERE u.city = 'city 1'
-- GROUP BY u.city, p.body
-- ORDER BY likes_count DESC;




