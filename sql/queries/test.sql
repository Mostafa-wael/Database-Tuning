EXPLAIN (ANALYZE TRUE, TIMING TRUE)
with CTE as (SELECT * FROM users WHERE age > 25 and city = 'city 1')
SELECT  up.post_id FROM CTE AS u
INNER JOIN user_posts up ON u.id = up.user_id
inner join posts p on p.id = up.post_id
where p.title LIKE '%title 1%' and p.body LIKE '%body 2%'
GROUP BY up.post_id;