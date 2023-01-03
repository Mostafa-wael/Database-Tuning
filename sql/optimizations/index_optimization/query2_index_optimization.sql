-- query2_index_optimization 


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
where u.age > 20;

