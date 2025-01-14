CREATE TABLE "Users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" VARCHAR(100),
  "email" VARCHAR(100) UNIQUE,
  "password" VARCHAR(100),
  "role_id" INT,
  "team_id" INT,
  "deleted_at" TIMESTAMP,
  "updated_at" TIMESTAMP,
  "updated_by" INT
);

CREATE TABLE "Projects" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" VARCHAR(100),
  "description" TEXT,
  "team_id" INT,
  "category_id" INT,
  "deleted_at" TIMESTAMP,
  "updated_at" TIMESTAMP,
  "updated_by" INT
);

CREATE TABLE "Tasks" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" VARCHAR(100),
  "description" TEXT,
  "project_id" INT,
  "status_id" INT,
  "deleted_at" TIMESTAMP,
  "updated_at" TIMESTAMP,
  "updated_by" INT
);

CREATE TABLE "Comments" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "content" TEXT,
  "task_id" INT,
  "user_id" INT,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP,
  "updated_by" INT
);

CREATE TABLE "Files" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "file_path" VARCHAR(255),
  "task_id" INT,
  "user_id" INT,
  "uploaded_at" TIMESTAMP
);

CREATE TABLE "Teams" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" VARCHAR(100),
  "deleted_at" TIMESTAMP
);

CREATE TABLE "Roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "role_name" VARCHAR(100)
);

CREATE TABLE "Tags" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "tag_name" VARCHAR(100)
);

CREATE TABLE "TaskTags" (
  "task_id" INT,
  "tag_id" INT,
  PRIMARY KEY(task_id,tag_id)
);

CREATE TABLE "Notifications" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_id" INT,
  "content" VARCHAR(255),
  "is_read" BOOLEAN,
  "created_at" TIMESTAMP
);

CREATE TABLE "Events" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "event_name" VARCHAR(100),
  "project_id" INT,
  "created_at" TIMESTAMP
);

CREATE TABLE "AuditLog" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_id" INT,
  "task_id" INT,
  "action" VARCHAR(100),
  "timestamp" TIMESTAMP
);

CREATE TABLE "Milestones" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" VARCHAR(100),
  "project_id" INT,
  "due_date" DATE,
  "deleted_at" TIMESTAMP
);

CREATE TABLE "TaskStatuses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "status_name" VARCHAR(50)
);

CREATE TABLE "ProjectCategories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "category_name" VARCHAR(100)
);

CREATE TABLE "ActivityLogs" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_id" INT,
  "activity" VARCHAR(255),
  "timestamp" TIMESTAMP
);

ALTER TABLE "Users" ADD FOREIGN KEY ("role_id") REFERENCES "Roles" ("id");

ALTER TABLE "Users" ADD FOREIGN KEY ("team_id") REFERENCES "Teams" ("id");

ALTER TABLE "Projects" ADD FOREIGN KEY ("team_id") REFERENCES "Teams" ("id");

ALTER TABLE "Projects" ADD FOREIGN KEY ("category_id") REFERENCES "ProjectCategories" ("id");

ALTER TABLE "Tasks" ADD FOREIGN KEY ("project_id") REFERENCES "Projects" ("id");

ALTER TABLE "Tasks" ADD FOREIGN KEY ("status_id") REFERENCES "TaskStatuses" ("id");

ALTER TABLE "Comments" ADD FOREIGN KEY ("task_id") REFERENCES "Tasks" ("id");

ALTER TABLE "Comments" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Files" ADD FOREIGN KEY ("task_id") REFERENCES "Tasks" ("id");

ALTER TABLE "Files" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "TaskTags" ADD FOREIGN KEY ("task_id") REFERENCES "Tasks" ("id");

ALTER TABLE "TaskTags" ADD FOREIGN KEY ("tag_id") REFERENCES "Tags" ("id");

ALTER TABLE "Notifications" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Events" ADD FOREIGN KEY ("project_id") REFERENCES "Projects" ("id");

ALTER TABLE "AuditLog" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "AuditLog" ADD FOREIGN KEY ("task_id") REFERENCES "Tasks" ("id");

ALTER TABLE "Milestones" ADD FOREIGN KEY ("project_id") REFERENCES "Projects" ("id");

ALTER TABLE "ActivityLogs" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");
