-- add index for post_id in user_posts table if not exists
CREATE INDEX IF NOT EXISTS user_posts_post_id_idx ON user_posts (post_id);
-- add index for post_id in likes table if not exists
CREATE INDEX IF NOT EXISTS likes_post_id_idx ON likes (post_id);
-- add index for city in users table if not exists
CREATE INDEX IF NOT EXISTS users_city_idx ON users (city);
-- add index for user_id in user_posts table if not exists
CREATE INDEX IF NOT EXISTS user_posts_user_id_idx ON user_posts (user_id);


-- use explain analyze to see the difference in execution time
EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.body FROM posts p
JOIN user_posts up ON up.post_id = p.id
JOIN users u ON u.id = up.user_id
JOIN likes l ON l.post_id = p.id
WHERE u.city = 'city 1'
GROUP BY p.id
HAVING COUNT(l.id) > 20;

-- remove all the indexes
DROP INDEX user_posts_post_id_idx;
DROP INDEX likes_post_id_idx;
DROP INDEX users_city_idx;
DROP INDEX user_posts_user_id_idx;