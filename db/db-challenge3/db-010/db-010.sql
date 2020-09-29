SELECT users.name AS 'ユーザー名', posts.create_datetime AS '投稿日時', chatrooms.name AS 'チャットルーム名'
FROM(
    SELECT MAX(posts.id) AS p_max, p2.tmp2 AS c_max
    FROM(
        SELECT
        MAX(create_datetime) AS tmp,room_id tmp2
        FROM posts
        WHERE is_deleted=false
        GROUP BY room_id
    ) AS p2
    JOIN posts
    ON p2.tmp=posts.create_datetime AND p2.tmp2=posts.room_id
    JOIN users
    ON posts.create_user_id=users.id
    WHERE users.is_deleted=false AND posts.is_deleted=false
    GROUP BY p2.tmp2
) AS table1
JOIN posts
ON posts.id=table1.p_max
JOIN chatrooms
ON chatrooms.id=table1.c_max
JOIN users
ON users.id=posts.create_user_id
ORDER BY table1.p_max ASC;
