SELECT Pname, Dname FROM 
	(Project INNER JOIN Department ON Project.Dnum=Department.Dnumber)
	WHERE Plocation='Stafford';

SELECT Lower.Fname, Lower.Minit, Lower.Lname, Upper.Fname, Upper.Minit, Upper.Lname FROM
	Employee Lower, Employee Upper WHERE Lower.Super_ssn=Upper.Ssn;

SELECT SUM(Salary), MAX(Salary), MIN(Salary), AVG(Salary) 
	FROM Employee WHERE Dno IN 
	(SELECT Dnumber FROM Department WHERE Dname='Research');

SELECT Dno, COUNT(Dno) FROM Employee GROUP BY Dno;

SELECT Fname, Minit, Lname FROM Employee
	WHERE Ssn IN (SELECT Essn FROM Dependent WHERE Relationship='Daughter');

SELECT Fname, Minit, Lname FROM Employee
	WHERE Bdate>=DATE '1965-01-01' AND Bdate<DATE '1966-01-01'
	AND Dno IN (SELECT Dnumber FROM Dept_locations WHERE Dlocation='Stafford');