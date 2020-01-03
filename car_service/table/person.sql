
PROMPT Creating table person...

CREATE TABLE person(
  person_id           NUMBER         NOT NULL
 ,first_name          VARCHAR2(40)   NOT NULL
 ,last_name           VARCHAR2(40)   NOT NULL
 ,birth_date          DATE           NOT NULL
 ,city                VARCHAR2(100)
 ,address             VARCHAR2(100)
 ,phone               VARCHAR2(12)   NOT NULL
 ,email               VARCHAR2(100)
 ,number_of_services  NUMBER(5)
 ,discount            NUMBER(2)      DEFAULT 0
 ,mod_user            varchar2(300)
 ,registered          DATE           NOT NULL
 ,last_modfied        DATE           NOT NULL
 ,DML_FLAG            varchar2(1)    
 ,VERSION             number
) 
TABLESPACE users;

    
COMMENT ON TABLE person IS 'Személyek tábla';
COMMENT ON COLUMN person.number_of_services IS 'Szervizelések száma';
COMMENT ON COLUMN person.discount IS 'Kedvezmény (%)';
COMMENT ON COLUMN person.registered IS 'Regisztráció dátuma';
COMMENT ON COLUMN person.last_modfied IS 'Utólsó módosítás dátuma';
 
PROMPT Done.
