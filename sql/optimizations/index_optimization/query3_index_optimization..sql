
SELECT p.id ,count(*)
FROM user_posts p
CROSS JOIN user_comments c
CROSS JOIN likes l
group by p.id , l.id 
having count(l.id) > 1;