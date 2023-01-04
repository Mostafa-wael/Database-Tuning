--query 2


-- add composite index for users table if not exists
CREATE INDEX IF NOT EXISTS users_age_city_idx ON users (city, age);
-- add index for user_id in user_posts table if not exists
-- CREATE INDEX IF NOT EXISTS user_posts_user_id_idx ON user_posts (user_id);


ALTER SYSTEM SET shared_buffers='2GB';

EXPLAIN (ANALYZE TRUE, TIMING TRUE) 
SELECT c.id, p.id FROM users u
INNER JOIN posts p ON u.id = p.user_id
INNER JOIN comments c ON u.id = c.user_id
WHERE u.age > 25 and u.city = 'city 1'
GROUP BY p.id , c.id;

-- remove all the indexes
DROP INDEX users_age_city_idx;
DROP INDEX user_posts_user_id_idx;
