db = new Mongo().getDB("social");

// Create collections
db.createCollection("users");
db.createCollection("posts");
db.createCollection("comments");
db.createCollection("replies");
db.createCollection("likes");
db.createCollection("follows");
db.createCollection("messages");


