SELECT name,overview,
CASE is_file_sendable WHEN 0 THEN '禁止' WHEN 1 THEN '許可' END AS is_file_sendable,
is_direct_chat,is_deleted,create_user_id,create_datetime,update_user_id,update_datetime
FROM chatrooms
WHERE is_deleted=0 
AND RIGHT(overview,9) LIKE '%ダイレクトチャット%'
ORDER BY id;
