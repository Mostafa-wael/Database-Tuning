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
)
and age > 28 ;

-- query 2

SELECT u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id
FROM users u
CROSS JOIN user_posts up
CROSS JOIN posts p
CROSS JOIN user_comments uc
CROSS JOIN comments c
CROSS JOIN replies r
CROSS JOIN likes l
group by p.id , u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id
order by p.id , u.first_name , u.last_name , u.email , p.title , p.body , c.body , r.body , l.id;
having count(l.id) > 7
where p.title LIKE '%title12%' and p.body LIKE '%body22%' and u.age > 20  ;


--query 3
SELECT p.id ,count(*)
FROM user_posts p
CROSS JOIN user_comments c
CROSS JOIN likes l
group by p.id , l.id 
having count(l.id) > 2;

--query 4
-- We want to write a very complex query
-- We want to find all the followers of a certian user that have more than 5 comments on all the users posts
SELECT *
FROM users u 
CROSS JOIN follows f
CROSS JOIN comments c
CROSS JOIN posts p
GROUP BY c.user_id
order by c.id 
having count(c.id) > 5
where  c.body '%body22%' LIKE u.age > 29;





