-- Create the database
CREATE DATABASE StudentDB;
USE StudentDB;

-- Create a Students table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    course VARCHAR(50) DEFAULT 'Undeclared',
    enrollment_date DATE
);

-- Create a Courses table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department VARCHAR(100)
);

-- Table: Payments
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(8,2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- 1. INNER JOIN – Students who made payments

SELECT s.student_id, s.name, p.amount, p.payment_date
FROM Students s
INNER JOIN Payments p ON s.student_id = p.student_id;

-- 2. LEFT JOIN – All students, with or without payments

SELECT s.student_id, s.name, p.amount, p.payment_date
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id;

-- 3. RIGHT JOIN – All payments, even if student data is missing

SELECT s.student_id, s.name, p.amount, p.payment_date
FROM Students s
RIGHT JOIN Payments p ON s.student_id = p.student_id;

-- 4. FULL OUTER JOIN – All students and all payments

SELECT s.student_id, s.name, p.amount, p.payment_date
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id

UNION

SELECT s.student_id, s.name, p.amount, p.payment_date
FROM Students s
RIGHT JOIN Payments p ON s.student_id = p.student_id;

-- 5. CROSS JOIN – Cartesian product of students × payments

SELECT s.name, p.amount
FROM Students s
CROSS JOIN Payments p;

-- 6. NATURAL JOIN – Automatically joins on column with same name (student_id)

SELECT *
FROM Students
NATURAL JOIN Payments;

-- 7. Self JOIN – Compare students in same course

SELECT A.name AS Student1, B.name AS Student2, A.course
FROM Students A
JOIN Students B ON A.course = B.course AND A.student_id <> B.student_id;

-- Aggregated Join – Total payments per student

SELECT s.name, SUM(p.amount) AS total_paid
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.name;