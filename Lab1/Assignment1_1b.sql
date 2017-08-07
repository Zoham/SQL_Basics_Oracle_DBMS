SELECT Course_name FROM COURSE WHERE Course_number IN 
	(SELECT Course_number FROM SECTION WHERE Instructor=&Instructor);

SELECT Name FROM Student WHERE Student_Number IN 
	(SELECT Student_Number FROM Grade_report WHERE Grade='A' AND Section_identifier IN 
		(SELECT Section_identifier FROM SECTION WHERE Course_number IN 
			(SELECT Course_Number FROM Course WHERE Course_name=&Course_name)));

SELECT Course_name FROM COURSE WHERE Department='CS';

SELECT Course_name FROM COURSE WHERE Course_number NOT IN 
	(SELECT Course_number FROM Prerequisite);

SELECT Grade FROM Grade_report WHERE Student_number IN 
	(SELECT Student_number FROM Student WHERE Name=&Name) AND Section_identifier IN 
	(SELECT Sec'Chang'tion_Identifier FROM Section WHERE Course_number=&Course_number);