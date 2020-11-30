--set verify off
set serveroutput on

CREATE TABLE Student(
            UserID          NUMBER              NOT NULL,
            FirstName       VARCHAR2(20)        NOT NULL,
            LastName        VARCHAR2(20)        NOT NULL,
            EmailID         VARCHAR2(20)        Primary key,
            PassWord        VARCHAR2(20)        NOT NULL,
            CourseID        VARCHAR2(4 BYTE)
            
            );
            
-----------------------------------------------------------------
--Create auto increment sequent for creating unique userid for each student
-----------------------------------------------------------------
CREATE SEQUENCE seq_id
MINVALUE 1
START WITH 15001
INCREMENT BY 1
CACHE 10;

----------------------------------------------------------------
--Registration

ACCEPT F PROMPT 'Enter your First Name:'
ACCEPT L PROMPT 'Enter your Last Name:'
ACCEPT E PROMPT 'Enter your EmailID :'
ACCEPT P PROMPT 'Create your password:'

DECLARE               
            F       VARCHAR2(20)  ;
            L       VARCHAR2(20) ;  
            E       VARCHAR2(20)  ; 
            P       VARCHAR2(20)  ;
            num number;
BEGIN 
    num:=seq_id.nextval;
    INSERT into Student values (num,'&F','&L','&E','&P',NULL);
    DBMS_OUTPUT.put_line('Your username is: ');
    DBMS_OUTPUT.put_line(num); 
END;

---------------------------
--Output in student table

select* from student;



