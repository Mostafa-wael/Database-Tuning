
-- DECLARE upper_bound CONSTANT integer := 1000;



SELECT setseed(.123);

INSERT INTO users(first_name, last_name, email, password)
SELECT CONCAT('First Name ', FLOOR(1 + RANDOM() * 1000)), CONCAT('Last Name ', FLOOR(1 + RANDOM() * 1000)), CONCAT('email ', FLOOR(1 + RANDOM() * 1000)), CONCAT('password ', FLOOR(1 + RANDOM() * 1000))
FROM users
LIMIT 1000;


INSERT INTO posts(user_id, title, body)
SELECT FLOOR(1 + RANDOM() * 1000), CONCAT('Title ', FLOOR(1 + RANDOM() * 1000)), CONCAT('Body ', FLOOR(1 + RANDOM() * 1000))
FROM posts
LIMIT 1000;


INSERT INTO comments(user_id, post_id, body)
SELECT FLOOR(1 + RANDOM() * 1000), FLOOR(1 + RANDOM() * 1000), CONCAT('Body ', FLOOR(1 + RANDOM() * 1000))
FROM comments
LIMIT 1000;


INSERT INTO replies(user_id, comment_id, body)
SELECT FLOOR(1 + RANDOM() * 1000), FLOOR(1 + RANDOM() * 1000), CONCAT('Body ', FLOOR(1 + RANDOM() * 1000))
FROM replies
LIMIT 1000;

INSERT INTO likes(user_id, post_id)
SELECT FLOOR(1 + RANDOM() * 1000), FLOOR(1 + RANDOM() * 1000)
FROM likes
LIMIT 1000;


INSERT INTO follows(user_id, follower_id)
SELECT FLOOR(1 + RANDOM() * 1000), FLOOR(1 + RANDOM() * 1000)
FROM follows
LIMIT 1000;

INSERT INTO messages(sender_id, receiver_id, body)
SELECT FLOOR(1 + RANDOM() * 1000), FLOOR(1 + RANDOM() * 1000), CONCAT('Body ', FLOOR(1 + RANDOM() * 1000))
FROM messages
LIMIT 1000;
