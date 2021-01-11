--set verify off
set serveroutput on

---------------------------------------------------------------------
--PART-2: Login
---------------------------------------------------------------------

ACCEPT userid PROMPT 'Enter your UserID: '
ACCEPT password PROMPT 'Enter your password: '

declare
  l_exst number(1);
  u  NUMBER;
  p  VARCHAR2(20);
begin
    u := '&userid';
    p :='&password';
  select case 
           when exists(select userid from student where userid=u)
           then 1
           else 0
         end  into l_exst
  from dual;
  if l_exst = 1 
  then
          declare
              m_exst number(1);
              
            begin
              select case
                       when exists(select userid from student where userid=u and password=p)
                       then 1
                       else 0
                     end  into m_exst
              from dual;  
            if m_exst = 1 
            then
                DBMS_OUTPUT.put_line('You are Connected');
            else 
                DBMS_OUTPUT.put_line('Password is Incorrect');
            end if;
        end;
  else
    DBMS_OUTPUT.put_line('Yor are not Registered');
  end if;
end;
/
