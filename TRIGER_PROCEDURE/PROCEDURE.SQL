CREATE TABLE company(
    Name VARCHAR(32) NOT NULL,
    address VARCHAR(50) NOT NULL,
    CREATED_DATE DATE
    );

create or replace PROCEDURE Get_COMPANY
IS
  Company SYS_REFCURSOR;  
BEGIN

  OPEN Company FOR 
  SELECT *
  from  Company;
  DBMS_SQL.RETURN_RESULT(Company);

END Get_COMPANY;

exec Get_COMPANY;