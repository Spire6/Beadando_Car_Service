
PROMPT Creating table service_status_h...

CREATE TABLE service_status_h(
  status_id           NUMBER         
 ,status_name         VARCHAR2(40)             
 ,mod_user            varchar2(300)
 ,registered          timestamp      
 ,last_modfied        timestamp      
 ,DML_FLAG            varchar2(1)
 ,VERSION             number
) 
TABLESPACE users;


COMMENT ON TABLE service_status_h IS 'Szerviz �llapot History t�bla';
COMMENT ON COLUMN service_status_h.status_name IS '�llapot megnevez�se';

  
PROMPT Done.
