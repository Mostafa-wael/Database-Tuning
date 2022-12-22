## Report

## System Specifications
| Name | Version |
|------|---------|
| OS   | Ubuntu 22.04 LTS |
| CPU  | Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz |
| RAM  | 16 GB |

## Postgres Server Statistics Report
| Table Name    | Row Count | Main Key | Indexes | FK  | Identity Column | Max Row Size(Bytes) |
|---------------|-----------|----------|---------|-----|-----------------|---------------------|
| users         | 10000     | Yes      | No      | No  | Yes             | 87                  |
| posts         | 10000     | Yes      | No      | No  | Yes             | 50                  |
| user_posts    | 10000     | Yes      | No      | Yes | Yes             | 35                  |
| comments      | 10000     | Yes      | No      | No  | Yes             | 38                  |
| user_comments | 10000     | Yes      | No      | Yes | Yes             | 39                  |
| replies       | 10000     | Yes      | No      | Yes | Yes             | 46                  |
| likes         | 10000     | Yes      | No      | Yes | Yes             | 35                  |
| follows       | 10000     | Yes      | No      | Yes | Yes             | 35                  |
| messages      | 10000     | Yes      | No      | Yes | Yes             | 46                  |

## MongoDB Server Schema
###  users
``` json
{
    _id: ObjectId('63a4a1341a8351e734f80e5a'),
    id: 0,
    first_name: 'Mourad0',
    last_name: 'ElAtrosh0',
    email: 'user0@gmail.com',
    password: '123456'
}
```
###  posts
``` json
{
    _id: ObjectId('63a4a1541a8351e73407509b'),
    id: 0,
    title: 'Title0',
    body: 'Content0'
}
```
###  user_posts
``` json
{
    _id: ObjectId('63a4a1731a8351e7341692db'),
    id: 0,
    user_id: 0,
    post_id: 0
}
```
###  comments
``` json
{
    _id: ObjectId('63a4a1931a8351e73425d51b'),
    id: 0,
    body: 'Comment0'
}
```
###  user_comments
``` json
{
    _id: ObjectId('63a4a1b61a8351e73435175b'),
    id: 0,
    user_id: 0,
    post_id: 0,
    comment_id: 0
}
```
###  replies
``` json
{
    _id: ObjectId('63a4a1e31a8351e73444599b'),
    id: 0,
    user_id: 0,
    comment_id: 0,
    body: 'Reply0'
}
```
###  likes
``` json
{
    _id: ObjectId('63a4a20d1a8351e734539bdb'),
    id: 0,
    user_id: 0,
    post_id: 0
}
```
###  follows
``` json
{
    _id: ObjectId('63a4a2351a8351e73462de1b'),
    id: 0,
    user_id: 0,
    following_id: 0
}
```
###  messages
``` json
{
    _id: ObjectId('63a4a2611a8351e73472205b'),
    id: 0,
    sender_id: 0,
    receiver_id: 0,
    body: 'Message0'
}
```