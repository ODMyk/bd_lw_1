CREATE OR REPLACE FUNCTION completed_tasks_in_team(_team_id INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
  task_count INT;
BEGIN
  SELECT COUNT(*) INTO task_count 
  FROM "Tasks" t
  JOIN "Projects" p ON t.project_id = p.id
  WHERE p.team_id = _team_id AND t.status_id = (SELECT id FROM "TaskStatuses" WHERE status_name = 'Completed') AND t.deleted_at IS NULL;
  
  RETURN task_count;
END;
$$;
