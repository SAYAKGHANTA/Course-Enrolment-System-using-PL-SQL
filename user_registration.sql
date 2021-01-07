set serveroutput on

--------------------------------------
--course table 
--------------------------------------
--Create auto increment sequent for creating unique courseid for each course

CREATE SEQUENCE cs_id
MINVALUE 1
START WITH 1001
INCREMENT BY 1
CACHE 10;

CREATE TABLE Course(
                courseID            NUMBER          PRIMARY KEY,
                Coursename          VARCHAR2(20)        NOT NULL,
                Startdate           DATE                NOT NULL,
                Enddate             DATE                NOT NULL,
                Tutors              VARCHAR2(20)    NOT NULL,
                Fees                NUMBER          NOT NULL,
                MaxSeat             NUMBER          NOT NULL,
                TotalEnrolled       NUMBER          NOT NULL
                --CONSTRAINT course_pk PRIMARY KEY (courseid)
            );
/*
INSERT into Course values (cs_id.nextval,'Data Structure', TO_DATE('2021/01/20', 'yyyy/mm/dd'), TO_DATE('2021/02/20', 'yyyy/mm/dd'),'Rituparna Sinha',3000,5,0);
INSERT into Course values (cs_id.nextval,'Algorithm', TO_DATE('2021/01/20', 'yyyy/mm/dd'), TO_DATE('2021/02/20', 'yyyy/mm/dd'),'Uttam Kumar Dash',2500,5,0);
INSERT into Course values (cs_id.nextval,'Software', TO_DATE('2021/01/30', 'yyyy/mm/dd'), TO_DATE('2021/03/10', 'yyyy/mm/dd'),'Shiuli Roy',5000,10,2);
*/

----------------------------------------------------------------
--Registration
----------------------------------------------------------------

CREATE TABLE Student(
            UserId              NUMBER ,
            FirstName       VARCHAR2(20)        NOT NULL,
            LastName        VARCHAR2(20)        NOT NULL,
            EmailID         VARCHAR2(20)        Primary key,
            PassWord        VARCHAR2(20)        NOT NULL,
            CourseID        NUMBER,
            CONSTRAINT fk_course
            FOREIGN KEY (courseid)
            REFERENCES course(courseid)
            );


-----------------------------------------------------------------
--Create auto increment sequent for creating unique userid for each student
CREATE SEQUENCE seq_id
MINVALUE 1
START WITH 15001
INCREMENT BY 1
CACHE 10;

ACCEPT F PROMPT 'Enter your First Name:'
ACCEPT L PROMPT 'Enter your Last Name:'
ACCEPT E PROMPT 'Enter your EmailID :'
ACCEPT P PROMPT 'Create your password:'

DECLARE               
            Firstname        VARCHAR2(20)  ;
            Lastname         VARCHAR2(20) ;  
            Eid              VARCHAR2(20)  ; 
            Password         VARCHAR2(20)  ;
            num              number;
BEGIN

    Firstname:='&F';
    Lastname :='&L';
    Eid :='&E';
    Password :='&p';
    DECLARE
    b_isvalid   BOOLEAN;
    BEGIN
       b_isvalid := REGEXP_LIKE (Eid,
                       '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');
       IF b_isvalid
           THEN
                      DECLARE
                          m_exst number(1);
                        BEGIN
                          select case
                                   when exists(select Emailid from student where Emailid=Eid)
                                   then 1
                                   else 0
                                 end  into m_exst
                          from dual;  
                        IF m_exst = 1 
                            THEN
                                DBMS_OUTPUT.put_line('Emailid is already registered.');
                        ELSE 
                            num:=seq_id.nextval;
                            INSERT into Student values (num,Firstname, Lastname, Eid, Password,null);
                            DBMS_OUTPUT.put_line('Welcome '||Firstname||' your user-id is: '|| num);
                        END IF;
                     END;
                 --DBMS_OUTPUT.put_line ('It is a valid email address.');    
       ELSE
                DBMS_OUTPUT.put_line ('It is Not a valid email address.');
       END IF;    
    
    END;
END;
---------------------------
--Output in student table

select* from student;



