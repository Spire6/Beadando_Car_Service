CREATE OR REPLACE TRIGGER service_trg
  BEFORE INSERT OR UPDATE ON service
  FOR EACH ROW
BEGIN

  :new.last_modfied := SYSDATE;
  :new.mod_user     := sys_context('USERENV', 'OS_USER');

  IF inserting
  THEN
  
    IF :new.service_id IS NULL
    THEN
      :new.service_id := service_id_seq.nextval;
    END IF;
  
    :new.registered := SYSDATE;
    :new.dml_flag   := 'I';
    :new.version    := 1;
  -----------
    INSERT INTO THE (SELECT c.list_of_service FROM car c WHERE c.car_id = :new.car_id)
      VALUES (ty_service(:new.car_id, :new.service_name, :new.date_of_service));
  
  ELSIF updating
  THEN
    :new.dml_flag := 'U';
    :new.version  := :old.version + 1;      
  END IF;

END service_trg;
/
