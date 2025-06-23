-- Add user
INSERT INTO users (username, firstName, lastName, age) values ('jdoe', 'John', 'Doe', 35);

-- Add two users
INSERT INTO users (username, firstName, lastName, age) values ('jdoe', 'John', 'Doe', 30), ('asmith', 'Alice', 'Smith', 44);

-- Add multiple users
INSERT INTO users (username, firstName, lastName, age)
VALUES
 ('asmith', 'Alice', 'Smith', 20),
 ('bdoe', 'Bob', 'Doe', 33),
 ('cjohnson', 'Charlie', 'Johnson', 41),
 ('dlee', 'David', 'Lee', 19),
 ('ejones', 'Eve', 'Jones', 30),
 ('fkim', 'Frank', 'Kim', 15),
 ('gwhite', 'Grace', 'White', 22),
 ('hwang', 'Henry', 'Wang', 19),
 ('ijones', 'Ivy', 'Jones', 50),
 ('jdoe', 'John', 'Doe', 65),
 ('klee', 'Kevin', 'Lee', 62),
 ('lchen', 'Linda', 'Chen', 24),
 ('mlee', 'Michael', 'Lee', 29),
 ('nkim', 'Nancy', 'Kim', 18),
 ('ojohnson', 'Oscar', 'Johnson', 40),
 ('pchen', 'Peter', 'Chen', 55),
 ('qwang', 'Quincy', 'Wang', 28),
 ('rjones', 'Rachel', 'Jones', 37),
 ('slee', 'Sam', 'Lee', 21),
 ('tkim', 'Tina', 'Kim', 26);
 
 -- Check data in table
SELECT* FROM users;
 
 -- Update user (is actually multiple users)
UPDATE users SET firstName = 'Jane'
	, lastName = 'Doe' 
WHERE username = 'jdoe';

-- Update all users with last name 'Doe'. (Only one should update)
UPDATE users SET firstName = 'Jane' 
WHERE lastName = 'Doe';

-- Delete records with username jdoe
DELETE FROM users
WHERE username = 'jdoe';

-- View users with lastName 'Doe'
SELECT firstName
	, lastName
FROM users
WHERE lastName = 'Doe';

-- View all colums from users table
SELECT * FROM users;

-- View users with lastName 'Doe' and firstName 'John' (This should return nothing because we previously replaced all 'Doe's with firstName 'Jane')
SELECT * FROM users
WHERE lastName = 'Doe' AND firstName = 'John';

-- View users with lastName 'Doe' or firstName 'John' 
SELECT * FROM users
WHERE lastName = 'Doe' OR firstName = 'John';

-- View users with lastName 'Doe' and firstName 'John' or 'Jane'
SELECT * FROM users
WHERE lastName = 'Doe' AND (firstName = 'John' OR firstName = 'Jane');

-- View column names with aliases
SELECT firstName as First
	, lastName as Last
FROM users;

-- View username and age in 10 years
SELECT username
	, age + 10 AS ageIn10Years
FROM users;

-- View fullName using concat
SELECT CONCAT(firstName, '', lastName) AS fullName
FROM users;

-- Sort by age descending
SELECT *
FROM users
ORDER BY age DESC;

-- Sort but lastName and firstName ascending
SELECT *
FROM users
ORDER BY  lastName, firstName;

-- View first 5 users
SELECT *
FROM users
LIMIT 5;

-- View the next 5 users
SELECT *
FROM users
LIMIT 5 OFFSET 5;

-- "Page" using LIMIT, OFFSET, and ORDER BY. Assume 10 per page and on 3rd page order by lastName (This should return nothing because we only have 20 records)
SELECT * 
FROM users
ORDER BY lastName
LIMIT 10
OFFSET 20;







