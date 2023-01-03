--query 4
-- We want to find all the followers of a certian user that have more than 5 comments on all the users posts
SELECT *
FROM users u 
CROSS JOIN follows f
CROSS JOIN comments c
CROSS JOIN posts p
GROUP BY c.user_id
order by c.id 
having count(c.id) > 5




