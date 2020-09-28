SELECT DISTINCT count(posts.id) AS '投稿数', chatrooms.name AS 'チャットルーム名'
FROM chatrooms
JOIN posts
ON chatrooms.id=posts.room_id
WHERE posts.is_deleted=false 
AND chatrooms.is_deleted=false
GROUP BY chatrooms.id 
ORDER BY count(posts.id) DESC
