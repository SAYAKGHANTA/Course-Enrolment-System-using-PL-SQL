set serveroutput on

----------------------------------------------------------------
--Registration
----------------------------------------------------------------

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
                       '^[a-z0-9._%+-]+@[a-z]+\.[a-z]{2,4}$');
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
                 --DBMS_OUTPUT.put_line ('is a valid email address.');    
       ELSE
                DBMS_OUTPUT.put_line (' Invalid email address.');
       END IF;    
    
    END;
END;
/