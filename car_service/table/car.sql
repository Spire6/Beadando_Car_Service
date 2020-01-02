
PROMPT Creating table car...

CREATE TABLE car(
  car_id              NUMBER         NOT NULL
 ,license_plate       VARCHAR2(10)   NOT NULL 
 ,brand               VARCHAR2(40)   NOT NULL 
 ,model_type          VARCHAR2(40)   NOT NULL
 ,model_year          NUMBER         NOT NULL
 ,mileage             NUMBER
 ,owner_id            NUMBER
 ,service_status      NUMBER
 ,last_serviced       DATE           
 ,mod_user            varchar2(300)
 ,registered          timestamp      NOT NULL
 ,last_modfied        timestamp      NOT NULL
 ,DML_FLAG            varchar2(1)
 ,VERSION             number
) 
TABLESPACE users;


COMMENT ON TABLE car IS 'Aut�k t�bla';
COMMENT ON COLUMN car.brand IS 'M�rka';
COMMENT ON COLUMN car.model_type IS 'Modell';
COMMENT ON COLUMN car.model_year IS '�vj�rat';
COMMENT ON COLUMN car.mileage IS 'Kil�m�ter�ra �ll�sa';
COMMENT ON COLUMN car.service_status IS 'Szerviz �llapota';
  
PROMPT Done.
