CREATE TABLE company(
    Name VARCHAR(32) NOT NULL,
    address VARCHAR(50) NOT NULL,
    CREATED_DATE DATE
    );

CREATE TABLE company_LOG(
    Name VARCHAR(32) NOT NULL,
    address VARCHAR(50) NOT NULL,
    CREATED_DATE DATE
    );
 CREATE OR REPLACE TRIGGER Company_Trig
    AFTER INSERT ON company
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
    BEGIN
    INSERT INTO COMPANY_LOG(Name,address, CREATED_DATE)
    VALUES(:NEW.Name, :NEW.address ,:NEW.created_date);
    END;

INSERT INTO Company (Name ,address,created_date)VALUES('Dell','USD',SYSDATE);
INSERT INTO Company (Name ,address,created_date)VALUES('HP','USK',SYSDATE);
INSERT INTO Company (Name ,address,created_date)VALUES('TOSHIBA','GERMANI',SYSDATE);
INSERT INTO Company (Name ,address,created_date)VALUES('lNOVE','AFGHANISTAN',SYSDATE);
SELECT *FROM Company; 
SELECT *FROM Company_LOG;
