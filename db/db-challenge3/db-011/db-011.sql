BEGIN;
UPDATE tasks
    SET is_completed = true, update_user_id = 1
WHERE create_datetime BETWEEN '2020/4/26 09:00' AND '2020/4/26 11:30'
AND is_deleted = false;
COMMIT;
