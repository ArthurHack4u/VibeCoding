CREATE DATABASE University;
USE University;

CREATE TABLE Student (
    studId      CHAR(6),
    lastName    CHAR(20) NOT NULL,
    firstName   CHAR(20) NOT NULL,
    major       CHAR(10),
    credits     SMALLINT DEFAULT 0,
    CONSTRAINT Student_studId_pk PRIMARY KEY (studId),
    CONSTRAINT Student_credits_cc CHECK (credits >= 0 AND credits <= 150)
);

CREATE TABLE Faculty (
    facId       CHAR(6),
    name        CHAR(20) NOT NULL,
    department  CHAR(20) NOT NULL,
    `rank`        CHAR(10),
    CONSTRAINT Faculty_facId_pk PRIMARY KEY (facId)
);

CREATE TABLE Class (
    classNumber CHAR(8),
    facId       CHAR(6) NOT NULL,
    schedule    CHAR(8),
    room        CHAR(6),
    CONSTRAINT Class_classNumber_pk PRIMARY KEY (classNumber),
    CONSTRAINT Class_facId_fk FOREIGN KEY (facId) REFERENCES Faculty(facId)
);

CREATE TABLE Enroll (
    studId      CHAR(6),
    classNumber CHAR(8),
    grade       CHAR(2),
    CONSTRAINT Enroll_classNumber_studId_pk PRIMARY KEY (classNumber, studId),
    CONSTRAINT Enroll_classNumber_fk FOREIGN KEY (classNumber) REFERENCES Class(classNumber),
    CONSTRAINT Enroll_studId_fk FOREIGN KEY (studId) REFERENCES Student(studId) ON DELETE CASCADE
);

INSERT INTO Student VALUES
('S1001', 'Smith', 'Tom', 'History', 90),
('S1002', 'Chin', 'Ann', 'Math', 36),
('S1005', 'Lee', 'Perry', 'History', 3),
('S1010', 'Burns', 'Edward', 'Art', 63),
('S1013', 'McCarthy', 'Owen', 'Math', 0),
('S1015', 'Jones', 'Mary', 'Math', 42),
('S1020', 'Rivera', 'Jane', 'CSC', 15);

INSERT INTO Faculty VALUES
('F101', 'Adams', 'Art', 'Professor'),
('F105', 'Tanaka', 'CSC', 'Instructor'),
('F110', 'Byrne', 'Math', 'Assistant'),
('F115', 'Smith', 'History', 'Associate'),
('F221', 'Smith', 'CSC', 'Professor');

INSERT INTO Class VALUES
('ART103A', 'F101', 'MWF9', 'H221'),
('CSC201A', 'F105', 'TuThF10', 'M110'),
('CSC203A', 'F105', 'MThF12', 'M110'),
('HST205A', 'F115', 'MWF11', 'H221'),
('MTH101B', 'F110', 'MTuTh9', 'H225'),
('MTH103C', 'F110', 'MWF11', 'H225');

INSERT INTO Enroll VALUES
('S1001', 'ART103A', 'A'),
('S1001', 'HST205A', 'C'),
('S1002', 'ART103A', 'D'),
('S1002', 'CSC201A', 'F'),
('S1002', 'MTH103C', 'B'),
('S1010', 'ART103A', 'A'),
('S1010', 'MTH103C', 'C'),
('S1020', 'CSC201A', 'B'),
('S1020', 'MTH101B', 'A');

