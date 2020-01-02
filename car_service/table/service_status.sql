
PROMPT Creating table service_status...

CREATE TABLE service_status(
  status_id           NUMBER         NOT NULL
 ,status_name         VARCHAR2(40)             
 ,mod_user            varchar2(300)
 ,registered          timestamp      NOT NULL
 ,last_modfied        timestamp      NOT NULL
 ,DML_FLAG            varchar2(1)
 ,VERSION             number
) 
TABLESPACE users;


COMMENT ON TABLE service_status IS 'Szerviz állapot tábla';
COMMENT ON COLUMN service_status.status_name IS 'állapot megnevezése';

  
PROMPT Done.
