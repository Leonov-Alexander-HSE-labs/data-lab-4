INSERT INTO users (id, last_name, client_computer, quota, operation_fee)
VALUES (101, 'Smith', 'PC1', 100, 20);

INSERT INTO tasks (id, name, computer_server, overhead_percentage)
VALUES (101, 'Task1', 'Server1', 10);

INSERT INTO user_tasks (user_id, task_id)
VALUES (101, 101);

INSERT INTO operations (id, type, resource_cost)
VALUES (101, 'Type1', 5);

---task.overhead_percentage == 10 => audit.total_resource_cost == 55
---it calculated by audit.audit_before_insert trigger
INSERT INTO audit (id, weekday, user_id, operation_id, task_id, operation_count)
VALUES (101, 'Monday', 101, 101, 101, 10);

SELECT total_resource_cost = 55 FROM audit_view WHERE task_name = 'Task1'; ---true

UPDATE tasks SET overhead_percentage = 0 WHERE id = 101;
SELECT total_resource_cost = 50 FROM audit_view WHERE task_name = 'Task1'; ---true

---task.overhead_percentage == 10 => audit.total_resource_cost == 55
---it calculated by task.update_overhead_trigger
UPDATE tasks SET overhead_percentage = 10 WHERE id = 101;
SELECT total_resource_cost = 55 FROM audit_view WHERE task_name = 'Task1'; ---true


