SET SESSION AUTHORIZATION DEFAULT;
RESET ALL;
DEALLOCATE ALL;
CLOSE ALL;
UNLISTEN *;
SELECT pg_advisory_unlock_all();
DISCARD PLANS;
DISCARD SEQUENCES;
DISCARD TEMP;


-- get the posts with max likes in every city
EXPLAIN (ANALYZE TRUE, TIMING TRUE) 
SELECT up.post_id , p.body , p.title  
FROM  users u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
INNER JOIN posts p ON p.id = up.post_id
INNER JOIN comments c ON c.id = uc.comment_id
WHERE u.age > 28 and u.City = 'Giza' and
p.title LIKE '%title 12%' and p.body LIKE '%body 22%' 
GROUP BY up.post_id, p.body, p.title;

-- rewrite the query using the cte on city and post body
EXPLAIN (ANALYZE TRUE, TIMING TRUE)
with CTE as (SELECT * FROM users WHERE age > 25 and city = 'Giza')
SELECT uc.comment_id, up.post_id FROM CTE AS u
INNER JOIN user_posts up ON u.id = up.user_id
INNER JOIN user_comments uc ON u.id = uc.user_id
inner join posts p on p.id = up.post_id
where p.title LIKE '%title 12%' and p.body LIKE '%body 22%'
GROUP BY up.post_id , uc.comment_id;









