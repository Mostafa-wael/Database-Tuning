ALTER SYSTEM SET shared_buffers='2GB';


-- add index for post_id in likes table if not exists
CREATE INDEX IF NOT EXISTS likes_post_id_idx ON likes (post_id);
-- add index for city in users table if not exists
CREATE INDEX IF NOT EXISTS users_city_idx ON users (city);

EXPLAIN (ANALYZE TRUE, TIMING TRUE) 

-- get all the posts that have more than 20 likes in the city 1
SELECT COUNT(*)
FROM posts p
INNER JOIN users u ON u.id = p.user_id
INNER JOIN likes l ON l.post_id = p.id
WHERE u.city = 'city 1';

-- remove all the indexes
DROP INDEX likes_post_id_idx;
DROP INDEX users_city_idx;






