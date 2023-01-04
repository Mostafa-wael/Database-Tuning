-- add index for city in users table if not exists
CREATE INDEX IF NOT EXISTS users_city_idx ON users (city);
-- add index for user_id in user_posts table if not exists
CREATE INDEX IF NOT EXISTS user_posts_user_id_idx ON user_posts (user_id);



-- get the posts with max likes in every city
EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body, u.city, COUNT(l.id) AS likes_count
FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
WHERE u.city = 'city 1'
GROUP BY u.city, p.body
ORDER BY likes_count DESC;

-- remove all the indexes
DROP INDEX users_city_idx;
DROP INDEX user_posts_user_id_idx;
DROP INDEX user_posts_post_id_idx;
DROP INDEX likes_post_id_idx;






