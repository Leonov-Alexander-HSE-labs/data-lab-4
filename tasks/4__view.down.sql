DROP VIEW audit_view;
DROP TRIGGER update_overhead_trigger ON tasks;
DROP FUNCTION update_overhead_and_total_cost();

DELETE FROM user_tasks
WHERE user_id BETWEEN 101 AND 200
  AND task_id BETWEEN 101 AND 200;

DELETE FROM audit
WHERE id BETWEEN 101 AND 200;

DELETE FROM operations
WHERE id BETWEEN 101 AND 200;

DELETE FROM users
WHERE id BETWEEN 101 AND 200;

DELETE FROM tasks
WHERE id BETWEEN 101 AND 200;
