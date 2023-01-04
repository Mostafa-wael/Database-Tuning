CREATE DATABASE optimized_db;
SELECT 'optimized_db';

CREATE TABLE users (
  id SERIAL NOT NULL,
  first_name varchar(128) NOT NULL,
  last_name varchar(128) NOT NULL,
  email varchar(128) NOT NULL,
  age int NOT NULL,
  password varchar(128) NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE posts (
  id SERIAL NOT NULL,
  user_id int NOT NULL,
  title varchar(128) NOT NULL,
  body varchar(128) NOT NULL,
  CONSTRAINT user_posts_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (id)
);


CREATE TABLE comments (
  id SERIAL NOT NULL,
  user_id int NOT NULL,
  post_id int NOT NULL,
  CONSTRAINT user_comments_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT user_comments_ibfk_2 FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE ON UPDATE CASCADE,
  body varchar(128) NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE replies (
  id SERIAL NOT NULL,
  user_id int NOT NULL,
  comment_id int NOT NULL,
  body varchar(128) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT replies_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT replies_ibfk_2 FOREIGN KEY (comment_id) REFERENCES comments (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE likes (
  id SERIAL NOT NULL,
  user_id int NOT NULL,
  post_id int NOT NULL,
  PRIMARY KEY (id)
,
  CONSTRAINT likes_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT likes_ibfk_2 FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE follows (
  id SERIAL NOT NULL,
  user_id int NOT NULL,
  follower_id int NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT follows_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT follows_ibfk_2 FOREIGN KEY (follower_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE messages (
  id SERIAL NOT NULL,
  sender_id int NOT NULL,
  receiver_id int NOT NULL,
  body varchar(128) NOT NULL,
  PRIMARY KEY (id)
,
  CONSTRAINT messages_ibfk_1 FOREIGN KEY (sender_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT messages_ibfk_2 FOREIGN KEY (receiver_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);


