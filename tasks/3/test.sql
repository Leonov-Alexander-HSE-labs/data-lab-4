--total_resource_cost will be 1348200
INSERT INTO audit(id, weekday, user_id, operation_id, task_id, operation_count)
VALUES (11, 'Вс', 1, 1, 2, 90);

--total_resource_cost will be 1
INSERT INTO audit(id, weekday, user_id, operation_id, task_id, operation_count, total_resource_cost)
VALUES (12, 'Вс', 1, 1, 2, 50, 1);

--total_resource_cost will be 0
INSERT INTO audit(id, weekday, user_id, operation_id, task_id, operation_count, total_resource_cost)
VALUES (13, 'Вс', 1, 1, 2, 50, 1);

---user 999 does not exist => fk exception
INSERT INTO audit(id, weekday, user_id, operation_id, task_id, operation_count)
VALUES (14, 'вс', 999, 1, 2, 10);

---operation 999 does not exist => fk exception
INSERT INTO audit(id, weekday, user_id, operation_id, task_id, operation_count)
VALUES (15, 'вс', 1, 999, 2, 10);

---task 999 does not exist => fk exception
INSERT INTO audit(id, weekday, user_id, operation_id, task_id, operation_count)
VALUES (17, 'вс', 1, 1, 999, 10);