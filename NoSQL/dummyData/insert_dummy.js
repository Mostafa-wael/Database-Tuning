// Insert 1k dummy data into the database

db = db.getSiblingDB('Users')
var dummy_size = 10000;
for (var i = 0; i < dummy_size; i++) {
    db.users.insert({
        id: i,
        first_name: "Mourad" + i,
        last_name: "ElAtrosh" + i,
        email: "user" + i + "@gmail.com",
        password: "123456"
    });
}

// insert dummy posts into posts collection
for (var i = 0; i < dummy_size; i++) {
    db.posts.insert({
        id: i,
        user_id: i,
        title: "Title" + i,
        body: "Content" + i
    });
}

// insert dummy comments into comments collection
for (var i = 0; i < dummy_size; i++) {
    db.comments.insert({
        id: i,
        user_id: i,
        post_id: i,
        body: "Comment" + i
    });
}

//insert dummy replies into replies collection
for (var i = 0; i < dummy_size; i++) {
    db.replies.insert({
        id: i,
        user_id: i,
        comment_id: i,
        body: "Reply" + i
    });
}

// insert dummy likes into likes collection
for (var i = 0; i < dummy_size; i++) {
    db.likes.insert({
        id: i,
        user_id: i,
        post_id: i
    });
}

// insert dummy follows into follows collection
for (var i = 0; i < dummy_size; i++) {
    db.follows.insert({
        id: i,
        user_id: i,
        following_id: i
    });
}

// insert dummy messages into messages collection
for (var i = 0; i < dummy_size; i++) {
    db.messages.insert({
        id: i,
        sender_id: i,
        receiver_id: i,
        body: "Message" + i
    });
}

