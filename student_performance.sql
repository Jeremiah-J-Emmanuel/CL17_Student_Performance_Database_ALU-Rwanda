CREATE TABLE students(  
    student_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    -- The above column is the primary key
    student_name VARCHAR(200) NOT NULL,
    intake_year VARCHAR(200) NOT NULL) ;

INSERT INTO students (student_id, student_name, intake_year) VALUES
(1001, 'John Doe', 'Jan 2025'),
(1002, 'Darlene Umutoni', 'May 2023'),
(1003, 'Yves Mendel', 'Sept 2023'),
(1004, 'Chiagoziem Chukwudi','Jan 2024'),
(1005, 'Musa Babayaro', 'May 2025'),
(1006, 'Edward Odihamdo', 'May 2024'),
(1007, 'Mark Borana', 'Sept 2024'),
(1008, 'Keza Irakoze', 'Sept 2022'),
(1009, 'Victoria Ngemana', 'Jan 2022'),
(1010, 'Janet Ishimwe', 'May 2025'),
(1011, 'Margaret Ayodele', 'Jan 2022'),
(1012, 'Johnson Appiah', 'Jan 2023'),
(1013, 'Salim Abdulaziz', 'Sept 2024'),
(1014, 'Emmanuella Irakoze','May 2023'),
(1015, 'Doku James', 'Sept 2024'),
(1016, 'Aisha Abdullahi', 'May 2024'),
(1017, 'Maryam Abebe', 'Sept 2024'),
(1018, 'Mulle Abiodun', 'Jan 2025'),
(1019, 'Grace Ncube', 'May 2022'),
(1020, 'Fatou Diallo', 'Sept 2023'),
(1021, 'Joseph Adeyemi', 'Jan 2023'),
(1022, 'Linda Mugisha', 'Sept 2025'),
(1023, 'David Okoro', 'May 2023'),
(1024, 'Sarah Atieno', 'Jan 2024'),
(1025, 'Mark Banda', 'Sept 2022');

CREATE TABLE linux_grades(  
    course_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(200) NOT NULL,
    student_id INT NOT NULL,
    grade_obtained VARCHAR(200) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
    -- The student_id key is the foreign key. It creates a relationship
    -- between the students table and the linux_grades table
    );

INSERT INTO linux_grades (course_id, course_name, student_id, grade_obtained) VALUES
(101, 'Linux and IT Tools', 1002, 54),
(102, 'Linux and IT Tools', 1004, 92),
(103, 'Linux and IT Tools', 1006, 67),
(104, 'Linux and IT Tools', 1007, 88),
(105, 'Linux and IT Tools', 1008, 74),
(106, 'Linux and IT Tools', 1010, 71),
(107, 'Linux and IT Tools', 1011, 58),
(108, 'Linux and IT Tools', 1013, 85),
(109, 'Linux and IT Tools', 1015, 63),
(110, 'Linux and IT Tools', 1016, 39),
(111, 'Linux and IT Tools', 1017, 82),
(112, 'Linux and IT Tools', 1018, 79),
(113, 'Linux and IT Tools', 1019, 64),
(114, 'Linux and IT Tools', 1021, 47),
(115, 'Linux and IT Tools', 1022, 96),
(116, 'Linux and IT Tools', 1023, 90),
(117, 'Linux and IT Tools', 1025, 76);


CREATE TABLE python_grades(  
    course_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(200) NOT NULL,
    student_id INT NOT NULL,
    grade_obtained VARCHAR(200) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id));

INSERT INTO python_grades (course_id, course_name, student_id, grade_obtained) VALUES
(301, 'Python Programming', 1002, 68),
(302, 'Python Programming', 1005, 92),
(303, 'Python Programming', 1007, 55),
(304, 'Python Programming', 1009, 84),
(305, 'Python Programming', 1010, 73),
(306, 'Python Programming', 1014, 61),
(307, 'Python Programming', 1016, 97),
(308, 'Python Programming', 1017, 42),
(309, 'Python Programming', 1018, 89),
(310, 'Python Programming', 1020, 76),
(311, 'Python Programming', 1021, 53),
(312, 'Python Programming', 1022, 95),
(313, 'Python Programming', 1023, 66),
(314, 'Python Programming', 1001, 80),
(315, 'Python Programming', 1004, 47),
(316, 'Python Programming', 1006, 59),
(317, 'Python Programming', 1011, 71),
(318, 'Python Programming', 1013, 38),
(319, 'Python Programming', 1019, 64),
(320, 'Python Programming', 1025, 88);

-- Number 2
SELECT s.student_id, s.student_name, s.intake_year, lg.grade_obtained as linux_grade
FROM students s
JOIN linux_grades lg ON s.student_id = lg.student_id
WHERE CAST(lg.grade_obtained AS UNSIGNED) < 50
ORDER BY CAST(lg.grade_obtained AS UNSIGNED) ASC;

--Number 3
--This is for Ridaa

--Number 4
-- This is for Keira

--Number 5, 
SELECT s.student_id, s.student_name
FROM students s
WHERE (
    s.student_id IN (SELECT student_id FROM linux_grades)
    AND s.student_id NOT IN (SELECT student_id FROM python_grades)
)
OR (
    s.student_id IN (SELECT student_id FROM python_grades)
    AND s.student_id NOT IN (SELECT student_id FROM linux_grades)
);