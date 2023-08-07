CREATE TABLE workers (
    id SERIAL PRIMARY KEY,
    birthday DATE CHECK (birthday BETWEEN '1900-01-01' AND current_date),
    name VARCHAR (64) NOT NULL CHECK (name != ''),
    salary NUMERIC DEFAULT 0
);

ALTER TABLE workers
ADD COLUMN is_male BOOLEAN,
ADD COLUMN email VARCHAR (64) UNIQUE,
ADD COLUMN department VARCHAR;

ALTER TABLE workers
DROP COLUMN department;

ALTER TABLE workers
ALTER COLUMN salary
SET DEFAULT 150;

ALTER TABLE workers
ALTER COLUMN salary
SET NOT NULL;

ALTER TABLE workers RENAME TO employees;

INSERT INTO employees 
(birthday, name, salary, is_male, email)
VALUES 
('1990-01-10', 'Nikita', 300, true, 'nikita@mail.com');

INSERT INTO employees 
(birthday, name, salary, is_male, email)
VALUES 
('1995-01-10', 'Svetlana', 1200, false, 'svetlana@mail.com');

INSERT INTO employees 
(birthday, name, salary, is_male, email)
VALUES 
('1980-01-10', 'Yaroslav', 1200, true, 'yaroslav@mail.com'),
('1993-08-20', 'Petro', 1000, true, 'petro@mail.com');

INSERT INTO employees 
(birthday, name, salary, is_male, email)
VALUES 
('1973-05-14', 'Andrey', 800, true, 'andrey@mail.com'),
('2000-05-18', 'Yehor', 1800, true, 'yehor@mail.com'),
('2002-10-05', 'Olga', 950, false, 'olga@mail.com'),
('2001-11-25', 'Nastya', 950, false, 'nastya@mail.com'),
('1995-12-12', 'Kate', 500, false, 'kate@mail.com'),
('1997-12-14', 'Lysi', 400, false, 'lysi@mail.com');

SELECT * FROM employees
WHERE id = 3;

SELECT * FROM employees
WHERE salary > 400;

SELECT * FROM employees
WHERE salary != 500;

SELECT * FROM employees
WHERE name = 'Petro';

SELECT * FROM employees
WHERE name != 'Petro';

UPDATE employees SET salary = 425 WHERE name = 'Nikita';

UPDATE employees SET birthday = '1975-01-01' WHERE id = 4;

UPDATE employees SET salary = 600 WHERE id BETWEEN 2 AND 5 AND is_male = false;

UPDATE employees SET name = 'Vasya', email = 'vasya@mail.com' WHERE name = 'Andrey';

DELETE FROM employees WHERE id = 2;

DELETE FROM employees WHERE name = 'Lysi';

DELETE FROM employees WHERE salary BETWEEN 0 AND 200;