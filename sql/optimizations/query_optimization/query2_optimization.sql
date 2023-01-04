-- query2
-- SELECT uc.comment_id, up.post_id FROM users u
-- CROSS JOIN user_posts up
-- CROSS JOIN user_comments uc
-- WHERE u.age > 30 and u.city = 'city 1' 
-- GROUP BY up.post_id , uc.comment_id
-- HAVING count(up.post_id) > 5 and count(uc.comment_id) > 5;

-- add composite index for users table if not exists
CREATE INDEX IF NOT EXISTS users_age_city_idx ON users (city, age);
-- add index for user_id in user_posts table if not exists
CREATE INDEX IF NOT EXISTS user_posts_user_id_idx ON user_posts (user_id);
-- add index for user_id in user_comments table if not exists
-- CREATE INDEX IF NOT EXISTS user_comments_user_id_idx ON user_comments (user_id);
-- create index for comment_id in user_comments table if not exists
-- CREATE INDEX IF NOT EXISTS user_comments_comment_id_idx ON user_comments (comment_id);
-- create index for post_id in user_posts table if not exists
-- CREATE INDEX IF NOT EXISTS user_posts_post_id_idx ON user_posts (post_id);


-- we changed the order of the condiotions in the where clause to make indexing more efficient
EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT uc.comment_id, up.post_id FROM users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
WHERE u.city = 'city 1' and  u.age > 25
GROUP BY up.post_id , uc.comment_id;

-- remove all the indexes
DROP INDEX users_age_city_idx;
DROP INDEX user_posts_user_id_idx;
DROP INDEX user_comments_user_id_idx;
DROP INDEX user_comments_comment_id_idx;
DROP INDEX user_posts_post_id_idx;
