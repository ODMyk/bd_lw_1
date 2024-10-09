CREATE OR REPLACE VIEW tasks_by_tag_view AS
SELECT 
  t.id AS task_id,
  t.title AS task_title,
  tag.tag_name AS tag_name,
  p.name AS project_name,
  s.status_name AS status,
  t.updated_at
FROM "Tasks" t
JOIN "TaskTags" tt ON t.id = tt.task_id
JOIN "Tags" tag ON tt.tag_id = tag.id
JOIN "Projects" p ON t.project_id = p.id
JOIN "TaskStatuses" s ON t.status_id = s.id
WHERE t.deleted_at IS NULL;
