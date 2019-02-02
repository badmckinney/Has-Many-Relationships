SELECT
*
FROM users;

SELECT
*
FROM posts
WHERE user_id = 100;

SELECT 
posts.id,
title,
url,
content,
posts.created_at,
posts.updated_at,
first_name,
last_name 
FROM posts INNER JOIN users
ON users.id = 200;

SELECT
posts.id,
title,
url,
content,
posts.created_at,
posts.updated_at,
username
FROM posts INNER JOIN users ON user_id = users.id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

SELECT
username
FROM users 
WHERE created_at > date '2015-01-01';

SELECT
username,
posts.title,
posts.content
FROM posts INNER JOIN users
ON user_id = users.id
WHERE users.created_at < date '2015-01-01';

SELECT
comments.id,
body,
comments.created_at,
comments.updated_at,
posts.title AS post_title
FROM comments INNER JOIN posts ON post_id = posts.id;

SELECT 
comments.id,
body AS comment_body,
comments.created_at,
comments.updated_at,
posts.title AS post_title,
posts.url AS post_url
FROM comments INNER JOIN posts ON post_id = posts.id
WHERE posts.created_at < date '2015-01-01';

SELECT 
comments.id,
body AS comment_body,
comments.created_at,
comments.updated_at,
posts.title AS post_title,
posts.url AS post_url
FROM comments INNER JOIN posts ON post_id = posts.id
WHERE posts.created_at > date '2015-01-01';

SELECT 
comments.id,
body AS comment_body,
comments.created_at,
comments.updated_at,
posts.title AS post_title,
posts.url AS post_url
FROM comments INNER JOIN posts ON post_id = posts.id
WHERE comments.body ~ 'USB';

SELECT
posts.title AS post_title,
users.first_name,
users.last_name,
comments.body AS comment_body
FROM comments INNER JOIN posts ON post_id = posts.id 
INNER JOIN users ON posts.user_id = users.id
WHERE comments.body ~ 'matrix';

SELECT 
users.first_name,
users.last_name,
comments.body AS comment_body
FROM users INNER JOIN comments ON comments.user_id = users.id
INNER JOIN posts ON comments.post_id = posts.id
WHERE comments.body ~ 'SSL' AND posts.content ~ 'dolorum';

SELECT
users.first_name AS post_author_first_name,
users.last_name AS post_author_last_name,
posts.title AS post_title,
users.username AS comment_author_username,
comments.body AS comment_body
FROM comments INNER JOIN posts ON post_id = posts.id
INNER JOIN users ON posts.user_id = users.id
WHERE comments.body ~ 'SSL' OR comments.body ~ 'firewall' AND posts.content ~ 'nemo';