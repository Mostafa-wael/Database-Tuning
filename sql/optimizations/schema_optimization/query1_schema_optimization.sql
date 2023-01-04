USE optimized_db;

-- query 1
-- select all the users with more than 100 posts and more than 100 comments
-- select * from users where id in (select user_id from posts group by user_id having count(*) > 100) and id in (select user_id from comments group by user_id having count(*) > 100); 
SELECT * 
FROM users 
WHERE id in (
  SELECT user_id 
  FROM user_posts 
  group by user_id
) and
id in (
  SELECT user_id 
  FROM user_comments
  group by user_id
);
