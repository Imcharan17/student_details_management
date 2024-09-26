create database manage_student_record;
use manage_student_record;

-- This table stores the personal details of students.

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- This table stores details about the courses.

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) NOT NULL UNIQUE,
    course_description TEXT
);

-- This table links students with courses and records their grades.

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE not null,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- This table will store fee-related information for each student.

CREATE TABLE Fees (
    fee_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    total_fees DECIMAL(10, 2) NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    due_date DATE,
    payment_date DATE,
    payment_status ENUM('Paid', 'Pending') DEFAULT 'Pending',
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- This table will track attendance for students in each course.

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    attendance_date DATE NOT NULL,
    status ENUM('Present', 'Absent') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students (first_name, last_name, date_of_birth, gender, email, phone)
VALUES 
('Arun', 'Kumar', '2000-04-15', 'Male', 'arun.kumar@example.com', '9876543210'),
('Lakshmi', 'Priya', '1999-08-25', 'Female', 'lakshmi.priya@example.com', '9876543211'),
('Ravi', 'Shankar', '2001-02-12', 'Male', 'ravi.shankar@example.com', '9876543212'),
('Divya', 'Srinivasan', '2000-11-01', 'Female', 'divya.srinivasan@example.com', '9876543213'),
('Suresh', 'Reddy', '1998-06-18', 'Male', 'suresh.reddy@example.com', '9876543214'),
('Meena', 'Natarajan', '2002-03-22', 'Female', 'meena.natarajan@example.com', '9876543215'),
('Karthik', 'Raj', '1999-12-30', 'Male', 'karthik.raj@example.com', '9876543216'),
('Shalini', 'Murthy', '2000-05-10', 'Female', 'shalini.murthy@example.com', '9876543217'),
('Vijay', 'Subramaniam', '2001-07-28', 'Male', 'vijay.subramaniam@example.com', '9876543218'),
('Anita', 'Rao', '1999-01-14', 'Female', 'anita.rao@example.com', '9876543219'),
('Prakash', 'Menon', '1998-09-11', 'Male', 'prakash.menon@example.com', '9876543220'),
('Renu', 'Iyer', '2000-02-05', 'Female', 'renu.iyer@example.com', '9876543221'),
('Saravanan', 'Balaji', '2002-12-20', 'Male', 'saravanan.balaji@example.com', '9876543222'),
('Keerthi', 'Mohan', '2001-08-07', 'Female', 'keerthi.mohan@example.com', '9876543223'),
('Gopinath', 'Krishnan', '1999-11-19', 'Male', 'gopinath.krishnan@example.com', '9876543224'),
('Vidya', 'Suresh', '1998-07-30', 'Female', 'vidya.suresh@example.com', '9876543225'),
('Hari', 'Narayanan', '2000-09-21', 'Male', 'hari.narayanan@example.com', '9876543226'),
('Swathi', 'Venkatesh', '1999-04-02', 'Female', 'swathi.venkatesh@example.com', '9876543227'),
('Mohan', 'Ranganathan', '2001-03-15', 'Male', 'mohan.ranganathan@example.com', '9876543228'),
('Revathi', 'Krishna', '1998-10-10', 'Female', 'revathi.krishna@example.com', '9876543229'),
('Ashok', 'Nair', '2000-06-01', 'Male', 'ashok.nair@example.com', '9876543230'),
('Sneha', 'Ramesh', '2002-01-19', 'Female', 'sneha.ramesh@example.com', '9876543231'),
('Rajesh', 'Varma', '1999-03-23', 'Male', 'rajesh.varma@example.com', '9876543232'),
('Pooja', 'Chandran', '2000-08-14', 'Female', 'pooja.chandran@example.com', '9876543233'),
('Ajith', 'Menon', '1998-02-28', 'Male', 'ajith.menon@example.com', '9876543234'),
('Harini', 'Sridhar', '2001-11-30', 'Female', 'harini.sridhar@example.com', '9876543235'),
('Vishnu', 'Das', '2000-10-05', 'Male', 'vishnu.das@example.com', '9876543236'),
('Megha', 'Anand', '1999-12-22', 'Female', 'megha.anand@example.com', '9876543237'),
('Ganesh', 'Ramachandran', '2002-05-04', 'Male', 'ganesh.ramachandran@example.com', '9876543238'),
('Priya', 'Bhaskar', '1998-11-17', 'Female', 'priya.bhaskar@example.com', '9876543239'),
('Bala', 'Sankaran', '1999-09-09', 'Male', 'bala.sankaran@example.com', '9876543240'),
('Lavanya', 'Gopal', '2001-06-16', 'Female', 'lavanya.gopal@example.com', '9876543241'),
('Arjun', 'Venkat', '1998-12-08', 'Male', 'arjun.venkat@example.com', '9876543242'),
('Sindu', 'Kiran', '2000-07-25', 'Female', 'sindu.kiran@example.com', '9876543243'),
('Dinesh', 'Rajagopal', '2002-04-27', 'Male', 'dinesh.rajagopal@example.com', '9876543244'),
('Aishwarya', 'Vishwanath', '1999-01-01', 'Female', 'aishwarya.vishwanath@example.com', '9876543245'),
('Manoj', 'Desai', '2000-03-18', 'Male', 'manoj.desai@example.com', '9876543246'),
('Anjali', 'Sundar', '2001-10-29', 'Female', 'anjali.sundar@example.com', '9876543247');

INSERT INTO Courses (course_name, course_code, course_description)
VALUES 
('Mathematics 101', 'MATH101', 'Introduction to basic mathematics.'),
('History 101', 'HIST101', 'Introduction to world history.'),
('Physics 101', 'PHYS101', 'Fundamentals of classical mechanics.'),
('Chemistry 101', 'CHEM101', 'Introduction to general chemistry concepts.'),
('Biology 101', 'BIOL101', 'Basic principles of biology and life sciences.'),
('Computer Science 101', 'CS101', 'Introduction to computer programming and algorithms.'),
('English Literature 101', 'ENG101', 'Study of classical and modern English literature.'),
('Economics 101', 'ECON101', 'Basic principles of micro and macroeconomics.'),
('Psychology 101', 'PSY101', 'Introduction to human psychology and behavior.'),
('Sociology 101', 'SOC101', 'Study of social structures and societal behavior.'),
('Political Science 101', 'POLSCI101', 'Introduction to political systems and theories.'),
('Philosophy 101', 'PHIL101', 'Overview of philosophical thought and reasoning.');

INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade)
VALUES 
(1, 1, '2024-01-15', 'A'),
(1, 2, '2024-01-16', 'B+'),
(2, 1, '2024-01-17', 'A-'),
(2, 3, '2024-01-18', 'B'),
(3, 2, '2024-01-19', 'A+'),
(3, 4, '2024-01-20', 'B-'),
(4, 3, '2024-01-21', 'C+'),
(4, 5, '2024-01-22', 'A'),
(5, 1, '2024-01-23', 'B'),
(5, 6, '2024-01-24', 'A-'),
(6, 2, '2024-01-25', 'B+'),
(6, 7, '2024-01-26', 'C'),
(7, 4, '2024-01-27', 'A'),
(7, 1, '2024-01-28', 'B-'),
(8, 3, '2024-01-29', 'A+'),
(8, 2, '2024-01-30', 'B'),
(9, 5, '2024-02-01', 'A'),
(9, 4, '2024-02-02', 'B+'),
(10, 1, '2024-02-03', 'A-'),
(10, 6, '2024-02-04', 'B'),
(11, 2, '2024-02-05', 'A+'),
(12, 7, '2024-02-06', 'B-'),
(13, 3, '2024-02-07', 'C+'),
(14, 5, '2024-02-08', 'A'),
(15, 1, '2024-02-09', 'B+'),
(16, 6, '2024-02-10', 'A-'),
(17, 4, '2024-02-11', 'B'),
(18, 2, '2024-02-12', 'A'),
(19, 1, '2024-02-13', 'B+'),
(20, 7, '2024-02-14', 'A-'),
(21, 3, '2024-02-15', 'B+'),
(22, 2, '2024-02-16', 'A'),
(23, 5, '2024-02-17', 'C+'),
(24, 1, '2024-02-18', 'A'),
(25, 6, '2024-02-19', 'B+'),
(26, 4, '2024-02-20', 'A'),
(27, 2, '2024-02-21', 'B-'),
(28, 7, '2024-02-22', 'A+'),
(29, 3, '2024-02-23', 'B+'),
(30, 7, '2024-01-26', 'C'),
(31, 4, '2024-01-27', 'A'),
(32, 1, '2024-01-28', 'B-'),
(33, 3, '2024-01-29', 'A+'),
(34, 2, '2024-01-30', 'B'),
(35, 5, '2024-02-01', 'A'),
(36, 4, '2024-02-02', 'B+'),
(37, 1, '2024-02-03', 'A-'),
(38, 1, '2024-01-28', 'B-');

INSERT INTO Fees (student_id, total_fees, amount_paid, due_date, payment_date, payment_status)
VALUES 
(1, 1000.00, 500.00, '2024-10-15', '2024-09-10', 'Pending'),
(2, 1500.00, 1500.00, '2024-10-15', '2024-09-08', 'Paid'),
(3, 1200.00, 600.00, '2024-10-15', '2024-09-12', 'Pending'),
(4, 2000.00, 2000.00, '2024-10-15', '2024-09-09', 'Paid'),
(5, 1800.00, 900.00, '2024-10-15', '2024-09-13', 'Pending'),
(6, 1000.00, 500.00, '2024-10-15', '2024-09-14', 'Pending'),
(7, 1700.00, 1700.00, '2024-10-15', '2024-09-11', 'Paid'),
(8, 1300.00, 1300.00, '2024-10-15', '2024-09-15', 'Paid'),
(9, 1100.00, 550.00, '2024-10-15', '2024-09-16', 'Pending'),
(10, 2000.00, 2000.00, '2024-10-15', '2024-09-10', 'Paid'),
(11, 1600.00, 1600.00, '2024-10-15', '2024-09-17', 'Paid'),
(12, 1900.00, 950.00, '2024-10-15', '2024-09-18', 'Pending'),
(13, 1500.00, 1500.00, '2024-10-15', '2024-09-19', 'Paid'),
(14, 1200.00, 600.00, '2024-10-15', '2024-09-20', 'Pending'),
(15, 1800.00, 1800.00, '2024-10-15', '2024-09-21', 'Paid'),
(16, 1700.00, 850.00, '2024-10-15', '2024-09-22', 'Pending'),
(17, 1300.00, 1300.00, '2024-10-15', '2024-09-23', 'Paid'),
(18, 1000.00, 500.00, '2024-10-15', '2024-09-24', 'Pending'),
(19, 1900.00, 950.00, '2024-10-15', '2024-09-25', 'Pending'),
(20, 1600.00, 1600.00, '2024-10-15', '2024-09-26', 'Paid'),
(21, 1500.00, 1500.00, '2024-10-15', '2024-09-27', 'Paid'),
(22, 1100.00, 550.00, '2024-10-15', '2024-09-28', 'Pending'),
(23, 1200.00, 1200.00, '2024-10-15', '2024-09-29', 'Paid'),
(24, 1300.00, 1300.00, '2024-10-15', '2024-09-30', 'Paid'),
(25, 1700.00, 850.00, '2024-10-15', '2024-09-12', 'Pending'),
(26, 1000.00, 1000.00, '2024-10-15', '2024-09-13', 'Paid'),
(27, 1600.00, 800.00, '2024-10-15', '2024-09-14', 'Pending'),
(28, 1900.00, 1900.00, '2024-10-15', '2024-09-15', 'Paid'),
(29, 1800.00, 900.00, '2024-10-15', '2024-09-16', 'Pending'),
(30, 1400.00, 700.00, '2024-10-15', '2024-09-17', 'Pending'),
(31, 1700.00, 1700.00, '2024-10-15', '2024-09-18', 'Paid'),
(32, 1500.00, 1500.00, '2024-10-15', '2024-09-19', 'Paid'),
(33, 1300.00, 650.00, '2024-10-15', '2024-09-20', 'Pending'),
(34, 2000.00, 2000.00, '2024-10-15', '2024-09-21', 'Paid'),
(35, 1400.00, 700.00, '2024-10-15', '2024-09-22', 'Pending'),
(36, 1100.00, 1100.00, '2024-10-15', '2024-09-23', 'Paid'),
(37, 1200.00, 600.00, '2024-10-15', '2024-09-24', 'Pending'),
(38, 1200.00, 900.00, '2024-10-15', '2024-09-13', 'Pending');





