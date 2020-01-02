CREATE OR REPLACE TRIGGER service_status_trg
  BEFORE INSERT OR UPDATE ON service_status
  FOR EACH ROW
BEGIN
  
  :new.last_modfied := SYSDATE;
  :new.mod_user     := sys_context('USERENV', 'OS_USER');

  IF inserting
  THEN
    :new.registered := SYSDATE;
    :new.dml_flag   := 'I';
    :new.version    := 1;
  
  ELSIF updating
  THEN
    :new.dml_flag := 'U';
    :new.version  := :old.version + 1;      
  END IF;

END service_status_trg;
/
