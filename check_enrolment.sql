DECLARE

user_id number;
user number;
course_id number;
course_name varchar2(20);
cname varchar2(20);
v2 number;
v3 number;
v4 number;
v5 number;
v6 number;

BEGIN

    user_id:=&user;
    course_name:= '&cname';
    SELECT courseID into v2 from Course
    where Coursename=course_name;
    
    SELECT CourseId into v3 from student
    where UserId=user_id;
    
    SELECT MaxSeat into v4 from Course
    where courseID = v2;
    
    SELECT TotalEnrolled into v5 from Course
    where courseID = v2;

    IF v3 is NULL THEN
        IF v5<v4 THEN
            --UPDATE student set CourseId = v2 where UserId = user_id;
            --v6:=v5+1;
            --UPDATE Course set TotalEnrolled = v6 where courseId = course_id;
            dbms_output.put_line('Course is available you can go for Enrollment');
        ELSE
            dbms_output.put_line('No seat is available for this course. Course is full');
        END IF;
    ELSE
        dbms_output.put_line('You have already enrolled one course');
    END IF;
END;
/