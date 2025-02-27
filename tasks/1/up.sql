-- Реализовать хранимую процедуру, возвращающую текстовую строку, содержащую
-- информацию о пользователе(идентификатор, фамилия, номер, название и затраты на
-- последнюю выполненную операцию). Обработать ситуацию, когда пользователь не

CREATE FUNCTION get_user_last_operation(IN userid INT) RETURNS TEXT AS
$$
DECLARE
    result TEXT;
BEGIN
    SELECT INTO result 'user_id = ' ||
                       u.id ||
                       ', ' ||
                       'user_last_name = ' ||
                       u.last_name ||
                       ', ' ||
                       'operation_id = ' ||
                       o.id ||
                       ', ' ||
                       'operation_name = ' ||
                       o.type ||
                       ', ' ||
                       'audit_total_resource_cost = ' ||
                       a.total_resource_cost
    FROM audit a
             JOIN users u ON u.id = a.user_id
             JOIN operations o ON o.id = a.operation_id
    WHERE a.user_id = userid
    ORDER BY a.id DESC
    LIMIT 1;

    IF result IS NULL THEN
        result := '';
    END IF;

    RETURN result;
END;
$$ LANGUAGE plpgsql;
