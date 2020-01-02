CREATE OR REPLACE TRIGGER service_status_trg_h
  AFTER INSERT OR UPDATE OR DELETE ON service_status
  FOR EACH ROW
BEGIN

  IF deleting
  THEN
    INSERT INTO service_status_h
      (status_id
      ,status_name
      ,mod_user
      ,registered
      ,last_modfied
      ,dml_flag
      ,version)
    VALUES
      (:old.status_id
      ,:old.status_name
      ,sys_context('USERENV', 'OS_USER')
      ,:old.registered
      ,SYSDATE
      ,'D'
      ,:old.version + 1);
  
  ELSE
    INSERT INTO service_status_h
      (status_id
      ,status_name
      ,mod_user
      ,registered
      ,last_modfied
      ,dml_flag
      ,version)
    VALUES
      (:new.status_id
      ,:new.status_name
      ,:new.mod_user
      ,:new.registered
      ,:new.last_modfied
      ,:new.dml_flag
      ,:new.version);
  
  END IF;

END service_status_trg_h;
/
