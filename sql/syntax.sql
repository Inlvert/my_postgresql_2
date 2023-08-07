CREATE TABLE users(
  email VARCHAR(128),
  first_name VARCHAR(64),
  last_name VARCHAR(64),
  birthday DATE,
  is_male BOOLEAN,
  current_balance NUMERIC(10,2)
);


DROP TABLE users;