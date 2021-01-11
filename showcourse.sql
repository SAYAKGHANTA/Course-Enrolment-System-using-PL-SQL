declare
v1 Course%rowtype;
cursor c1 is
select*from Course;

begin
open c1;
loop
fetch c1 into v1;
exit when c1%NOTFOUND;
dbms_output.put_line('Course_id: '||v1.courseID|| '     Coursename: '||v1.Coursename ||'    Startdate: '||v1.Startdate ||' Enddate: '||v1.Enddate ||' Tutors: '||v1.Tutors ||' Fee: '||v1.Fees);
end loop;
close c1;
end;
/