CREATE OR REPLACE TRIGGER part_trg
  BEFORE INSERT OR UPDATE ON part
  FOR EACH ROW
BEGIN
  
  :new.last_modfied := SYSDATE;
  :new.mod_user     := sys_context('USERENV', 'OS_USER');

  IF inserting
  THEN
  
    IF :new.part_id IS NULL
    THEN
      :new.part_id := part_id_seq.nextval;
    END IF;
  
    :new.registered := SYSDATE;
    :new.dml_flag   := 'I';
    :new.version    := 1;
  
  ELSIF updating
  THEN
    :new.dml_flag := 'U';
    :new.version  := :old.version + 1;      
  END IF;

END part_trg;
/
