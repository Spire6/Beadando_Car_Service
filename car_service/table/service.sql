
PROMPT Creating table service...

CREATE TABLE service(
  service_id           NUMBER         NOT NULL
 ,service_name         VARCHAR2(40)   NOT NULL
 ,car_id               NUMBER         
 ,owner_id             NUMBER         
 ,waiting_time         NUMBER 
 ,price                NUMBER         
 ,part_id              NUMBER         
 ,date_of_service      DATE           DEFAULT SYSDATE NOT NULL
 ,mod_user            varchar2(300)
 ,registered          timestamp      NOT NULL
 ,last_modfied        timestamp      NOT NULL
 ,DML_FLAG            varchar2(1)
 ,VERSION             number
) 
TABLESPACE users;
  
    
COMMENT ON TABLE service IS 'Szolgáltatás/szerviz tábla';
COMMENT ON COLUMN service.service_name IS 'Szolgáltatás elnevezése';
COMMENT ON COLUMN service.waiting_time IS 'Várakozási idő';
COMMENT ON COLUMN service.part_id IS 'Szervizhez szükséges alkatrész';

 
PROMPT Done.
