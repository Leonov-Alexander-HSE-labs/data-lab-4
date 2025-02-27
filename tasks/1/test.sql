SELECT get_user_last_operation(1) =
       'user_id = 1, user_last_name = Сапунова, operation_id = 6, ' ||
       'operation_name = Чтение произвольного файла, ' ||
       'audit_total_resource_cost = 7500' AS user_with_operation,
       get_user_last_operation(6) = ''    AS user_with_no_operation,
       get_user_last_operation(7) = ''    AS not_existing_user;