BEGIN;
UPDATE users
    SET is_deleted = true
WHERE (work_phone_number IS NULL AND mobile_phone_number IS NULL)
    OR 
    (work_phone_number = '' AND mobile_phone_number = '')
    OR 
    (work_phone_number = '' AND mobile_phone_number IS NULL)
    OR 
    (work_phone_number IS NULL AND mobile_phone_number = '');
COMMIT;
