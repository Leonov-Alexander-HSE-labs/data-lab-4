---user 1 can perform task 2 => success
INSERT INTO audit(id, weekday, user_id, operation_id, task_id, operation_count, total_resource_cost)
VALUES (1, 'вс', 1, 1, 2, 10, 800);

---user 1 can not perform task 1 => custom exception
INSERT INTO audit(id, weekday, user_id, operation_id, task_id, operation_count, total_resource_cost)
VALUES (2, 'вс', 1, 1, 1, 10, 800);

---user 7 with no tasks
---they are not in provided data, they were added by me
---they can not perform any task => custom exception
INSERT INTO audit(id, weekday, user_id, operation_id, task_id, operation_count, total_resource_cost)
VALUES (3, 'вс', 7, 1, 1, 10, 800);

---user 1 can not perform task 1 => custom exception
UPDATE audit
SET task_id = 1
WHERE id = 1;

---user 999 does not exist => fk exception
INSERT INTO audit(id, weekday, user_id, operation_id, task_id, operation_count, total_resource_cost)
VALUES (4, 'вс', 999, 1, 2, 10, 800);

---operation 999 does not exist => fk exception
INSERT INTO audit(id, weekday, user_id, operation_id, task_id, operation_count, total_resource_cost)
VALUES (6, 'вс', 1, 999, 2, 10, 800);

---task 999 does not exist => fk exception
INSERT INTO audit(id, weekday, user_id, operation_id, task_id, operation_count, total_resource_cost)
VALUES (5, 'вс', 1, 1, 999, 10, 800);

