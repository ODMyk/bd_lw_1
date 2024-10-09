CREATE OR REPLACE PROCEDURE soft_delete_task(_task_id INT, _updated_by INT)
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE "Tasks"
  SET deleted_at = NOW(), updated_by = _updated_by
  WHERE id = _task_id;
END;
$$;