CREATE OR REPLACE VIEW project_tasks_view AS
SELECT 
  t.id AS task_id,
  t.title AS task_title,
  p.name AS project_name,
  s.status_name AS task_status,
  t.updated_at
FROM "Tasks" t
JOIN "Projects" p ON t.project_id = p.id
JOIN "TaskStatuses" s ON t.status_id = s.id
WHERE t.deleted_at IS NULL;
