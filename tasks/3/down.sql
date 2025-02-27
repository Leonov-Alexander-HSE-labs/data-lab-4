DELETE
FROM audit
WHERE id >= 11
  AND id < 21;

DROP TRIGGER audit_before_insert ON audit;
DROP FUNCTION calculate_total_resource_cost;
