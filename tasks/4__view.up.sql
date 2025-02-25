CREATE VIEW audit_view AS
SELECT a.id,
       a.weekday,
       u.last_name           AS user_last_name,
       t.name                AS task_name,
       t.overhead_percentage AS task_overhead_percentage,
       a.operation_count,
       a.total_resource_cost
FROM audit a
         JOIN
     users u ON a.user_id = u.id
         JOIN
     tasks t ON a.task_id = t.id;

CREATE FUNCTION update_overhead_and_total_cost()
    RETURNS TRIGGER AS $$
BEGIN
    UPDATE audit AS a
    SET total_resource_cost = a.operation_count * o.resource_cost *
                              (1 + (NEW.overhead_percentage / 100.0))
    FROM operations o
    WHERE a.task_id = NEW.id
      AND a.operation_id = o.id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_overhead_trigger
    AFTER UPDATE OF overhead_percentage ON tasks
    FOR EACH ROW
EXECUTE FUNCTION update_overhead_and_total_cost();