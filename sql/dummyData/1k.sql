SELECT setseed(.123);

INSERT INTO users(first_name, last_name, email, password)
SELECT CONCAT('First Name ', FLOOR(1 + RANDOM() * 1000)), CONCAT('Last Name ', FLOOR(1 + RANDOM() * 1000)), CONCAT('email ', FLOOR(1 + RANDOM() * 1000)), CONCAT('password ', FLOOR(1 + RANDOM() * 1000))
FROM generate_series(1, 1000) AS id;


INSERT INTO posts(user_id, title, body)
SELECT FLOOR(1 + RANDOM() * 1000), CONCAT('Title ', FLOOR(1 + RANDOM() * 1000)), CONCAT('Body ', FLOOR(1 + RANDOM() * 1000))
FROM generate_series(1, 1000) AS id;


INSERT INTO comments(user_id, post_id, body)
SELECT FLOOR(1 + RANDOM() * 1000), FLOOR(1 + RANDOM() * 1000), CONCAT('Body ', FLOOR(1 + RANDOM() * 1000))
FROM generate_series(1, 1000) AS id;



INSERT INTO replies(user_id, comment_id, body)
SELECT FLOOR(1 + RANDOM() * 1000), FLOOR(1 + RANDOM() * 1000), CONCAT('Body ', FLOOR(1 + RANDOM() * 1000))
FROM generate_series(1, 1000) AS id;


INSERT INTO likes(user_id, post_id)
SELECT FLOOR(1 + RANDOM() * 1000), FLOOR(1 + RANDOM() * 1000)
FROM generate_series(1, 1000) AS id;



INSERT INTO follows(user_id, follower_id)
SELECT FLOOR(1 + RANDOM() * 1000), FLOOR(1 + RANDOM() * 1000)
FROM generate_series(1, 1000) AS id;


INSERT INTO messages(sender_id, receiver_id, body)
SELECT FLOOR(1 + RANDOM() * 1000), FLOOR(1 + RANDOM() * 1000), CONCAT('Body ', FLOOR(1 + RANDOM() * 1000))
FROM generate_series(1, 1000) AS id;

-- Print "Okay" if the number of users is 1000  
SELECT CASE WHEN COUNT(*) = 1000 THEN 'Okay' ELSE 'Not Okay' END FROM users;