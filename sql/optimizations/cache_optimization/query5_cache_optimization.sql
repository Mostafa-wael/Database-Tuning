ALTER SYSTEM SET shared_buffers='2GB';

-- add indexes for user_id and follower_id in follows table if not exists
CREATE INDEX IF NOT EXISTS follows_user_id_idx ON follows (user_id);
CREATE INDEX IF NOT EXISTS follows_follower_id_idx ON follows (follower_id);
-- add composite index for users table if not exists
CREATE INDEX IF NOT EXISTS users_age_city_idx ON users (city, age);
-- add index for user_id in user_comments table if not exists
CREATE INDEX IF NOT EXISTS user_comments_user_id_idx ON user_comments (user_id);
-- add index for user_id in user_posts table if not exists
CREATE INDEX IF NOT EXISTS user_posts_user_id_idx ON user_posts (user_id);
-- add index for user_id in user_replies table if not exists
CREATE INDEX IF NOT EXISTS user_replies_user_id_idx ON user_replies (user_id);
-- add index for user_id in user_likes table if not exists
CREATE INDEX IF NOT EXISTS user_likes_user_id_idx ON user_likes (user_id);
-- add index for post_id in user_comments table if not exists
CREATE INDEX IF NOT EXISTS user_comments_post_id_idx ON user_comments (post_id);

EXPLAIN (ANALYZE TRUE, TIMING TRUE) 
select f.follower_id
FROM users u
INNER JOIN user_posts p ON p.user_id = u.id
INNER JOIN follows f ON u.id = f.user_id
INNER JOIN user_comments c ON c.post_id = f.follower_id
INNER JOIN replies r ON r.user_id = f.follower_id
INNER JOIN likes l ON l.user_id = f.follower_id
WHERE u.city = 'city 1' and u.age > 20 and u.age < 30 and u.password LIKE 'password%' 
GROUP BY f.follower_id
HAVING COUNT(c.id) > 1 and COUNT(r.id) > 1 and COUNT(l.id) > 1
ORDER BY f.follower_id DESC;