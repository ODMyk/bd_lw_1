CREATE OR REPLACE FUNCTION count_tasks_in_project(_project_id INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
  task_count INT;
BEGIN
  SELECT COUNT(*) INTO task_count FROM "Tasks" WHERE project_id = _project_id AND deleted_at IS NULL;
  RETURN task_count;
END;
$$;
