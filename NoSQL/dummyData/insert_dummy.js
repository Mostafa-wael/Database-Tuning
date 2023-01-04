// store start time
var start = new Date().getTime();


// initialize bulk operation
var bulk = db.dummy.initializeUnorderedBulkOp();
// Query 1
//get the count of posts that have more than 20 likes in the city 1
// First, get all users in city 1
// Second, get all posts for each user
// Third, get all likes for each post
// Fourth, count the number of posts that have more than 20 likes
// count = 0;
// db.users.find({city: 'city 1'}).forEach(function(user) {
//     db.user_posts.find({user_id: user.id}).forEach(function(post) {
//         var likes = db.likes.find({post_id: post.post_id}).count();
//         if (likes >= 10) {
//             count++;
//         }
//     });
// });
// print(count);
// execute bulk operation
// bulk.execute();


// Query 2
// get comment id and post id for each user age greater than 25 and lives in city 1
// loop through each user
// db.users.find({age: {$gt: 25}, city: 'city 1'}).forEach(function(user) {
//     db.user_posts.find({user_id: user.id}).forEach(function(post) {
//         db.user_comments.find({post_id: post.post_id}).forEach(function(comment) {
//             bulk.insert({
//                 user_id: user._id,
//                 post_id: post._id,
//                 comment_id: comment._id
//             });
//         });
//     });
// });

// Query 3
// get all the posts with the number of likes in the city 1

// db.users.find({city: 'city 1'}).forEach(function(user) {
//     db.user_posts.find({user_id: user.id}).forEach(function(post) {
//         var likes = db.likes.find({
//             post_id: post.post_id
//         }).count();
//         bulk.insert({
//             user_id: user._id,
//             post_id: post._id,
//             likes: likes
//         });
//     });
// });
// execute bulk operation

// Query 4
// Select all posts that their user is older than 28 and lives in city 1 and has a body like '%lorem%' and a title like '%ipsum%'

db.users.find({age: {$gt: 28}, city: 'city 1'}).forEach(function(user) {
    db.user_posts.find({user_id: user.id, body: /body 2/, title: /title 1/}).forEach(function(post) {
    });
});

// bulk.execute();



// store end time
var end = new Date().getTime();
// print the time taken in milliseconds
print(end - start + " ms");