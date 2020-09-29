BEGIN;
UPDATE chatrooms
    SET is_file_sendable = false, update_user_id = true
WHERE id NOT IN(
    SELECT room_id 
    FROM users_chatrooms 
    WHERE user_id=1
)
AND is_deleted=false
AND is_file_sendable=1;
COMMIT;
