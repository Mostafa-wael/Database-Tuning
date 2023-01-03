-- query 4 index optimization 

CREATE INDEX user_id ON user_posts (user_id);
SELECT *
FROM users u 
CROSS JOIN follows f
CROSS JOIN comments c
CROSS JOIN posts p
GROUP BY c.user_id
order by c.id 
having count(c.id) > 5;