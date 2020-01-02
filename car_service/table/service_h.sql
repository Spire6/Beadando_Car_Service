
PROMPT Creating table service_h...

CREATE TABLE service_h(
  service_id           NUMBER         
 ,service_name         VARCHAR2(40)   
 ,car_id               NUMBER         
 ,owner_id             NUMBER         
 ,waiting_time         NUMBER 
 ,price                NUMBER         
 ,part_id              NUMBER         
 ,date_of_service      DATE           
 ,mod_user             varchar2(300)
 ,registered           timestamp      
 ,last_modfied         timestamp     
 ,DML_FLAG             varchar2(1)
 ,VERSION              number
) 
TABLESPACE users;
  
     
COMMENT ON TABLE service_h IS 'Szolg�ltat�s/szerviz History t�bla';
COMMENT ON COLUMN service_h.service_name IS 'Szolg�ltat�s elnevez�se';
COMMENT ON COLUMN service_h.waiting_time IS 'V�rakoz�si id�';
COMMENT ON COLUMN service_h.part_id IS 'Szervizhez sz�ks�ges alkatr�sz';
 
 
PROMPT Done.
