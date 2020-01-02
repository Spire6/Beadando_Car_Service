CREATE OR REPLACE TRIGGER service_trg_h
  AFTER INSERT OR UPDATE OR DELETE ON service
  FOR EACH ROW
BEGIN

  IF deleting
  THEN
    INSERT INTO service_h
      (service_id
      ,service_name
      ,car_id
      ,owner_id
      ,waiting_time
      ,price
      ,part_id
      ,date_of_service
      ,mod_user
      ,registered
      ,last_modfied
      ,dml_flag
      ,version)
    VALUES
      (:old.service_id
      ,:old.service_name
      ,:old.car_id
      ,:old.owner_id
      ,:old.waiting_time
      ,:old.price
      ,:old.part_id
      ,:old.date_of_service
      ,sys_context('USERENV', 'OS_USER')
      ,:old.registered
      ,SYSDATE
      ,'D'
      ,:old.version + 1);
  
  ELSE
    INSERT INTO service_h
      (service_id
      ,service_name
      ,car_id
      ,owner_id
      ,waiting_time
      ,price
      ,part_id
      ,date_of_service
      ,mod_user
      ,registered
      ,last_modfied
      ,dml_flag
      ,version)
    VALUES
      (:new.service_id
      ,:new.service_name
      ,:new.car_id
      ,:new.owner_id
      ,:new.waiting_time
      ,:new.price
      ,:new.part_id
      ,:new.date_of_service
      ,:new.mod_user
      ,:new.registered
      ,:new.last_modfied
      ,:new.dml_flag
      ,:new.version);
  
  END IF;

END service_trg_h;
/
