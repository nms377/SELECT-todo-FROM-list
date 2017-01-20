\c nicolesandry;

 /* 1 Write a query to delete a user named michael if it exists */
DROP USER "michael";

/* 2 Write a query to create a user named michael with an encrypted password stonebreaker */
CREATE USER "michael" WITH ENCRYPTED PASSWORD 'stonebreaker';

/* 3 Write a query to drop a database named todo_app if it exists */
DROP DATABASE IF EXISTS "todo_app";

/* 4 Write a query to create a database named todo_app */
CREATE DATABASE "todo_app";

/* 5 Connect to the newly created database */
\c todo_app;

/* 6 Write a query to create a table named tasks using the Initial columns detailed in the README.md */
CREATE TABLE "tasks" (
	id serial NOT NULL, 
	title varchar(255), 
	description text, 
	created_at timestamp WITHOUT TIME ZONE NOT NULL DEFAULT now(), 
	updated_at timestamp, 
	completed boolean);

/* 7 Define column id as the table's primary key */
ALTER TABLE "tasks"
ADD PRIMARY KEY (id);

/* 8 Write queries to accomplish the following */
	
	/*	i. remove the column named completed*/
	ALTER TABLE "tasks"
	DROP COLUMN "completed";

	/* 	ii. add a column to tasks named completed_at:timestamp, that may be NULL, and has a default value of NULL */	
	ALTER TABLE "tasks"
	ADD COLUMN "completed_at" timestamp DEFAULT NULL;

	/*	iii. change the updated_at column to not allow NULL values, and have a default value of now()*/
	ALTER TABLE "tasks"
	ALTER COLUMN "updated_at" SET NOT NULL;

	ALTER TABLE "tasks"
	ALTER COLUMN "updated_at" SET DEFAULT now();

	/*	iv. create a new task, by only setting values (not defining which columns) id = default value
	title = 'Study SQL'
	description = 'Complete this exercise'
	created_at = now()
	updated_at = now()
	completed_at = NULL*/

	INSERT INTO "tasks" (title, description, created_at, updated_at, completed_at) VALUES (
		'Study SQL', 
		'Complete this exercise', 
		now(), 
		now(), 
		NULL);

	/*	v. create a new task
	title = 'Study PostgreSQL',
	description = 'Read all the documentation'*/

	INSERT INTO "tasks" (title, description) VALUES (
		'Study PostgreSQL', 
		'Read all the documentation');

	/*	vi. select all the titles of tasks that are not yet completed*/

	SELECT title FROM "tasks"
	WHERE completed_at IS NULL;


	/*	vii. update the task with a title of 'Study SQL' to be completed as of now*/

	UPDATE "tasks"
	SET completed_at = now()
	WHERE title = 'Study SQL';

	/*	viii. select all titles and descriptions of tasks that are not yet completed*/

	SELECT title,description FROM "tasks"
	WHERE completed_at IS NULL;

	/*	ix. select all fields of every task sorted by creation date in descending order
	*/

	SELECT *
	FROM "tasks"
	ORDER BY created_at DESC;









SELECT * FROM "tasks";