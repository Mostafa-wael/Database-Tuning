SELECT setseed(.123);

INSERT INTO users(first_name, last_name, email, password, age, city)
SELECT CONCAT('First Name ', FLOOR(1 + RANDOM() * 100)), CONCAT('Last Name ', FLOOR(1 + RANDOM() * 100)), CONCAT('email ', FLOOR(1 + RANDOM() * 100)), CONCAT('password ', FLOOR(1 + RANDOM() * 100)), FLOOR(10 + RANDOM() * 30), CONCAT('city ', FLOOR(1 + RANDOM() * 3))
FROM generate_series(1, 50000) AS id;


INSERT INTO posts(title, body, user_id)
SELECT CONCAT('Title ', FLOOR(1 + RANDOM() * 100)), CONCAT('Body ', FLOOR(1 + RANDOM() * 100)), FLOOR(1 + RANDOM() * 10000)
FROM generate_series(1, 50000) AS id;


INSERT INTO comments(user_id, post_id, body )
SELECT user_id, post_id,  CONCAT('Body ', FLOOR(1 + RANDOM() * 100))
FROM user_posts;

INSERT INTO replies(user_id, comment_id, body)
SELECT user_id, comment_id, CONCAT('Body ', FLOOR(1 + RANDOM() * 100))
FROM user_comments
on conflict do nothing;


INSERT INTO likes(user_id, post_id)
SELECT user_id, post_id
FROM user_posts
on conflict do nothing;



INSERT INTO follows(user_id, follower_id)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 1000)
FROM generate_series(1, 50000) AS id
on conflict do nothing;



INSERT INTO messages(sender_id, receiver_id, body)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 1000), CONCAT('Body ', FLOOR(1 + RANDOM() * 100))
FROM generate_series(1, 50000) AS id
on conflict do nothing;



