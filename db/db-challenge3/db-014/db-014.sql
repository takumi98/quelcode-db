BEGIN;
DELETE 
FROM users_chatrooms
WHERE  EXISTS (
    SELECT id
    FROM users
    WHERE users.id = users_chatrooms.user_id
    AND users.is_deleted = true
);
COMMIT;
