CREATE OR REPLACE PROCEDURE create_task(
  _title VARCHAR(100),
  _description TEXT,
  _project_id INT,
  _status_id INT,
  _updated_by INT
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO "Tasks" (title, description, project_id, status_id, updated_at, updated_by)
  VALUES (_title, _description, _project_id, _status_id, NOW(), _updated_by);
END;
$$;