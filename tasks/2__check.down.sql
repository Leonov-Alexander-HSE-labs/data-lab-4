DROP TABLE user_tasks;
DROP TRIGGER user_task_access_insert_check ON audit;
DROP TRIGGER user_task_access_update_check ON audit;
DROP FUNCTION check_user_task_access;
DELETE FROM audit WHERE id < 11