/*
	CREACION DE BASE DE DATOS PARA LA GESTION ACADEMICA DE UNIVERSIDAD
		MODULO 4 SEMANA 2 (M4S2)
		BY: Diego Vallejo Z.
		Clan Hopper | Riwi
*/


-- To show all databases.
SHOW DATABASES;

-- To create a new database named: gestion_academica_universidad.
CREATE DATABASE gestion_academica_universidad;

-- To use the new database.
USE gestion_academica_universidad;

-- CREATION OF TABLES:

-- Creation of table career.
CREATE TABLE careers(
	id_career 	INT AUTO_INCREMENT PRIMARY KEY,
    career 		VARCHAR(30) NOT NULL UNIQUE,
    status		BOOLEAN NOT NULL,
	created_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Creation of table document_types.
CREATE TABLE document_types(
	id_document_type	INT AUTO_INCREMENT PRIMARY KEY,
    document_type		VARCHAR(20) NOT NULL UNIQUE,
    acronym_doc_type	VARCHAR(5) NOT NULL UNIQUE,
    status 				BOOLEAN NOT NULL,
    created_at			TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at			TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Creation of table gender.
CREATE TABLE genders(
	id_gender	INT AUTO_INCREMENT PRIMARY KEY,
    gender		VARCHAR(20) NOT NULL,
    created_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Creation of table students.
CREATE TABLE students(
	id_student		INT AUTO_INCREMENT PRIMARY KEY,
    name			VARCHAR(20) NOT NULL,
    lastname_1		VARCHAR(20) NOT NULL,
    lastname_2		VARCHAR(20),
    email			VARCHAR(50) NOT NULL UNIQUE,
    id_gender		INT NOT NULL,
    id_document_type INT NOT NULL,
    number_doc_type	INT NOT NULL UNIQUE CHECK(number_doc_type >= 0),
    id_career		INT NOT NULL,
    birth_date		DATE NOT NULL,
    start_date		DATE NOT NULL,
    status			BOOLEAN NOT NULL,
    created_at		TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at		TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Creation of table academic_departments.
CREATE TABLE academic_depts(
	id_academic_dept	INT AUTO_INCREMENT PRIMARY KEY,
    academic_dept		VARCHAR(30) NOT NULL UNIQUE,
    status 				BOOLEAN NOT NULL,
	created_at			TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at			TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Creation of table teachers.
CREATE TABLE teachers(
	id_teacher		INT AUTO_INCREMENT PRIMARY KEY,
    name			VARCHAR(25) NOT NULL,
    lastname_1		VARCHAR(25) NOT NULL,
    lastname_2		VARCHAR(25),
    email			VARCHAR(50) NOT NULL UNIQUE,
    id_academic_dept INT NOT NULL,
    experience_years INT NOT NULL CHECK(experience_years >= 0),
    status			BOOLEAN NOT NULL,
	created_at		TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at		TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Creation of table courses.
CREATE TABLE courses(
	id_course	INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(30) NOT NULL UNIQUE,
    course_code	INT NOT NULL,
    number_credits INT NOT NULL CHECK(number_credits >= 1),
    semester	INT NOT NULL CHECK(semester >= 1),
    id_teacher	INT NOT NULL,
    status		BOOLEAN NOT NULL,
	created_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Creation of table inscriptions.
CREATE TABLE inscriptions(
	id_inscription 		INT AUTO_INCREMENT PRIMARY KEY,
    id_student			INT NOT NULL,
    id_course			INT NOT NULL,
    iscription_date		DATE NOT NULL,
    final_grade			DECIMAL(3,2) NOT NULL CHECK (final_grade >= 0.00 AND final_grade <= 5.00),
	created_at			TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at			TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- ----------------------------------------------------------------------------------------------

-- Doing relations between tables.

-- Relation between students and genders.
ALTER TABLE students
ADD CONSTRAINT fk_students_genders
FOREIGN KEY (id_gender) REFERENCES genders(id_gender);


-- Relation between students and document_types.
ALTER TABLE students
ADD CONSTRAINT fk_students_document_types
FOREIGN KEY (id_document_type) REFERENCES document_types(id_document_type);


-- Relation between students and careers.
ALTER TABLE students
ADD CONSTRAINT fk_students_careers
FOREIGN KEY (id_career) REFERENCES careers(id_career);

-- Relation between inscriptions and students.
ALTER TABLE inscriptions
ADD CONSTRAINT fk_inscriptions_students
FOREIGN KEY (id_student) REFERENCES students(id_student);

-- Relation between teachers and academic_depts.
ALTER TABLE teachers
ADD CONSTRAINT fk_teachers_academic_depts
FOREIGN KEY (id_academic_dept) REFERENCES academic_depts(id_academic_dept);


-- Relation between courses and teachers.
ALTER TABLE courses
ADD CONSTRAINT fk_courses_teachers
FOREIGN KEY (id_teacher) REFERENCES teachers(id_teacher);


-- Relation between inscriptions and courses.
ALTER TABLE inscriptions
ADD CONSTRAINT fk_inscriptions_courses
FOREIGN KEY (id_course) REFERENCES courses(id_course);


-- ----------------------------------------------------------------------------------------------
-- Input registers on tables.
-- Input registers on careers.
INSERT INTO careers(career, status)
VALUES
('Software Engineering', true),
('Civil Engineering', true),
('Mathematical Engineering', true),
('Bachelor in Music', true),
('Sociology', true);


-- Input registers on document_types:
INSERT INTO document_types(document_type, acronym_doc_type, status)
VALUES
('Cédula de ciudadanía', 'CC', true),
('Tarjeta de Identidad', 'TI', true),
('Pasaporte', 'PP', true);

-- Input registers on genders:
INSERT INTO genders(gender)
VALUES
('Masculino'),
('Femenino');


-- Input registers on students:
INSERT INTO students(name, lastname_1, lastname_2, email, id_gender, id_document_type, number_doc_type, id_career, birth_date, start_date, status)
VALUES
('Diego','Vallejo','Zapata', 'diego@gmail.com', 1, 1, 1085310999, 1, '1994-03-04', '2025-03-26', 1),
('Sara','Gonzales','Escobar', 'sara@gmail.com', 2, 1, 108232219, 2, '1999-05-11', '2025-04-12', 1),
('Valentina','Zamora','Vasquez', 'valen@gmail.com', 2, 2, 232310999, 4, '2008-07-31', '2025-05-22', 1),
('Carlos','Garcia','Torres', 'esteban@gmail.com', 1, 1, 1023231212, 1, '1999-12-04', '2025-01-28', 1),
('Julian','Jimenez','Chica', 'j.jimenez@gmail.com', 1, 1, 1000310399, 3, '2000-11-14', '2023-05-29', 1),
('Maria','Stauffemberg','Lopez', 'maria.s@gmail.com', 2, 3, 18383999, 3, '1990-06-04', '2022-03-01', 1);


-- Input registers on academic_depts
INSERT INTO academic_depts (academic_dept, status)
VALUES
('Engineering', true),
('Math', true),
('Arts', true),
('Social Sciences', true);

-- Input registers on teachers
INSERT INTO teachers(name, lastname_1, lastname_2, email, id_academic_dept, experience_years, status)
VALUES
('Ramiro', 'Varona', 'Balvuena', 'ramiro@email.io', 1, 15, true),
('Andrea', 'Dominguez', 'Klauss', 'andre@email.io', 2, 3, true),
('Sebastian', 'Agudelo', 'Gutierrez', 'sebas@email.io', 1, 18, true),
('David', 'Henao', 'Henao', 'd.henao@email.io', 2, 12, true),
('Andres', 'David', 'Gamboa', 'gamboa@email.io', 3, 9, true);


-- Input registers on courses
INSERT INTO courses(course_name, course_code, number_credits, semester, id_teacher, status)
VALUES
('Software 1', 3031, 4, 1, 1, true),
('Software 2', 4011, 5, 2, 3, true),
('Math', 5221, 4, 1, 4, true),
('Critical Thinking', 1000, 3, 1, 1, true),
('Design', 4343, 2, 2, 2, true);

-- Input registers on inscriptions
INSERT INTO inscriptions (id_student, id_course, iscription_date, final_grade)
VALUES
(1, 1, '2025-06-11', 4.45),
(2, 1, '2025-07-01', 3.92),
(3, 2, '2025-02-27', 4.01),
(4, 2, '2025-01-31', 2.99),
(4, 3, '2025-06-28', 4.88),
(5, 4, '2025-06-01', 4.11),
(1, 4, '2025-04-27', 3.99),
(6, 2, '2025-06-04', 4.15),
(4, 1, '2025-07-01', 3.45);


-- --------------------------------------------------------------------------------------------

-- CREATING A VIEW:

-- Generating list of students with their inscriptions and courses (JOIN).
CREATE VIEW academic_record AS
SELECT 
	CONCAT(s.name, ' ', s.lastname_1, ' ', s.lastname_2) AS 'students name', 
	i.iscription_date AS 'Insctiption date',
    i.final_grade AS 'Final grade',
	c.course_name AS 'Courses names',
    CONCAT(t.name, ' ', t.lastname_1 ) AS 'teachers name',
    c.course_code,
    c.number_credits, 
    c.semester    
FROM inscriptions AS i
JOIN students AS s
	ON i.id_student = s.id_student
JOIN courses AS c
	ON c.id_course = i.id_course
JOIN teachers AS t
	ON c.id_teacher = t.id_teacher
ORDER BY s.name, s.lastname_1, s.lastname_2 ASC;
    

-- QUERY 1:
-- Listing courses by teacher with more than 5 years of experience:
SELECT *
FROM teachers 
WHERE experience_years > 5;


-- QUERY 2:
-- Average of grades by course:
SELECT c.course_name, AVG(i.final_grade) AS 'Average of grades by course'
FROM inscriptions AS i
JOIN courses AS c
	ON i.id_course = c.id_course
GROUP BY c.course_name;


-- QUERY 3:
-- Show which students are registered in more than one course:
SELECT 
  i.id_student,
  CONCAT(s.name, ' ', s.lastname_1, ' ', s.lastname_2) AS full_name,
  COUNT(i.id_course) AS total_cursos
FROM inscriptions i
JOIN students s 
	ON i.id_student = s.id_student
GROUP BY i.id_student
HAVING COUNT(i.id_course) > 1;



-- Add a new column named 'academic_status' on students table:
ALTER TABLE students
ADD COLUMN academic_status VARCHAR(20);

DESCRIBE students;


-- *********************************************************************
-- Deleting a teacher and watch the effects on courses table:
-- *********************************************************************


-- QUERY 4:
-- Obtaining students that their average final_grade is superior to the general average:
SELECT
	s.id_student,
	CONCAT(s.name, ' ', s.lastname_1, ' ', s.lastname_2) AS full_name,
	ROUND(AVG(i.final_grade), 2) AS Average_grade
FROM inscriptions AS i
JOIN students AS s
	ON i.id_student = s.id_student
WHERE i.final_grade > (
		SELECT AVG(final_grade)
		FROM inscriptions
	)
GROUP BY s.id_student, s.name, s.lastname_1, s.lastname_2;


-- QUERY 5:
-- Query to search which students have grades major than 4.0 in Software 1 or sofware 2, ordered in descending way.
SELECT 
	s.name AS 'Student name', 
    s.lastname_1 AS 'Student surname',
    i.final_grade AS 'Final grade',
	c.course_name AS 'Courses names'
FROM inscriptions AS i
JOIN students AS s
	ON i.id_student = s.id_student
JOIN courses AS c
	ON c.id_course = i.id_course
WHERE i.final_grade >= 4 AND c.course_name IN ('Software 1', 'Software 2')
ORDER BY i.final_grade DESC; 


-- QUERY 6:
-- Students with final grades between 3.5 and 4.5 and their names contains a letter 'a' at the end.
SELECT 
	s.name AS 'Student name', 
    s.lastname_1 AS 'Student surname',
    i.final_grade AS 'Final grade',
	c.course_name AS 'Courses names'
FROM inscriptions AS i
JOIN students AS s
	ON i.id_student = s.id_student
JOIN courses AS c
	ON c.id_course = i.id_course
WHERE i.final_grade BETWEEN 3.5 AND 4.5
	AND s.name LIKE ('%a')
ORDER BY i.final_grade DESC; 

-- QUERY 7: 
-- Detecting which students have null in lastname
INSERT INTO students (name, lastname_1, email, id_gender, id_document_type, number_doc_type, id_career, birth_date, start_date, status)
VALUES 
('Frederich', 'Mckenzie', 'f.mczie@england.uk', 1, 3, 80174, 1, '2000-05-15', '2018-09-18', false),
('Anne', 'Wenzel', 'anne.wenzel@deuschland.de', 2, 3, 201480, 1, '1999-03-25', '2016-11-08', false);

SELECT name, lastname_1, lastname_2
FROM students 
WHERE lastname_2 IS NULL;

-- Query 8:
-- Counting the total number of registered students
SELECT COUNT(*) AS 'Total of students' 
FROM students;

-- Query 9:
-- Knowing which are the maximum and the minimun grade of the total grades:
SELECT 
	MAX(final_grade) AS 'Max grade',
	MIN(final_grade) AS 'Min grade',
    ROUND( SUM(final_grade) / COUNT(id_student), 2 ) AS 'General average grade'   
FROM inscriptions;


-- Grant privileges:

-- Creating an user:
CREATE USER 'viewer'@'localhost' IDENTIFIED BY '123456789';
CREATE USER 'editorx'@'localhost' IDENTIFIED BY 'editor123';

-- Grant privileges to that user:
GRANT SELECT
ON gestion_academica_universidad.*
TO 'viewer'@'localhost';
FLUSH PRIVILEGES;

GRANT INSERT, UPDATE  
ON gestion_academica_universidad.*
TO 'editorx'@'localhost';
FLUSH PRIVILEGES;

-- Knowing all users:
SELECT User, Host FROM mysql.user;

-- Knowing privileges for one specific user:
SHOW GRANTS FOR 'viewer'@'localhost';

SHOW GRANTS FOR 'editorx'@'localhost';

-- Revoking privileges of one user to an specific table.
REVOKE ALL PRIVILEGES
ON gestion_academica_universidad.*
FROM 'editorx'@'localhost';


-- Ensuring integrity of new registers applying Savepoint, rollback and commit.
-- step 1_: Input new student:
INSERT INTO students (name, lastname_1, email, id_gender, id_document_type, number_doc_type, id_career, birth_date, start_date, status)
VALUES ('Laura', 'Montoya', 'laura@email.io', 2, 1, 123456789, 1, '2002-10-12', '2025-08-01', 1);

-- Savepoint after create an student
SAVEPOINT student_registered;

-- Step 2: registering that person in one course.
INSERT INTO inscriptions (id_student, id_course, iscription_date, final_grade)
VALUES (LAST_INSERT_ID(), 1, '2025-08-10', 0.00);

-- Savepoint
SAVEPOINT course_1_registered;

-- Step 3: try of inscription with error (for instance: id_course invalid)
INSERT INTO inscriptions (id_student, id_course, iscription_date, final_grade)
VALUES (LAST_INSERT_ID(), 9999, '2025-08-10', 0.00);  --  This course does not exists

-- Something was wrong, to revert only the last step
ROLLBACK TO course_1_registered;

-- Finanlly, confirm it was ok
COMMIT;