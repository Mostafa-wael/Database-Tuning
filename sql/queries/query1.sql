-- select all the users with more than 100 posts and more than 100 comments
select * from users where id in (select user_id from posts group by user_id having count(*) > 100) and id in (select user_id from comments group by user_id having count(*) > 100); 
