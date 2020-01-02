CREATE OR REPLACE TRIGGER part_trg_h
  AFTER INSERT OR UPDATE OR DELETE ON part
  FOR EACH ROW
BEGIN

  IF deleting
  THEN
    INSERT INTO part_h
      (part_id
      ,part_name
      ,part_price
      ,weight
      ,part_guarantee
      ,material
      ,mod_user
      ,registered
      ,last_modfied
      ,dml_flag
      ,version)
    VALUES
      (:old.part_id
      ,:old.part_name
      ,:old.part_price
      ,:old.weight
      ,:old.part_guarantee
      ,:old.material
      ,sys_context('USERENV', 'OS_USER')
      ,:old.registered
      ,SYSDATE
      ,'D'
      ,:old.version + 1);
  
  ELSE
    INSERT INTO part_h
      (part_id
      ,part_name
      ,part_price
      ,weight
      ,part_guarantee
      ,material
      ,mod_user
      ,registered
      ,last_modfied
      ,dml_flag
      ,version)
    VALUES
      (:new.part_id
      ,:new.part_name
      ,:new.part_price
      ,:new.weight
      ,:new.part_guarantee
      ,:new.material
      ,:new.mod_user
      ,:new.registered
      ,:new.last_modfied
      ,:new.dml_flag
      ,:new.version);
  
  END IF;

END part_trg_h;
/
