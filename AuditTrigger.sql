CREATE OR REPLACE FUNCTION log_task_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO "AuditLog" (user_id, task_id, action, timestamp)
  VALUES (NEW.updated_by, NEW.id, 'Task Updated', NOW());
  RETURN NEW;
END;
$$;

CREATE TRIGGER after_task_update
AFTER UPDATE ON "Tasks"
FOR EACH ROW
EXECUTE FUNCTION log_task_update();
