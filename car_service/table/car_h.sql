
PROMPT Creating table car_h...

CREATE TABLE car_h(
  car_id              NUMBER        
 ,license_plate       VARCHAR2(10)   
 ,brand               VARCHAR2(40)   
 ,model_type          VARCHAR2(40) 
 ,model_year          NUMBER(4)     
 ,mileage             NUMBER(6)
 ,owner_id            NUMBER
 ,service_status      NUMBER
 ,last_serviced       DATE           
 ,mod_user            varchar2(300)
 ,registered          DATE      
 ,last_modfied        DATE      
 ,DML_FLAG            varchar2(1)
 ,VERSION             number
) 
TABLESPACE users;


COMMENT ON TABLE car_h IS 'Autók History tábla';
COMMENT ON COLUMN car_h.brand IS 'Márka';
COMMENT ON COLUMN car_h.model_type IS 'Modell';
COMMENT ON COLUMN car_h.model_year IS 'Évjárat';
COMMENT ON COLUMN car_h.mileage IS 'Kilóméteróra állása';
COMMENT ON COLUMN car_h.service_status IS 'Szerviz állapota';
  
PROMPT Done.
