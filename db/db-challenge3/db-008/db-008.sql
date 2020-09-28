SELECT users.name AS 'ユーザー名',chatrooms.name AS 'チャットルーム名',
DATE_FORMAT(users_chatrooms.create_datetime,'%Y-%m-%d') AS '参加日時'
FROM users_chatrooms
JOIN users
ON users_chatrooms.user_id=users.id
JOIN chatrooms
ON users_chatrooms.room_id=chatrooms.id
WHERE users.is_deleted=false AND chatrooms.is_deleted=false
ORDER BY users_chatrooms.create_datetime;
