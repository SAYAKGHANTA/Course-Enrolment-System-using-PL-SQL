set serveroutput on

-----------------------------------------------------------------------------------------------------------
--Payment process
-----------------------------------------------------------------------------------------------------------
create table PaymentDetails(
                    UserID          NUMBER      NOT NULL,  
                    CardNumber      VARCHAR2(20)     NOT NULL,
                    CVV_Number      VARCHAR2(20)    NOT NULL,
                    Time            DATE,
                    TransactionID       NUMBER 
);

/*
CREATE SEQUENCE pay_id
MINVALUE 1
START WITH 12350012
INCREMENT BY 1
CACHE 10;
*/

ACCEPT courseid PROMPT 'Enter courseid : '
ACCEPT I PROMPT 'Enter your userid:'
ACCEPT N PROMPT 'Enter your CardNUmber:'
ACCEPT cvv PROMPT 'Enter the cvv number of you card :'

DECLARE               
            UserID          NUMBER  ;
            CardNumber      VARCHAR2(20) ;   
            CVV_Number     VARCHAR2(20)  ;
            Time            DATE;
            pId             number;
            id       VARCHAR2(20);
            name       VARCHAR2(20);
            amount     NUMBER;
            seat        number;
BEGIN
    
    UserID:=&I;
    CardNumber :='&N';
    CVV_Number :='&cvv';
    id:='&courseid';
    SELECT fees INTO amount 
    FROM course
    WHERE courseid = id;
    SELECT coursename INTO name 
    FROM course
    WHERE courseid = id;
    SELECT TotalEnrolled INTO seat FROM course  WHERE courseid = id;
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
                            INSERT INTO PaymentDetails values(userid,CardNumber,CVV_Number,TO_DATE(sysdate, 'dd/mm/yyyy hh24:mi:ss'),pID);
                            UPDATE course
                            SET totalenrolled = seat+1
                            WHERE courseid = id;
                            dbms_output.put_line('Payment Successfull Your PayemtId is : '|| pId ||' Amount '||amount||' has been decducted. You have Successfully enrolled '||name);
                        ELSE
                            dbms_output.put_line('Invalid CVV number');
                    END IF;
                END;
            ELSE
                dbms_output.put_line(Cardnumber||' is not a valid Card Number');
        END IF;
    END;
END;
