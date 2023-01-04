SELECT setseed(.123);

INSERT INTO users(first_name, last_name, email, password, age, city)
SELECT CONCAT('First Name ', FLOOR(1 + RANDOM() * 100)), CONCAT('Last Name ', FLOOR(1 + RANDOM() * 100)), CONCAT('email ', FLOOR(1 + RANDOM() * 100)), CONCAT('password ', FLOOR(1 + RANDOM() * 100)), FLOOR(10 + RANDOM() * 30), CONCAT('city ', FLOOR(1 + RANDOM() * 3))
FROM generate_series(1, 100000) AS id;


INSERT INTO posts(title, body)
SELECT CONCAT('Title ', FLOOR(1 + RANDOM() * 100)), CONCAT('Body ', FLOOR(1 + RANDOM() * 100))
FROM generate_series(1, 100000) AS id;

INSERT INTO user_posts(user_id, post_id)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 100000)
FROM generate_series(1, 1000000) AS id
on conflict do nothing;

INSERT INTO comments(body)
SELECT CONCAT('Body ', FLOOR(1 + RANDOM() * 100))
FROM generate_series(1, 100000) AS id;

--- Apply Cross Join for 10000 rows only
INSERT INTO user_comments(user_id, post_id, comment_id)
SELECT user_id, post_id, FLOOR(1 + RANDOM() * 100000)
FROM user_posts;


INSERT INTO replies(user_id, comment_id, body)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 100), CONCAT('Body ', FLOOR(1 + RANDOM() * 100))
FROM generate_series(1, 100000) AS id
on conflict do nothing;


INSERT INTO likes(user_id, post_id)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 100000)
FROM generate_series(1, 100000) AS id
on conflict do nothing;



INSERT INTO follows(user_id, follower_id)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 1000)
FROM generate_series(1, 100000) AS id
on conflict do nothing;



INSERT INTO messages(sender_id, receiver_id, body)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 1000), CONCAT('Body ', FLOOR(1 + RANDOM() * 100))
FROM generate_series(1, 100000) AS id
on conflict do nothing;



