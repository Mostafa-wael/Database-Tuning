
-- add composite index for users table if not exists
CREATE INDEX IF NOT EXISTS users_age_city_idx ON users (city, age);
-- we changed the order of the condiotions in the where clause to make indexing more efficient
-- indexing won't be efficient due to the use of LIKE operator
EXPLAIN (ANALYZE TRUE, TIMING TRUE) SELECT p.id , p.body , p.title  
FROM  users u
INNER JOIN posts p ON u.id = p.user_id
WHERE  u.City = 'city 1' and u.age > 28  and
p.title LIKE '%title 1%' and p.body LIKE '%body 2%' 
GROUP BY p.id, p.body, p.title;

-- remove all the indexes
DROP INDEX users_age_city_idx;
