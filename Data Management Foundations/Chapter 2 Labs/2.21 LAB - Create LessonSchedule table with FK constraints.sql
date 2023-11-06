-- 2.21 LAB - Create LessonSchedule table with FK constraints
-- Two tables are created:

-- Horse with columns:
-- ID - integer, primary key
-- RegisteredName - variable-length string

-- Student with columns:
-- ID - integer, primary key
-- FirstName - variable-length string
-- LastName - variable-length string

-- Create the LessonSchedule table with columns:
-- HorseID - integer with range 0 to 65 thousand, not NULL, partial primary key, foreign key references Horse(ID)
-- StudentID - integer with range 0 to 65 thousand, foreign key references Student(ID)
-- LessonDateTime - date/time, not NULL, partial primary key
-- If a row is deleted from Horse, the rows with the same horse ID should be deleted from LessonSchedule automatically.

-- If a row is deleted from Student, the same student IDs should be set to NULL in LessonSchedule automatically.

CREATE TABLE Horse (
	ID              SMALLINT UNSIGNED AUTO_INCREMENT,
	RegisteredName  VARCHAR(15),
	PRIMARY KEY (ID)
);

CREATE TABLE Student (
	ID             SMALLINT UNSIGNED AUTO_INCREMENT,
	FirstName      VARCHAR(20),
	LastName 		VARCHAR(30),
	PRIMARY KEY (ID)
);

-- Your SQL statements go here 
CREATE TABLE LessonSchedule (
   HorseID SMALLINT UNSIGNED NOT NULL,
   StudentID SMALLINT UNSIGNED,
   LessonDateTime DATETIME NOT NULL,
   PRIMARY KEY (HorseID,LessonDateTime),
   FOREIGN KEY (StudentID) REFERENCES Student(ID)
      ON DELETE SET NULL,
   FOREIGN KEY (HorseID) REFERENCES Horse(ID)
      ON DELETE CASCADE
);

