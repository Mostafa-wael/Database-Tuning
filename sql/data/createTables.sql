-- Create table for users
CREATE TABLE users (
  id int(11) NOT NULL AUTO_INCREMENT,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Create table for posts
CREATE TABLE posts (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  title varchar(255) NOT NULL,
  body text NOT NULL,
  PRIMARY KEY (id),
  KEY user_id (user_id),
  CONSTRAINT posts_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Create table for comments 
CREATE TABLE comments (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  post_id int(11) NOT NULL,
  body text NOT NULL,
  PRIMARY KEY (id),
  KEY user_id (user_id),
  KEY post_id (post_id),
  CONSTRAINT comments_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT comments_ibfk_2 FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Create table for replies
CREATE TABLE replies (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  comment_id int(11) NOT NULL,
  body text NOT NULL,
  PRIMARY KEY (id),
  KEY user_id (user_id),
  KEY comment_id (comment_id),
  CONSTRAINT replies_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT replies_ibfk_2 FOREIGN KEY (comment_id) REFERENCES comments (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Create table for likes
CREATE TABLE likes (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  post_id int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY user_id (user_id),
  KEY post_id (post_id),
  CONSTRAINT likes_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT likes_ibfk_2 FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Create table for follows
CREATE TABLE follows (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  follower_id int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY user_id (user_id),
  KEY follower_id (follower_id),
  CONSTRAINT follows_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT follows_ibfk_2 FOREIGN KEY (follower_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Create table for messages
CREATE TABLE messages (
  id int(11) NOT NULL AUTO_INCREMENT,
  sender_id int(11) NOT NULL,
  receiver_id int(11) NOT NULL,
  body text NOT NULL,
  PRIMARY KEY (id),
  KEY sender_id (sender_id),
  KEY receiver_id (receiver_id),
  CONSTRAINT messages_ibfk_1 FOREIGN KEY (sender_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT messages_ibfk_2 FOREIGN KEY (receiver_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


