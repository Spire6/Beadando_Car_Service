
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
 ,last_modfied         DATE           DEFAULT SYSDATE NOT NULL
) 
TABLESPACE users;


ALTER TABLE service
  ADD CONSTRAINT service_pk PRIMARY KEY (service_id);
  
    
COMMENT ON TABLE service IS 'Szolg�ltat�s/szerviz t�bla';
COMMENT ON COLUMN service.service_name IS 'Szolg�ltat�s elnevez�se';
COMMENT ON COLUMN service.waiting_time IS 'V�rakoz�si id�';
COMMENT ON COLUMN service.part_id IS 'Szervizhez sz�ks�ges alkatr�sz';

 
PROMPT Done.
