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
 
--query 2
SELECT distinct u.first_name , u.last_name , u.email
FROM users u  
CROSS JOIN user_posts p
CROSS JOIN user_comments c
CROSS JOIN replies r
where u.id = p.user_id and u.id = c.user_id
and u.id = r.user_id 
group by p.id , u.first_name , u.last_name , u.email;

--query 3
SELECT p.id ,count(*)
FROM user_posts p
CROSS JOIN user_comments c
CROSS JOIN likes l
where p.post_id = c.post_id 
and p.post_id = l.post_id
group by p.id , l.id 
having count(l.id) > 1



