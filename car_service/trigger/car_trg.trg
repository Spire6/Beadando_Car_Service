CREATE OR REPLACE TRIGGER car_trg
  BEFORE INSERT OR UPDATE ON car
  FOR EACH ROW
BEGIN
  
  :new.last_modfied := SYSDATE;
  :new.mod_user     := sys_context('USERENV', 'OS_USER');

  IF inserting
  THEN
  
    IF :new.car_id IS NULL
    THEN
      :new.car_id := car_id_seq.nextval;
    END IF;
  
    :new.registered := SYSDATE;
    :new.dml_flag   := 'I';
    :new.version    := 1; 
    
    :new.list_of_service := ty_service_list(ty_service(:new.car_id, 'Regisztráció', TRUNC(SYSDATE))); 
    
  
  ELSIF updating
  THEN
    :new.dml_flag := 'U';
    :new.version  := :old.version + 1;      
  END IF;

END car_trg;
/
