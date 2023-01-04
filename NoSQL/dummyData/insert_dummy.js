// store start time
var start = new Date().getTime();


// initialize bulk operation
var bulk = db.dummy.initializeUnorderedBulkOp();
// get comment id and post id for each user age greater than 25 and lives in city 1
// loop through each user
db.users.find({age: {$gt: 25}, city: 'city 1'}).forEach(function(user) {
    db.user_posts.find({user_id: user.id}).forEach(function(post) {
        db.user_comments.find({post_id: post.post_id}).forEach(function(comment) {
            bulk.insert({
                user_id: user._id,
                post_id: post._id,
                comment_id: comment._id
            });
        });
    });
});
// execute bulk operation
bulk.execute();


// store end time
var end = new Date().getTime();
// print the time taken in milliseconds
print(end - start + " ms");