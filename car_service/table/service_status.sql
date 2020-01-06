
PROMPT Creating table service_status...

CREATE TABLE service_status(
  status_id           NUMBER         NOT NULL
 ,status_name         VARCHAR2(40)             
 ,mod_user            varchar2(300)
 ,registered          DATE           NOT NULL
 ,last_modfied        DATE           NOT NULL
 ,DML_FLAG            varchar2(1)
 ,VERSION             number
) 
TABLESPACE users;


COMMENT ON TABLE service_status IS 'Szerviz �llapot t�bla';
COMMENT ON COLUMN service_status.status_id IS '�llapot ID';
COMMENT ON COLUMN service_status.status_name IS '�llapot megnevez�se';
COMMENT ON COLUMN service_status.mod_user IS 'M�dos�t� felhaszn�l�';
COMMENT ON COLUMN service_status.registered IS 'Regisztr�ci� d�tuma';
COMMENT ON COLUMN service_status.last_modfied IS 'Utols� m�dos�t�s d�tuma';
COMMENT ON COLUMN service_status.DML_FLAG IS 'DML flag';
COMMENT ON COLUMN service_status.version IS 'Verzi�';

  
PROMPT Done.
