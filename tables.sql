set serveroutput on

--course table

CREATE TABLE Course(
                courseID            NUMBER          PRIMARY KEY,        --courseid is primary key
                Coursename          VARCHAR2(20)        NOT NULL,
                Startdate           DATE                NOT NULL,
                Enddate             DATE                NOT NULL,
                Tutors              VARCHAR2(20)    NOT NULL,
                Fees                NUMBER          NOT NULL,
                MaxSeat             NUMBER          NOT NULL,
                TotalEnrolled       NUMBER          NOT NULL
            );

--sequence to create unique course id
CREATE SEQUENCE cs_id
MINVALUE 1
START WITH 1001
INCREMENT BY 1
CACHE 10;

--INSERT data into course table
/*
INSERT into Course values (cs_id.nextval,'Data Structure', TO_DATE('2021/01/20', 'yyyy/mm/dd'), TO_DATE('2021/02/20', 'yyyy/mm/dd'),'Rituparna Sinha',3000,5,0);
INSERT into Course values (cs_id.nextval,'Algorithm', TO_DATE('2021/01/20', 'yyyy/mm/dd'), TO_DATE('2021/02/20', 'yyyy/mm/dd'),'Uttam Kumar Dash',2500,5,0);
INSERT into Course values (cs_id.nextval,'Software', TO_DATE('2021/01/30', 'yyyy/mm/dd'), TO_DATE('2021/03/10', 'yyyy/mm/dd'),'Shiuli Roy',5000,10,2);

*/


--student table 

--Create student table 
CREATE TABLE Student(
            UserId              NUMBER ,
            FirstName       VARCHAR2(20)        NOT NULL,
            LastName        VARCHAR2(20)        NOT NULL,
            EmailID         VARCHAR2(20)        Primary key,  --emailid is primary key and 
            PassWord        VARCHAR2(20)        NOT NULL,
            CourseID        NUMBER,
            CONSTRAINT fk_course
            FOREIGN KEY (courseid)
            REFERENCES course(courseid)  --courseid is foreign key
            );
--sequence to create unique transactionid
CREATE SEQUENCE seq_id
MINVALUE 1
START WITH 15045
INCREMENT BY 1
CACHE 10;



--Transaction_details table
create table Transaction_Details(
                    UserID          NUMBER      PRIMARY KEY,
                    TransactionID       NUMBER  PRIMARY KEY,
                    Paidamount          NUMBER,
                    Time            DATE,
                    coursename          VARCHAR2(20),
                    courseid            NUMBER,
                    CONSTRAINT fk2_course
                    FOREIGN KEY (courseid)
                    REFERENCES course(courseid)
);
--sequence to create unique transactionid
CREATE SEQUENCE pay_id
MINVALUE 1
START WITH 12350012
INCREMENT BY 1
CACHE 10;


