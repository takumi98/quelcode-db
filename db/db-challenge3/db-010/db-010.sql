SELECT users.name AS 'ユーザー名', table1.tmp AS '投稿日時', chatrooms.name AS 'チャットルーム名'
FROM(
    SELECT create_user_id,room_id,tmp
    FROM(
        SELECT
        MAX(create_datetime) AS tmp,room_id tmp2
        FROM posts
        WHERE is_deleted=false
        GROUP BY room_id
        order by room_id DESC
    ) AS p2
    JOIN posts
    ON p2.tmp=posts.create_datetime AND p2.tmp2=posts.room_id
) AS table1
JOIN users
ON table1.create_user_id=users.id
JOIN chatrooms
ON table1.room_id=chatrooms.id
WHERE users.is_deleted=false AND chatrooms.is_deleted=false
ORDER BY chatrooms.id ASC
