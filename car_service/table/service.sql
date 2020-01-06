
PROMPT Creating table service...

CREATE TABLE service(
  service_id           NUMBER         NOT NULL
 ,service_name         VARCHAR2(40)   NOT NULL
 ,car_id               NUMBER         
 ,owner_id             NUMBER         
 ,waiting_time         NUMBER 
 ,price                NUMBER(7)         
 ,part_id              NUMBER        
 ,date_of_service      DATE           DEFAULT TRUNC(SYSDATE) NOT NULL
 ,mod_user             varchar2(300)
 ,registered           DATE           NOT NULL
 ,last_modfied         DATE           NOT NULL
 ,DML_FLAG             varchar2(1)
 ,VERSION              number
) 
TABLESPACE users;
  
    
COMMENT ON TABLE service IS 'Szolg�ltat�s/szerviz t�bla';
COMMENT ON COLUMN service.service_id IS 'Szerviz ID';
COMMENT ON COLUMN service.service_name IS 'Szolg�ltat�s elnevez�se';
COMMENT ON COLUMN service.car_id IS 'Aut� ID';
COMMENT ON COLUMN service.owner_id IS 'Tulajdonos ID';
COMMENT ON COLUMN service.waiting_time IS 'V�rakoz�si id�';
COMMENT ON COLUMN service.price IS '�r';
COMMENT ON COLUMN service.part_id IS 'Szervizhez sz�ks�ges alkatr�sz';
COMMENT ON COLUMN service.date_of_service IS 'Szervizel�s d�tuma';
COMMENT ON COLUMN service.mod_user IS 'M�dos�t� felhaszn�l�';
COMMENT ON COLUMN service.registered IS 'Regisztr�ci� d�tuma';
COMMENT ON COLUMN service.last_modfied IS 'Utols� m�dos�t�s d�tuma';
COMMENT ON COLUMN service.DML_FLAG IS 'DML flag';
COMMENT ON COLUMN service.version IS 'Verzi�';

 
PROMPT Done.
