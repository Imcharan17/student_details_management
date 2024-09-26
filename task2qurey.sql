use manage_student_record

 -- View All Students and Their Enrollments --
 DELIMITER $$

CREATE PROCEDURE GetStudentEnrollments()
BEGIN
    SELECT 
        S.student_id, 
        CONCAT(S.first_name, ' ', S.last_name) AS student_name, 
        C.course_name, 
        E.grade
    FROM 
        Enrollments E
    JOIN 
        Students S ON E.student_id = S.student_id
    JOIN 
        Courses C ON E.course_id = C.course_id;
END $$

DELIMITER ;

call GetStudentEnrollments();
delimiter $$
CREATE PROCEDURE GetStudentCourseGrades()
BEGIN
    SELECT 
        S.student_id, 
        CONCAT(S.first_name, ' ', S.last_name) AS student_name, 
        C.course_name, 
        E.grade
    FROM 
        Enrollments E
    JOIN 
        Students S ON E.student_id = S.student_id
    JOIN 
        Courses C ON E.course_id = C.course_id;
END $$

DELIMITER ;
DELIMITER //
-- This procedure allows inserting a new student into the Students table.--
CREATE PROCEDURE AddStudent(
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_date_of_birth DATE,
    IN p_gender ENUM('Male', 'Female', 'Other'),
    IN p_email VARCHAR(100),
    IN p_phone VARCHAR(15)
)
BEGIN
    INSERT INTO Students (first_name, last_name, date_of_birth, gender, email, phone)
    VALUES (p_first_name, p_last_name, p_date_of_birth, p_gender, p_email, p_phone);
END //

DELIMITER ;
 
 DELIMITER //
-- This procedure allows updating the grade for a specific student in a particular course.

CREATE PROCEDURE UpdateGrade(
    IN p_student_id INT,
    IN p_course_id INT,
    IN p_new_grade VARCHAR(2)
)
BEGIN
    UPDATE Enrollments
    SET grade = p_new_grade
    WHERE student_id = p_student_id AND course_id = p_course_id;
END //

DELIMITER ;

DELIMITER //

-- This procedure calculates the total amount of fees paid by a specific student.

CREATE PROCEDURE CalculateTotalFeesPaid(
    IN p_student_id INT,
    OUT total_paid DECIMAL(10, 2)
)
BEGIN
    SELECT SUM(amount_paid) INTO total_paid
    FROM Fees
    WHERE student_id = p_student_id;
END //

DELIMITER ;

DELIMITER //
-- This trigger updates the payment_status in the Fees table automatically when a new payment is inserted and the full amount is paid.
CREATE TRIGGER UpdatePaymentStatus
AFTER INSERT ON Fees
FOR EACH ROW
BEGIN
    IF NEW.total_fees = NEW.amount_paid THEN
        UPDATE Fees
        SET payment_status = 'Paid'
        WHERE fee_id = NEW.fee_id;
    END IF;
END //

DELIMITER ;


DELIMITER //
-- This procedure will allow you to update the email of a student using their student_id.
CREATE PROCEDURE UpdateStudentEmail(
    IN studentID INT,
    IN newEmail VARCHAR(100)
)
BEGIN
    UPDATE Students
    SET email = newEmail
    WHERE student_id = studentID;
END //

DELIMITER ;


DELIMITER //
-- This procedure enrolls a student in a course by inserting a new record into the Enrollments table.
CREATE PROCEDURE EnrollStudentInCourse(
    IN studentID INT,
    IN courseID INT,
    IN enrollDate DATE
)
BEGIN
    INSERT INTO Enrollments (student_id, course_id, enrollment_date)
    VALUES (studentID, courseID, enrollDate);
END //

DELIMITER ;

DELIMITER //
-- This procedure calculates the outstanding fees for a specific student.

CREATE PROCEDURE CalculateOutstandingFees(
    IN studentID INT
)
BEGIN
    DECLARE totalFees DECIMAL(10, 2);
    DECLARE amountPaid DECIMAL(10, 2);
    DECLARE outstanding DECIMAL(10, 2);

    SELECT total_fees, amount_paid INTO totalFees, amountPaid
    FROM Fees
    WHERE student_id = studentID;

    SET outstanding = totalFees - amountPaid;

    SELECT outstanding AS outstanding_balance;
END //

DELIMITER ;





 