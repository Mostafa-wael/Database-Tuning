db = new Mongo().getDB("Users");

// Create collections
db.createCollection("users");
db.createCollection("posts");
db.createCollection("comments");
db.createCollection("replies");
db.createCollection("likes");
db.createCollection("follows");
db.createCollection("messages");


