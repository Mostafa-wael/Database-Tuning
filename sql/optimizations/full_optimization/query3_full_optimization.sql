
-- add index for city in users table if not exists
CREATE INDEX IF NOT EXISTS users_city_idx ON users (city);
-- add index for post_id in likes table if not exists
CREATE INDEX IF NOT EXISTS likes_post_id_idx ON likes (post_id);
-- add index for user_id in likes table if not exists
CREATE INDEX IF NOT EXISTS likes_user_id_idx ON likes (user_id);

ALTER SYSTEM SET shared_buffers='2GB';
-- get the posts with max likes in every city
SELECT p.body, u.city, COUNT(l.id) AS likes_count
FROM posts p
INNER JOIN users u ON u.id = p.user_id
INNER JOIN likes l ON l.post_id = p.id
WHERE u.city = 'city 1'
GROUP BY u.city, p.body
ORDER BY likes_count DESC;

ALTER SYSTEM SET shared_buffers='2GB';

SELECT p.body, u.city, COUNT(l.id) AS likes_count
FROM posts p
INNER JOIN users u ON u.id = p.user_id
INNER JOIN likes l ON l.post_id = p.id
WHERE u.city = 'city 1'
GROUP BY u.city, p.body
ORDER BY likes_count DESC;

-- remove all the indexes
DROP INDEX users_city_idx;
DROP INDEX likes_user_id_idx;
DROP INDEX likes_post_id_idx;











