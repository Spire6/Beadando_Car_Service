CREATE OR REPLACE TRIGGER person_trg_h
  AFTER INSERT OR UPDATE OR DELETE ON person
  FOR EACH ROW
BEGIN

  IF deleting
  THEN
    INSERT INTO person_h
      (person_id
      ,first_name
      ,last_name
      ,birth_date
      ,city
      ,address
      ,phone
      ,email
      ,number_of_services
      ,discount
      ,mod_user
      ,registered
      ,last_modfied
      ,dml_flag
      ,version)
    VALUES
      (:old.person_id
      ,:old.first_name
      ,:old.last_name
      ,:old.birth_date
      ,:old.city
      ,:old.address
      ,:old.phone
      ,:old.email
      ,:old.number_of_services
      ,:old.discount
      ,sys_context('USERENV', 'OS_USER')
      ,:old.registered
      ,SYSDATE
      ,'D'
      ,:old.version + 1);
  
  ELSE
    INSERT INTO person_h
      (person_id
      ,first_name
      ,last_name
      ,birth_date
      ,city
      ,address
      ,phone
      ,email
      ,number_of_services
      ,discount
      ,mod_user
      ,registered
      ,last_modfied
      ,dml_flag
      ,version)
    VALUES
      (:new.person_id
      ,:new.first_name
      ,:new.last_name
      ,:new.birth_date
      ,:new.city
      ,:new.address
      ,:new.phone
      ,:new.email
      ,:new.number_of_services
      ,:new.discount
      ,:new.mod_user
      ,:new.registered
      ,:new.last_modfied
      ,:new.dml_flag
      ,:new.version);
  END IF;

END person_trg_h;
/
