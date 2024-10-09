CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;

CREATE TRIGGER before_task_update
BEFORE UPDATE ON "Tasks"
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();
