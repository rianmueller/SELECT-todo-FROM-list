DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks
(
    id SERIAL NOT NULL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    completed boolean NOT NULL DEFAULT 'FALSE'
);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at TIMESTAMP DEFAULT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at
SET
NOT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at
SET
DEFAULT CURRENT_TIMESTAMP;

INSERT INTO tasks
VALUES
    (DEFAULT, 'Study SQL', 'Complete this exercise', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO tasks
    (title, description)
VALUES
    ('Study PostgreSQL', 'Read all the documentation');

SELECT title
FROM tasks
WHERE completed_at = NULL;

UPDATE tasks
SET completed_at = CURRENT_TIMESTAMP
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at = NULL;

SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks
    (title, description)
VALUES
    ('mistake 1', 'a test entry');

INSERT INTO tasks
    (title, description)
VALUES
    ('mistake 2', 'another test entry');

INSERT INTO tasks
    (title, description)
VALUES
    ('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title = 'mistake 1';

SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;