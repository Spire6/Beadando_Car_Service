
PROMPT Creating table person...

CREATE TABLE person(
  person_id           NUMBER         NOT NULL
 ,first_name          VARCHAR2(40)   NOT NULL
 ,last_name           VARCHAR2(40)   NOT NULL
 ,birth_date          DATE           
 ,city                VARCHAR2(100)
 ,address             VARCHAR2(100)
 ,phone               VARCHAR2(12)   NOT NULL
 ,email               VARCHAR2(100)
 ,number_of_services  NUMBER(5)		 DEFAULT 0
 ,discount            NUMBER(2)      DEFAULT 0
 ,mod_user            varchar2(300)
 ,registered          DATE           NOT NULL
 ,last_modfied        DATE           NOT NULL
 ,DML_FLAG            varchar2(1)    
 ,VERSION             number
) 
TABLESPACE users;

    
COMMENT ON TABLE person IS 'Személyek tábla';
COMMENT ON COLUMN person.person_id IS 'Személy ID';
COMMENT ON COLUMN person.first_name IS 'Keresztnév';
COMMENT ON COLUMN person.last_name IS 'Vezetéknév';
COMMENT ON COLUMN person.birth_date IS 'Születési dátum';
COMMENT ON COLUMN person.city IS 'Város';
COMMENT ON COLUMN person.address IS 'Cím';
COMMENT ON COLUMN person.phone IS 'Telefon';
COMMENT ON COLUMN person.email IS 'E-mail';
COMMENT ON COLUMN person.number_of_services IS 'Szervizelések száma';
COMMENT ON COLUMN person.discount IS 'Kedvezmény (%)';
COMMENT ON COLUMN person.mod_user IS 'Módosító felhasználó';
COMMENT ON COLUMN person.registered IS 'Regisztráció dátuma';
COMMENT ON COLUMN person.last_modfied IS 'Utolsó módosítás dátuma';
COMMENT ON COLUMN person.DML_FLAG IS 'DML flag';
COMMENT ON COLUMN person.version IS 'Verzió';

 
PROMPT Done.
