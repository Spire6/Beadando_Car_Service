CREATE OR REPLACE TRIGGER person_trg
  BEFORE INSERT OR UPDATE ON person
  FOR EACH ROW
BEGIN

  :new.last_modfied := SYSDATE;
  :new.mod_user     := sys_context('USERENV', 'OS_USER');

  IF inserting
  THEN
  
    IF :new.person_id IS NULL
    THEN
      :new.person_id := person_id_seq.nextval;
    END IF;
  
    :new.registered := SYSDATE;
    :new.dml_flag   := 'I';
    :new.version    := 1;
  
  ELSIF updating
  THEN
    :new.dml_flag := 'U';
    :new.version  := :old.version + 1;      
  END IF;
  
  -- Kedvezmény(%)
  IF :new.number_of_services > 30
      THEN
      :new.discount := 15;
  ELSIF :new.number_of_services > 20
      THEN
      :new.discount := 10;
  ELSIF :new.number_of_services > 10
      THEN
      :new.discount := 5;    
  END IF;
  

END person_trg;
/
