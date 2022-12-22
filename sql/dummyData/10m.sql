SELECT setseed(.123);

INSERT INTO users(first_name, last_name, email, password)
SELECT CONCAT('First Name ', FLOOR(1 + RANDOM() * 10000000)), CONCAT('Last Name ', FLOOR(1 + RANDOM() * 10000000)), CONCAT('email ', FLOOR(1 + RANDOM() * 10000000)), CONCAT('password ', FLOOR(1 + RANDOM() * 10000000))
FROM generate_series(1, 1000000) AS id;


INSERT INTO posts(title, body)
SELECT CONCAT('Title ', FLOOR(1 + RANDOM() * 10000000)), CONCAT('Body ', FLOOR(1 + RANDOM() * 10000000))
FROM generate_series(1, 100000) AS id;

INSERT INTO user_posts(user_id, post_id)
SELECT FLOOR(1 + RANDOM() * 10000000), FLOOR(1 + RANDOM() * 10000000)
FROM generate_series(1, 100000) AS id;


INSERT INTO comments(body)
SELECT CONCAT('Body ', FLOOR(1 + RANDOM() * 10000000))
FROM generate_series(1, 100000) AS id;

INSERT INTO user_comments(user_id, post_id, comment_id)
SELECT FLOOR(1 + RANDOM() * 10000000), FLOOR(1 + RANDOM() * 10000000),FLOOR(1 + RANDOM() * 10000000)
FROM generate_series(1, 100000) AS id;


INSERT INTO replies(user_id, comment_id, body)
SELECT FLOOR(1 + RANDOM() * 10000000), FLOOR(1 + RANDOM() * 10000000), CONCAT('Body ', FLOOR(1 + RANDOM() * 10000000))
FROM generate_series(1, 100000) AS id;


INSERT INTO likes(user_id, post_id)
SELECT FLOOR(1 + RANDOM() * 10000000), FLOOR(1 + RANDOM() * 10000000)
FROM generate_series(1, 100000) AS id;



INSERT INTO follows(user_id, follower_id)
SELECT FLOOR(1 + RANDOM() * 10000000), FLOOR(1 + RANDOM() * 10000000)
FROM generate_series(1, 100000) AS id;


INSERT INTO messages(sender_id, receiver_id, body)
SELECT FLOOR(1 + RANDOM() * 10000000), FLOOR(1 + RANDOM() * 10000000), CONCAT('Body ', FLOOR(1 + RANDOM() * 10000000))
FROM generate_series(1, 100000) AS id;

-- Print "Okay" if the number of users is 10000000  
SELECT CASE WHEN COUNT(*) = 10000000 THEN 'Okay' ELSE 'Not Okay' END FROM users;