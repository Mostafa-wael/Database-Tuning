-- export all tables data as json to be used in mongoDB
COPY ( SELECT json_agg(t) :: text FROM ( SELECT * FROM users ) t ) TO '/tmp/users.json';
COPY ( SELECT json_agg(t) :: text FROM ( SELECT * FROM posts ) t ) TO '/tmp/posts.json';
COPY ( SELECT json_agg(t) :: text FROM ( SELECT * FROM user_posts ) t ) TO '/tmp/user_posts.json';
COPY ( SELECT json_agg(t) :: text FROM ( SELECT * FROM comments ) t ) TO '/tmp/comments.json';
COPY ( SELECT json_agg(t) :: text FROM ( SELECT * FROM user_comments ) t ) TO '/tmp/user_comments.json';
COPY ( SELECT json_agg(t) :: text FROM ( SELECT * FROM replies ) t ) TO '/tmp/replies.json';
COPY ( SELECT json_agg(t) :: text FROM ( SELECT * FROM likes ) t ) TO '/tmp/likes.json';
COPY ( SELECT json_agg(t) :: text FROM ( SELECT * FROM follows ) t ) TO '/tmp/follows.json';
COPY ( SELECT json_agg(t) :: text FROM ( SELECT * FROM messages ) t ) TO '/tmp/messages.json';
