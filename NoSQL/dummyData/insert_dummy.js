// Insert 1k dummy data into the database

db = db.getSiblingDB('social')

// Fisrt delete all documents in all collections
console.log("Deleting all documents in all collections");
db.users.remove({});
db.posts.remove({});
db.user_posts.remove({});
db.likes.remove({});
db.comments.remove({});
db.user_comments.remove({});
db.replies.remove({});
db.likes.remove({});
db.follows.remove({});
db.messages.remove({});
console.log("All documents deleted");

// Store start time
var start = new Date().getTime();

console.log("Inserting dummy data into users collection");
var dummy_size = process.env.DUMMY_SIZE;
var bulk = db.users.initializeUnorderedBulkOp();
for (var i = 0; i < dummy_size; i++) {
    bulk.insert({
        id: i,
        first_name: "Mourad" + i,
        last_name: "ElAtrosh" + i,
        email: "user" + i + "@gmail.com",
        password: "123456"
    });
}
bulk.execute();
// Use bulk insert to insert 1000 documents at once

console.log("Inserting dummy data into posts collection");
var bulk = db.posts.initializeUnorderedBulkOp();
// insert dummy posts into posts collection
for (var i = 0; i < dummy_size; i++) {
    bulk.insert({
        id: i,
        title: "Title" + i,
        body: "Content" + i
    });
}
bulk.execute();

console.log("Inserting dummy data into user_posts collection");
var bulk = db.user_posts.initializeUnorderedBulkOp();
// insert dummy user_posts into user_posts collection
for (var i = 0; i < dummy_size; i++) {
    bulk.insert({
        id: i,
        user_id: i,
        post_id: i
    });
}
bulk.execute();

console.log("Inserting dummy data into comments collection");
var bulk = db.comments.initializeUnorderedBulkOp();
// insert dummy comments into comments collection
for (var i = 0; i < dummy_size; i++) {
    bulk.insert({
        id: i,
        body: "Comment" + i
    });
}
bulk.execute();

console.log("Inserting dummy data into user_comments collection");
var bulk = db.user_comments.initializeUnorderedBulkOp();
// insert dummy user_comments into user_comments collection
for (var i = 0; i < dummy_size; i++) {
    bulk.insert({
        id: i,
        user_id: i,
        post_id: i,
        comment_id: i
    });
}
bulk.execute();

console.log("Inserting dummy data into replies collection");
var bulk = db.replies.initializeUnorderedBulkOp();
//insert dummy replies into replies collection
for (var i = 0; i < dummy_size; i++) {
    bulk.insert({
        id: i,
        user_id: i,
        comment_id: i,
        body: "Reply" + i
    });
}
bulk.execute();

console.log("Inserting dummy data into likes collection");
var bulk = db.likes.initializeUnorderedBulkOp();
// insert dummy likes into likes collection
for (var i = 0; i < dummy_size; i++) {
    bulk.insert({
        id: i,
        user_id: i,
        post_id: i
    });
}
bulk.execute();

console.log("Inserting dummy data into follows collection");
var bulk = db.follows.initializeUnorderedBulkOp();
// insert dummy follows into follows collection
for (var i = 0; i < dummy_size; i++) {
    bulk.insert({
        id: i,
        user_id: i,
        following_id: i
    });
}
bulk.execute();

console.log("Inserting dummy data into messages collection");
var bulk = db.messages.initializeUnorderedBulkOp();
// insert dummy messages into messages collection
for (var i = 0; i < dummy_size; i++) {
    bulk.insert({
        id: i,
        sender_id: i,
        receiver_id: i,
        body: "Message" + i
    });
}
bulk.execute();

// Store end time
var end = new Date().getTime();
var time = end - start;
// print time in seconds
console.log("Time taken to insert "+ process.env.DUMMY_SIZE +" data: " + time / 1000 + " seconds");

