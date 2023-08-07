-- Создать таблицу users,
--   в таблице должны быть следующие поля:
--     - id
--     - first_name
--     - last_name
--     - email
--     - birthday
--     - is_male
--     - height
--     - weight
--   Проверки:
--     - обязательно что-то должно быть в столбцах id, first_name, last_name, email
--     - вес пользователя не может быть больше 800 кг
--     - рост не может быть меньше 0.3 м и больше 3 м
--     - дата рождения должна иметь смысл
--     - емейл должен быть уникальным
--     -* комбинация имени и фамилии должна быть уникальной
--     - имя и фамилия не могут быть пустой строкой
--   Значения по умолчанию:
--     - id
--     - is_male (true)
--     - height (1.65)


CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL CHECK (first_name != ''),
  last_name VARCHAR(64) NOT NULL CHECK (last_name != ''),
  email VARCHAR(128) NOT NULL CONSTRAINT "Email must be unique" UNIQUE,
  birthday DATE CHECK (birthday >= '1900-01-01' AND birthday <= current_date),
  is_male BOOLEAN DEFAULT 'true',
  height NUMERIC(3,2) DEFAULT '1.65' CHECK (height >= 0.3) CHECK (height <= 3),
  weight NUMERIC(3) CHECK (weight <= 800),
  CONSTRAINT "first and last name must be unique" UNIQUE (first_name, last_name)
);

DROP TABLE users;