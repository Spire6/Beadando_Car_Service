
PROMPT Creating table service...

CREATE TABLE service(
  service_id           NUMBER         NOT NULL
 ,service_name         VARCHAR2(40)   NOT NULL
 ,car_id               NUMBER         
 ,owner_id             NUMBER         
 ,waiting_time         NUMBER 
 ,price                NUMBER(7)         
 ,part_id              NUMBER        
 ,date_of_service      DATE           DEFAULT SYSDATE NOT NULL
 ,mod_user             varchar2(300)
 ,registered           DATE           NOT NULL
 ,last_modfied         DATE           NOT NULL
 ,DML_FLAG             varchar2(1)
 ,VERSION              number
) 
TABLESPACE users;
  
    
COMMENT ON TABLE service IS 'Szolg�ltat�s/szerviz t�bla';
COMMENT ON COLUMN service.service_name IS 'Szolg�ltat�s elnevez�se';
COMMENT ON COLUMN service.waiting_time IS 'V�rakoz�si id�';
COMMENT ON COLUMN service.part_id IS 'Szervizhez sz�ks�ges alkatr�sz';

 
PROMPT Done.
