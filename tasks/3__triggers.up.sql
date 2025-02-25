-- Реализовать триггер такой, что при вводе строки в таблице аудит, если общие затраты не
-- указаны, то они вычисляются

ALTER TABLE audit
    ALTER COLUMN total_resource_cost DROP NOT NULL;

CREATE FUNCTION calculate_total_resource_cost()
    RETURNS TRIGGER AS
$$
DECLARE
    resource_cost       INT;
    overhead_percentage INT;
    operation_fee       INT;
BEGIN
    IF NEW.total_resource_cost IS NULL THEN
        SELECT o.resource_cost INTO resource_cost FROM operations o WHERE o.id = NEW.operation_id;
        SELECT t.overhead_percentage INTO overhead_percentage FROM tasks t WHERE t.id = NEW.task_id;
        SELECT u.operation_fee INTO operation_fee FROM users u WHERE u.id = NEW.user_id;

        NEW.total_resource_cost := NEW.operation_count * resource_cost *
                                   (1 + (overhead_percentage / 100.0));
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER audit_before_insert
    BEFORE INSERT
    ON audit
    FOR EACH ROW
EXECUTE FUNCTION calculate_total_resource_cost();

