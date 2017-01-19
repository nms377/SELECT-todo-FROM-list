 /* 1 Write a query to delete a user named michael if it exists */
DROP USER "michael";

/* 2 Write a query to create a user named michael with an encrypted password stonebreaker */
CREATE USER "michael" WITH ENCRYPTED PASSWORD 'stonebreaker';

/* 3 Write a query to drop a database named todo_app if it exists */
DROP DATABASE IF EXISTS "todo_app";

/* 4 Write a query to create a database named todo_app */
CREATE DATABASE "todo_app";

/* 5 Connect to the newly created database */
-- \c todo_app michael;

/* 6 Write a query to create a table named tasks using the Initial columns detailed below */
CREATE TABLE "tasks" (id integer, title varchar(255), description text, create_at timestamp, updated_at timestamp, completed boolean);

/* 7 Define column id as the table's primary key */
ALTER TABLE "tasks"
ADD PRIMARY KEY (id);

/* 8 Write queries to accomplish the following */
	
	/* remove the column named completed*/
	ALTER TABLE "tasks"
	DROP COLUMN "completed";

	/* add a column to tasks named completed_at:timestamp, that may be NULL, and has a default value of NULL */	
	ALTER TABLE "tasks"
	ADD COLUMN "completed_at" timestamp DEFAULT NULL;

	/*change the updated_at column to not allow NULL values, and have a default value of now()*/
	ALTER TABLE "tasks"
	ALTER COLUMN "updated_at" SET NOT NULL;

	ALTER TABLE "tasks"
	ALTER COLUMN "updated_at" SET DEFAULT now();


