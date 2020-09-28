SELECT DISTINCT count(posts.id) AS '投稿数', chatrooms.name AS 'チャットルーム名'
FROM chatrooms
JOIN posts
ON chatrooms.id=posts.room_id
JOIN users
ON posts.create_user_id=users.id
WHERE users.is_deleted=false 
AND posts.is_deleted=false
GROUP BY chatrooms.id 
ORDER BY count(posts.id) DESC
