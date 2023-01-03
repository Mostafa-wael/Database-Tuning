-- Description: Query 1 Index Optimization

CREATE INDEX user_id ON user_posts (user_id);
CREATE INDEX user_id ON user_comments (user_id);


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
