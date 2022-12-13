-- Define a limit varibale
SET @limit = 1000;
-- \set limit :upper_bound  


-- Create random data :upper_bound rows for users table with first name, last name, email, password
INSERT INTO users(first_name, last_name, email, password)
SELECT CONCAT('First Name ', FLOOR(1 + RAND() * :upper_bound)), CONCAT('Last Name ', FLOOR(1 + RAND() * :upper_bound)), CONCAT('email ', FLOOR(1 + RAND() * :upper_bound)), CONCAT('password ', FLOOR(1 + RAND() * :upper_bound))
FROM users
LIMIT :upper_bound;


-- Create random data :upper_bound rows for posts table
INSERT INTO posts(user_id, title, body)
SELECT FLOOR(1 + RAND() * :upper_bound), CONCAT('Title ', FLOOR(1 + RAND() * :upper_bound)), CONCAT('Body ', FLOOR(1 + RAND() * :upper_bound))
FROM posts
LIMIT :upper_bound;

-- Create random data :upper_bound rows for comments table
INSERT INTO comments(user_id, post_id, body)
SELECT FLOOR(1 + RAND() * :upper_bound), FLOOR(1 + RAND() * :upper_bound), CONCAT('Body ', FLOOR(1 + RAND() * :upper_bound))
FROM comments
LIMIT :upper_bound;

-- Create random data :upper_bound rows for replies table
INSERT INTO replies(user_id, comment_id, body)
SELECT FLOOR(1 + RAND() * :upper_bound), FLOOR(1 + RAND() * :upper_bound), CONCAT('Body ', FLOOR(1 + RAND() * :upper_bound))
FROM replies
LIMIT :upper_bound;

-- create random data :upper_bound rows for likes table
INSERT INTO likes(user_id, post_id)
SELECT FLOOR(1 + RAND() * :upper_bound), FLOOR(1 + RAND() * :upper_bound)
FROM likes
LIMIT :upper_bound;


-- Create random data :upper_bound rows for follows table
INSERT INTO follows(user_id, follower_id)
SELECT FLOOR(1 + RAND() * :upper_bound), FLOOR(1 + RAND() * :upper_bound)
FROM follows
LIMIT :upper_bound;

-- Create random data :upper_bound rows for messages table
INSERT INTO messages(sender_id, receiver_id, body)
SELECT FLOOR(1 + RAND() * :upper_bound), FLOOR(1 + RAND() * :upper_bound), CONCAT('Body ', FLOOR(1 + RAND() * :upper_bound))
FROM messages
LIMIT :upper_bound;


