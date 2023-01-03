SELECT setseed(.123);

INSERT INTO users(first_name, last_name, email, password)
SELECT CONCAT('First Name ', FLOOR(1 + RANDOM() * 100)), CONCAT('Last Name ', FLOOR(1 + RANDOM() * 100)), CONCAT('email ', FLOOR(1 + RANDOM() * 100)), CONCAT('password ', FLOOR(1 + RANDOM() * 100)), FLOOR(10 + RANDOM() * 30)
FROM generate_series(1, 50) AS id;


INSERT INTO posts(title, body)
SELECT CONCAT('Title ', FLOOR(1 + RANDOM() * 100)), CONCAT('Body ', FLOOR(1 + RANDOM() * 100))
FROM generate_series(1, 1000) AS id;

INSERT INTO user_posts(user_id, post_id)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 100)
FROM generate_series(1, 100000) AS id;


INSERT INTO comments(body)
SELECT CONCAT('Body ', FLOOR(1 + RANDOM() * 100))
FROM generate_series(1, 100000) AS id;

INSERT INTO user_comments(user_id, post_id, comment_id)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 100),FLOOR(1 + RANDOM() * 100)
FROM generate_series(1, 100000) AS id;


INSERT INTO replies(user_id, comment_id, body)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 100), CONCAT('Body ', FLOOR(1 + RANDOM() * 100))
FROM generate_series(1, 100000) AS id;


INSERT INTO likes(user_id, post_id)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 100)
FROM generate_series(1, 100000) AS id;



INSERT INTO follows(user_id, follower_id)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 100)
FROM generate_series(1, 100000) AS id;


INSERT INTO messages(sender_id, receiver_id, body)
SELECT FLOOR(1 + RANDOM() * 100), FLOOR(1 + RANDOM() * 100), CONCAT('Body ', FLOOR(1 + RANDOM() * 100))
FROM generate_series(1, 100000) AS id;


-- custom data
-- 100 users with 25 as age
INSERT INTO users(first_name, last_name, email, password,age, city)
SELECT CONCAT('First Name ', FLOOR(1 + RANDOM() * 1000)), CONCAT('Last Name ', FLOOR(1 + RANDOM() * 1000)), CONCAT('email ', FLOOR(1 + RANDOM() * 1000)), CONCAT('password ', FLOOR(1 + RANDOM() * 1000)), FLOOR(25) , CONCAT('city ', FLOOR(1 + RANDOM() * 1000))
FROM generate_series(1, 100) AS id;

-- 100 users with age more than 30
INSERT INTO users(first_name, last_name, email, password,age, city)
SELECT CONCAT('First Name ', FLOOR(1 + RANDOM() * 1000)), CONCAT('Last Name ', FLOOR(1 + RANDOM() * 1000)), CONCAT('email ', FLOOR(1 + RANDOM() * 1000)), CONCAT('password ', FLOOR(1 + RANDOM() * 1000)), FLOOR(30 + RANDOM() * 30) , CONCAT('city ', FLOOR(1 + RANDOM() * 1000))
FROM generate_series(1, 100) AS id;

-- 1000 users with cairo as city
INSERT INTO users(first_name, last_name, email, password,age, city)
SELECT CONCAT('First Name ', FLOOR(1 + RANDOM() * 1000)), CONCAT('Last Name ', FLOOR(1 + RANDOM() * 1000)), CONCAT('email ', FLOOR(1 + RANDOM() * 1000)), CONCAT('password ', FLOOR(1 + RANDOM() * 1000)), FLOOR(15 + RANDOM() * 30) , 'Cairo'
FROM generate_series(1, 100) AS id;

-- 1000 users with Giza as city
INSERT INTO users(first_name, last_name, email, password,age, city)
SELECT CONCAT('First Name ', FLOOR(1 + RANDOM() * 1000)), CONCAT('Last Name ', FLOOR(1 + RANDOM() * 1000)), CONCAT('email ', FLOOR(1 + RANDOM() * 1000)), CONCAT('password ', FLOOR(1 + RANDOM() * 1000)), FLOOR(15 + RANDOM() * 30) , 'Giza'
FROM generate_series(1, 100) AS id;