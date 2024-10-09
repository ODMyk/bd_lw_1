CREATE OR REPLACE VIEW users_roles_view AS
SELECT 
  u.id AS user_id,
  u.name AS user_name,
  r.role_name AS role
FROM "Users" u
JOIN "Roles" r ON u.role_id = r.id;
