-- get size of each table
SELECT SUM(pg_column_size(users.*))/COUNT(*) FROM users;
SELECT SUM(pg_column_size(posts.*))/COUNT(*) FROM posts;
SELECT SUM(pg_column_size(user_posts.*))/COUNT(*) FROM user_posts;
SELECT SUM(pg_column_size(comments.*))/COUNT(*) FROM comments;
SELECT SUM(pg_column_size(user_comments.*))/COUNT(*) FROM user_comments;
SELECT SUM(pg_column_size(replies.*))/COUNT(*) FROM replies;
SELECT SUM(pg_column_size(likes.*))/COUNT(*) FROM likes;
SELECT SUM(pg_column_size(follows.*))/COUNT(*) FROM follows;
SELECT SUM(pg_column_size(messages.*))/COUNT(*) FROM messages;

-- get row count for each table
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM posts;
SELECT COUNT(*) FROM user_posts;
SELECT COUNT(*) FROM comments;
SELECT COUNT(*) FROM user_comments;
SELECT COUNT(*) FROM replies;
SELECT COUNT(*) FROM likes;
SELECT COUNT(*) FROM follows;
SELECT COUNT(*) FROM messages;

-- get the number of foreign keys for each table
