CREATE TABLE Students(
    student_id char(10) PRIMARY KEY,
    l_Name varchar(30),
    f_name varchar(30),
    age INT,
    gender char(1),
    birth_date DATE,
    address varchar(40),
    zip_code char(5),
    city varchar(15),
    school varchar(25),
    program char(5),
    ethnicity varchar(30),
    permission_slip BOOLEAN,
    birth_certificate BOOLEAN
);
-- Added boolean for permission slip and birth certificate, 0 = false, 1 = true. We could possibly use the birth certificate to at least confirm they have received the birth certificate.
-- What are the other programs besides GEMS?

CREATE TABLE Parents(
    child_id char(10) PRIMARY KEY,
    f_name varchar(30),
    l_name varchar(30),
    phone char(14),
    CONSTRAINT FK_child_id FOREIGN KEY (child_id)
    	REFERENCES Students(student_id)
);
-- 14 characters for phone to factor in dashes

CREATE TABLE Teachers(
    teacher_id char(10) PRIMARY KEY,
    f_name varchar(30),
    l_name varchar(30),
    phone char(14),
    address varchar(40),
    city varchar(15),
    zipcode char(5),
    email varchar(30)
);
-- Should schedule have last name and Teacher as a primary key? Why is kid id a primary key? Kids can have the same teacher? 
-- Maybe ask for clarification if the teacher teach multiple subjects to help clarify the database more and will establish a Primary Key. 
CREATE TABLE Schedule(
    class_name char(15),
    teacher char(10),
    id_student varchar(30),
    class_time time,
    room_num char(5),
    CONSTRAINT PK_schedule PRIMARY KEY(class_name,teacher,id_student),
    CONSTRAINT FK_Teacher FOREIGN KEY (teacher)
    	REFERENCES Teachers(teacher_id),
    CONSTRAINT FK_Student_id FOREIGN KEY(id_student)
    	REFERENCES Students(student_id)
);

CREATE TABLE Emergency_Info (
    student_reference_id char(10),
    contact_first varchar(30),
    contact_last varchar(30),
    relation char(15),
    phone_num char(14),
    CONSTRAINT PK_EMERGENCY_INFO PRIMARY KEY (student_reference_id,phone_num),
    CONSTRAINT FK_student_reference_id FOREIGN KEY (student_reference_id)
    	REFERENCES Students(student_id) 
);

CREATE TABLE Logins (
	username varchar(30) PRIMARY KEY,
	password varchar(30),
	account_type varchar(30),
	first_name varchar(30),
	last_name varchar(30),
	email varchar(30)
);

-- PS Possibly ask our client about ids, and room numbers in case
-- Do we need an indexes? 
-- Test Values

INSERT INTO Students VALUES
('A1B3CL3215', 'Jacobs', 'Blake', 22, 'M', '1995-09-26', '123 S. Main St.', '60321', 'Romeoville',  'Lewis', 'GEMS', 'African-American', '1','1');

INSERT INTO Parents VALUES
('A1B3CL3215', 'Damon', 'Jacobs', '1-630-898-7242');

INSERT INTO Teachers VALUES
('A12345678B', 'Carl', 'Winslow', '1-630-808-2131', '232 Westfield Ln', 'Planefield', '60325', 'Carlonduty@gmail.com');

INSERT INTO Schedule VALUES
('Math', 'A12345678B', 'A1B3CL3215', '9:00', '132A');

INSERT INTO Emergency_Info VALUES
('A1B3CL3215', 'Roman', 'Gonzales', 'Family-Friend', '1-630-888-2132');

INSERT INTO Logins VALUES
('kenny123', 'lewis123', 'administrator', 'Kenny', 'Madsen', 'kenny@lewisu.edu');