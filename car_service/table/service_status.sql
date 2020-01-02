
PROMPT Creating table service_status...

CREATE TABLE service_status(
  status_id           NUMBER         NOT NULL
 ,status_name         VARCHAR2(40)             
 ,created             DATE           DEFAULT SYSDATE NOT NULL
 ,last_modfied        DATE           DEFAULT SYSDATE NOT NULL
) 
TABLESPACE users;


ALTER TABLE service_status
  ADD CONSTRAINT service_status_pk PRIMARY KEY (status_id);
  

COMMENT ON TABLE service_status IS 'Szerviz állapot tábla';
COMMENT ON COLUMN service_status.status_name IS 'állapot megnevezése';

  
PROMPT Done.
