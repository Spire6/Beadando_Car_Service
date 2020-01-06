
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

    
COMMENT ON TABLE person IS 'Szem�lyek t�bla';
COMMENT ON COLUMN person.person_id IS 'Szem�ly ID';
COMMENT ON COLUMN person.first_name IS 'Keresztn�v';
COMMENT ON COLUMN person.last_name IS 'Vezet�kn�v';
COMMENT ON COLUMN person.birth_date IS 'Sz�let�si d�tum';
COMMENT ON COLUMN person.city IS 'V�ros';
COMMENT ON COLUMN person.address IS 'C�m';
COMMENT ON COLUMN person.phone IS 'Telefon';
COMMENT ON COLUMN person.email IS 'E-mail';
COMMENT ON COLUMN person.number_of_services IS 'Szervizel�sek sz�ma';
COMMENT ON COLUMN person.discount IS 'Kedvezm�ny (%)';
COMMENT ON COLUMN person.mod_user IS 'M�dos�t� felhaszn�l�';
COMMENT ON COLUMN person.registered IS 'Regisztr�ci� d�tuma';
COMMENT ON COLUMN person.last_modfied IS 'Utols� m�dos�t�s d�tuma';
COMMENT ON COLUMN person.DML_FLAG IS 'DML flag';
COMMENT ON COLUMN person.version IS 'Verzi�';

 
PROMPT Done.
