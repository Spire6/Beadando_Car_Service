CREATE OR REPLACE TRIGGER car_trg_h
  AFTER INSERT OR UPDATE OR DELETE ON car
  FOR EACH ROW
BEGIN
  
 IF deleting
   THEN
     INSERT INTO car_h(car_id,
                       license_plate,
                       brand,
                       model_type,
                       model_year,
                       mileage,
                       owner_id,
                       service_status,
                       last_serviced,
                       mod_user,
                       registered,
                       last_modfied,
                       dml_flag,
                       version)
                       VALUES(:old.car_id
                             ,:old.license_plate
                             ,:old.brand
                             ,:old.model_type
                             ,:old.model_year
                             ,:old.mileage
                             ,:old.owner_id
                             ,:old.service_status
                             ,:old.last_serviced
                             ,sys_context('USERENV', 'OS_USER')
                             ,:old.registered
                             ,SYSDATE
                             ,'D'
                             ,:old.version + 1);
                             
  ELSE
    INSERT INTO car_h(car_id,
                       license_plate,
                       brand,
                       model_type,
                       model_year,
                       mileage,
                       owner_id,
                       service_status,
                       last_serviced,
                       mod_user,
                       registered,
                       last_modfied,
                       dml_flag,
                       version)
                       VALUES(:new.car_id
                             ,:new.license_plate
                             ,:new.brand
                             ,:new.model_type
                             ,:new.model_year
                             ,:new.mileage
                             ,:new.owner_id
                             ,:new.service_status
                             ,:new.last_serviced
                             ,:new.mod_user
                             ,:new.registered
                             ,:new.last_modfied
                             ,:new.dml_flag
                             ,:new.version);
                             
   END IF;

END car_trg_h;
/
