
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
  
    
COMMENT ON TABLE service IS 'Szolgáltatás/szerviz tábla';
COMMENT ON COLUMN service.service_id IS 'Szerviz ID';
COMMENT ON COLUMN service.service_name IS 'Szolgáltatás elnevezése';
COMMENT ON COLUMN service.car_id IS 'Autó ID';
COMMENT ON COLUMN service.owner_id IS 'Tulajdonos ID';
COMMENT ON COLUMN service.waiting_time IS 'Várakozási idõ';
COMMENT ON COLUMN service.price IS 'Ár';
COMMENT ON COLUMN service.part_id IS 'Szervizhez szükséges alkatrész';
COMMENT ON COLUMN service.date_of_service IS 'Szervizelés dátuma';
COMMENT ON COLUMN service.mod_user IS 'Módosító felhasználó';
COMMENT ON COLUMN service.registered IS 'Regisztráció dátuma';
COMMENT ON COLUMN service.last_modfied IS 'Utolsó módosítás dátuma';
COMMENT ON COLUMN service.DML_FLAG IS 'DML flag';
COMMENT ON COLUMN service.version IS 'Verzió';

 
PROMPT Done.
