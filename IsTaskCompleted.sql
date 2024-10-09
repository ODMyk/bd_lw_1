CREATE OR REPLACE FUNCTION is_task_completed(_task_id INT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
DECLARE
  task_status INT;
BEGIN
  SELECT status_id INTO task_status FROM "Tasks" WHERE id = _task_id;
  
  RETURN (task_status = (SELECT id FROM "TaskStatuses" WHERE status_name = 'Completed'));
END;
$$;
