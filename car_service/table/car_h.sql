
PROMPT Creating table car_h...

CREATE TABLE car_h(
  car_id              NUMBER        
 ,license_plate       VARCHAR2(10)   
 ,brand               VARCHAR2(40)   
 ,model_type          VARCHAR2(40) 
 ,model_year          NUMBER        
 ,mileage             NUMBER
 ,owner_id            NUMBER
 ,service_status      NUMBER
 ,last_serviced       DATE           
 ,mod_user            varchar2(300)
 ,registered          timestamp      
 ,last_modfied        timestamp      
 ,DML_FLAG            varchar2(1)
 ,VERSION             number
) 
TABLESPACE users;


COMMENT ON TABLE car_h IS 'Aut�k History t�bla';
COMMENT ON COLUMN car_h.brand IS 'M�rka';
COMMENT ON COLUMN car_h.model_type IS 'Modell';
COMMENT ON COLUMN car_h.model_year IS '�vj�rat';
COMMENT ON COLUMN car_h.mileage IS 'Kil�m�ter�ra �ll�sa';
COMMENT ON COLUMN car_h.service_status IS 'Szerviz �llapota';
  
PROMPT Done.
