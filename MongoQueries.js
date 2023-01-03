// Query 1
db.users.aggregate([
    {
        $lookup: {
            from: "user_posts",
            localField: "id",
            foreignField: "user_id",
            as: "user_posts"
        }
    },
    {
        $lookup: {
            from: "user_comments",
            localField: "id",
            foreignField: "user_id",
            as: "user_comments"
        }
    },
    {
        $match: {
            $expr: {
                $and: [
                    { $gt: ["$age", 28] },
                    { $gt: [{ $size: "$user_posts" }, 0] },
                    { $gt: [{ $size: "$user_comments" }, 0] }
                ]
            }
        }
    }
]);


db.users.aggregate([
    {
        $lookup: {
            from: "user_posts",
            localField: "id",
            foreignField: "user_id",
            as: "user_posts",
        },
    },
    {
        $lookup: {
            from: "user_comments",
            localField: "id",
            foreignField: "user_id",
            as: "user_comments",
        },
    },
    {
        $lookup: {
            from: "posts",
            localField: "user_posts.post_id",
            foreignField: "id",
            as: "posts",
        },
    },
    {
        $lookup: {
            from: "comments",
            localField: "user_comments.comment_id",
            foreignField: "id",
            as: "comments",
        },
    },
    {
        $lookup: {
            from: "replies",
            localField: "comments.id",
            foreignField: "comment_id",
            as: "replies",
        },
    },
    {
        $lookup: {
            from: "likes",
            localField: "posts.id",
            foreignField: "post_id",
            as: "post_likes",
        },
    },
    {
        $lookup: {
            from: "likes",
            localField: "comments.id",
            foreignField: "comment_id",
            as: "comment_likes",
        },
    },
    {
        $match: {
            $expr: {
                $and: [
                    { $gt: ["$age", 20] },
                    { $gt: [{ $size: "$user_posts" }, 0] },
                    { $gt: [{ $size: "$user_comments" }, 0] },
                    { $gt: [{ $size: "$posts" }, 0] },
                    { $gt: [{ $size: "$comments" }, 0] },
                    { $gt: [{ $size: "$replies" }, 0] },
                    { $gt: [{ $size: "$post_likes" }, 7] },
                    { $gt: [{ $size: "$comment_likes" }, 7] },
                ],
            },
        },
    },

]);
