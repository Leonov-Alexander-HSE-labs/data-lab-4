CREATE TABLE user_tasks
(
    user_id INT REFERENCES users (id),
    task_id INT REFERENCES tasks (id),
    PRIMARY KEY (user_id, task_id)
);

INSERT INTO user_tasks (user_id, task_id)
SELECT DISTINCT a.user_id, a.task_id
FROM audit AS a
         JOIN users AS u ON a.user_id = u.id
         JOIN tasks AS t ON a.task_id = t.id;


CREATE FUNCTION check_user_task_access()
    RETURNS TRIGGER AS
$$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM user_tasks ut
        WHERE ut.user_id = NEW.user_id AND ut.task_id = NEW.task_id
    ) THEN
        RAISE EXCEPTION 'User does not have access to this task';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER user_task_access_insert_check
    AFTER INSERT ON audit
    FOR EACH ROW EXECUTE FUNCTION check_user_task_access();

CREATE TRIGGER user_task_access_update_check
    AFTER UPDATE ON audit
    FOR EACH ROW EXECUTE FUNCTION check_user_task_access();



