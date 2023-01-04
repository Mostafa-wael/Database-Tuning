
-- add index for post_id in user_posts table if not exists
-- CREATE INDEX IF NOT EXISTS user_posts_post_id_idx ON user_posts (post_id);
-- add index for user_id in user_posts table if not exists
-- CREATE INDEX IF NOT EXISTS user_posts_user_id_idx ON user_posts (user_id);
-- add composite index for users table if not exists
CREATE INDEX IF NOT EXISTS users_age_city_idx ON users (city, age);
-- add index for comment_id in user_comments table if not exists
-- CREATE INDEX IF NOT EXISTS user_comments_comment_id_idx ON user_comments (comment_id);

-- we changed the order of the condiotions in the where clause to make indexing more efficient
-- indexing won't be efficient due to the use of LIKE operator
EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT up.post_id , p.body , p.title  
FROM  users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
INNER JOIN posts p ON p.id = up.post_id
INNER JOIN comments c ON c.id = uc.comment_id
WHERE u.City = 'city 1' and  u.age > 28  and
p.title LIKE '%title 12%' and p.body LIKE '%body 22%' 
GROUP BY up.post_id, p.body, p.title;

-- remove all the indexes
DROP INDEX user_posts_post_id_idx;
DROP INDEX user_posts_user_id_idx;
DROP INDEX users_age_city_idx;
DROP INDEX user_comments_comment_id_idx;