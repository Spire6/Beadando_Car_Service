PROMPT Creating user CAR_MANAGER...               
                                                              
declare
  cursor cur is
    select 'alter system kill session ''' || sid || ',' || serial# || '''' as command    
      from v$session
     where username = 'CAR_MANAGER';
begin
  for c in cur loop
    EXECUTE IMMEDIATE c.command;    
  end loop;
end;
/

DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM dba_users t WHERE t.username = 'CAR_MANAGER';          
  IF v_count = 1 THEN 
    EXECUTE IMMEDIATE 'DROP USER car_manager CASCADE';     
  END IF;
END;
/


CREATE USER car_manager 
  IDENTIFIED BY "12345678" 
  DEFAULT TABLESPACE users
  QUOTA UNLIMITED ON users;

grant CREATE TRIGGER to car_manager;
GRANT CREATE SESSION TO car_manager;
GRANT CREATE TABLE TO car_manager;
GRANT CREATE VIEW TO car_manager;
GRANT CREATE SEQUENCE TO car_manager;
GRANT CREATE PROCEDURE TO car_manager;
grant create type to car_manager;
grant create job to car_manager;

ALTER SESSION SET CURRENT_SCHEMA = car_manager;

PROMPT Done.
