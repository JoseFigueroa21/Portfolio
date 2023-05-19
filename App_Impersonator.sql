CREATE TABLE app_data (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    email TEXT
);

INSERT INTO app_data (name, age, email) VALUES
    ('Jose Figueroa', 23, 'jose@example.com'),
    ('Alexis Maciel', 22, 'alexis@example.com'),
    ('Moises Rios', 19, 'moises@example.com');

SELECT * FROM app_data;

UPDATE app_data
SET age = 24
WHERE id = 1;

SELECT * FROM app_data;

DELETE FROM app_data
WHERE id = 2;

SELECT * FROM app_data;