set serveroutput on

ACCEPT courseid PROMPT 'Enter courseid : '
ACCEPT I PROMPT 'Enter your userid:'
ACCEPT N PROMPT 'Enter your CardNUmber:'
ACCEPT cvv PROMPT 'Enter the cvv number of you card :'

DECLARE               
            UID          NUMBER  ;
            CardNumber      VARCHAR2(20) ;   
            CVV_Number     VARCHAR2(20)  ;
            Time            DATE;
            pId             number;
            cid       NUMBER(20);
            amount     NUMBER;
            seat        number;
            person        VARCHAR2(20);
            cname         VARCHAR2(20);   
BEGIN
    
    UID:=&I;
    CardNumber :='&N';
    CVV_Number :='&cvv';
    cid:=&courseid;

    SELECT firstname INTO person FROM student WHERE userid = uid;
    SELECT fees INTO amount FROM course WHERE courseid = cid;
    SELECT TotalEnrolled INTO seat FROM course  WHERE courseid = cid;
    SELECT coursename INTO cname FROM course  WHERE courseid = cid;
    
    DECLARE
    card_isvalid   BOOLEAN;
    BEGIN
       card_isvalid := REGEXP_LIKE (CardNUmber, '^[0-9]+$');

       IF card_isvalid
           THEN
                DECLARE
                cvv_isvalid   BOOLEAN;
                BEGIN
                   cvv_isvalid := REGEXP_LIKE (CVV_Number, '^[0-9]+$');
                   IF cvv_isvalid
                       THEN
                            pId:=pay_id.nextval;
                            INSERT INTO Transaction_Details values(uid,pID,amount,TO_DATE(sysdate, 'dd/mm/yyyy hh24:mi:ss'),cname,cid);
                            UPDATE course   SET totalenrolled = seat+1  WHERE courseid = cid;
                            update student set courseid=cid where userid=uid;
                            dbms_output.put_line('Hello '||person||' your payment is Successfull. PayemtId is : '|| pId ||'. Amount '||amount||' has been decducted. You have Successfully enrolled '||cname);
                        ELSE
                            dbms_output.put_line(' Invalid CVV number.');
                    END IF;
                END;
            ELSE
                dbms_output.put_line('Invalid Card Number.');
        END IF;
    END;
END;
/