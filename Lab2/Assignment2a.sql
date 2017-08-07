-- Table Employee --------------------
CREATE TABLE Employee(
	Fname VARCHAR(30) NOT NULL,
	Minit VARCHAR(1) NOT NULL,
	Lname VARCHAR(30) NOT NULL,
	Ssn INTEGER NOT NULL,
	Bdate DATE NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Sex VARCHAR(1) NOT NULL,
	Salary INTEGER NOT NULL,
	Super_ssn INTEGER,
	Dno INTEGER NOT NULL,
	PRIMARY KEY (Ssn),
	FOREIGN KEY (Super_ssn) REFERENCES Employee(Ssn));

INSERT INTO Employee VALUES ('James', 'E', 'Borg', 888665555, DATE '1937-11-10','450 Stone, Houston, TX', 'M', 55000, NULL, 1);
INSERT INTO Employee VALUES ('Franklin', 'T', 'Wong', 333445555, DATE  '1955-12-08','638 Voss, Houston, TX', 'M', 40000, 888665555, 5);
INSERT INTO Employee VALUES ('Jennifer', 'S', 'Wallace', 987654321, DATE '1941-06-20','291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4);
INSERT INTO Employee VALUES ('John', 'B', 'Smith', 123456789, DATE '1965-01-09','731 Fondren, Bellaire, TX', 'M', 30000, 333445555, 5);
INSERT INTO Employee VALUES ('Alicia', 'J', 'Zelaya', 999887777, DATE '1968-01-19','3321 Castle, Spring, TX', 'F', 25000, 987654321, 4);
INSERT INTO Employee VALUES ('Ramesh', 'K', 'Narayan', 666884444, DATE '1962-09-15','975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5);
INSERT INTO Employee VALUES ('Joyce', 'A', 'English', 453453453, DATE '1972-07-31','5631 Rice, Houston, TX', 'F', 25000, 333445555, 5);
INSERT INTO Employee VALUES ('Ahmad', 'V', 'Jabbar', 987987987, DATE '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4);

-- Table Department --------------------
CREATE TABLE Department(
	Dname VARCHAR(30),
	Dnumber INTEGER NOT NULL,
	Mgr_ssn INTEGER NOT NULL,
	Mgr_start_date DATE NOT NULL,
	PRIMARY KEY (Dnumber),
	FOREIGN KEY (Mgr_ssn) REFERENCES Employee(Ssn));

INSERT INTO Department VALUES ('Research', 5, 333445555, DATE '1988-05-22');
INSERT INTO Department VALUES ('Administration', 4, 987654321, DATE '1995-01-01');
INSERT INTO Department VALUES ('Headquarters', 1, 888665555, DATE '1981-06-19');

ALTER TABLE Employee 
ADD FOREIGN KEY (Dno) REFERENCES Department(Dnumber);

-- Table Dept_Locations --------------------
CREATE TABLE Dept_Locations(
	Dnumber INTEGER NOT NULL,
	Dlocation VARCHAR(30) NOT NULL,
	PRIMARY KEY (Dnumber,Dlocation),
	FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber));

INSERT INTO Dept_Locations VALUES (1, 'Houston');
INSERT INTO Dept_Locations VALUES (4, 'Stafford');
INSERT INTO Dept_Locations VALUES (5, 'Bellaire');
INSERT INTO Dept_Locations VALUES (5, 'Sugarland');
INSERT INTO Dept_Locations VALUES (5, 'Houston');

-- Table Project --------------------
CREATE TABLE Project(
	Pname VARCHAR(30) NOT NULL,
	Pnumber INTEGER NOT NULL,
	Plocation VARCHAR(30) NOT NULL,
	Dnum INTEGER NOT NULL,
	PRIMARY KEY (Pnumber),
	FOREIGN KEY (Dnum, Plocation) REFERENCES Dept_Locations(Dnumber,Dlocation));

INSERT INTO Project VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO Project VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO Project VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO Project VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO Project VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO Project VALUES ('Newbenefits', 30, 'Stafford', 4);

-- Table Works_On --------------------
CREATE TABLE Works_On(
	Essn INTEGER NOT NULL,
	Pno INTEGER NOT NULL,
	Hours NUMBER(3,1),
	PRIMARY KEY (Essn, Pno),
	FOREIGN KEY (Essn) REFERENCES Employee(Ssn),
	FOREIGN KEY (Pno) REFERENCES Project(Pnumber));

INSERT INTO WORKS_ON VALUES (123456789,1,32.5);
INSERT INTO WORKS_ON VALUES (123456789,2,07.5);
INSERT INTO WORKS_ON VALUES (666884444,3,40.0);
INSERT INTO WORKS_ON VALUES (453453453,1,20.0);
INSERT INTO WORKS_ON VALUES (453453453,2,20.0);
INSERT INTO WORKS_ON VALUES (333445555,2,10.0);
INSERT INTO WORKS_ON VALUES (333445555,3,10.0);
INSERT INTO WORKS_ON VALUES (333445555,10,10.0);
INSERT INTO WORKS_ON VALUES (333445555,20,10.0);
INSERT INTO WORKS_ON VALUES (999887777,30,30.0);
INSERT INTO WORKS_ON VALUES (999887777,10,10.0);
INSERT INTO WORKS_ON VALUES (987987987,10,35.0);
INSERT INTO WORKS_ON VALUES (987987987,30,05.0);
INSERT INTO WORKS_ON VALUES (987654321,30,20.0);
INSERT INTO WORKS_ON VALUES (987654321,20,15.0);
INSERT INTO WORKS_ON VALUES (888665555,20,NULL);                                                                                                                                                                       
 
-- Table Dependent--------------------
CREATE TABLE Dependent(
	Essn INTEGER NOT NULL,
	Dependent_name VARCHAR(30) NOT NULL,
	Sex VARCHAR(1) NOT NULL,
	Bdate DATE NOT NULL,
	Relationship VARCHAR(20) NOT NULL,
	PRIMARY KEY (Essn, Dependent_name),
	FOREIGN KEY (Essn) REFERENCES Employee(Ssn));

INSERT INTO Dependent VALUES (333445555,'Alice','F', DATE '1986-04-05','Daughter');
INSERT INTO Dependent VALUES (333445555,'Theodore','M', DATE '1983-10-25','Son');
INSERT INTO Dependent VALUES (333445555,'Joy','F', DATE '1958-05-03','Spouse');
INSERT INTO Dependent VALUES (987654321,'Abner','M', DATE '1942-02-28','Spouse');
INSERT INTO Dependent VALUES (123456789,'Michael','M', DATE '1988-01-04','Son');
INSERT INTO Dependent VALUES (123456789,'Alice','F', DATE '1988-12-30','Daughter');
INSERT INTO Dependent VALUES (123456789,'Elizabeth','F', DATE '1967-05-05','Spouse');