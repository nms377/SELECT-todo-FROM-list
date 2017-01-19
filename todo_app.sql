 /* 1 */
DROP USER "michael";

/* 2 */
CREATE USER "michael" WITH ENCRYPTED PASSWORD 'stonebreaker';

/* 3 */
DROP DATABASE IF EXISTS "todo_app";

/* 4 */
CREATE DATABASE "todo_app";

/* 5 */
\c todo_app michael;

/* 6 */
CREATE TABLE "tasks" (id integer, title varchar(255), description text, create_at timestamp, updated_at timestamp, completed boolean);

/* 7 */
ALTER TABLE "tasks"
ADD PRIMARY KEY (id);
