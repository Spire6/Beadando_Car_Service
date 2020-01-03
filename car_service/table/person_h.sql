
PROMPT Creating table person_h...

CREATE TABLE person_h(
  person_id           NUMBER         
 ,first_name          VARCHAR2(40)   
 ,last_name           VARCHAR2(40)   
 ,birth_date          DATE           
 ,city                VARCHAR2(100)
 ,address             VARCHAR2(100)
 ,phone               VARCHAR2(12)   
 ,email               VARCHAR2(100)
 ,number_of_services  NUMBER(5)
 ,discount            NUMBER(2)
 ,mod_user            varchar2(300)
 ,registered          DATE     
 ,last_modfied        DATE     
 ,DML_FLAG            varchar2(1)    
 ,VERSION             number
) 
TABLESPACE users;

COMMENT ON TABLE person_h IS 'Szem�lyek History t�bla';
COMMENT ON COLUMN person_h.number_of_services IS 'Szervizel�sek sz�ma';
COMMENT ON COLUMN person_h.discount IS 'Kedvezm�ny (%)';
COMMENT ON COLUMN person_h.registered IS 'Regisztr�ci� d�tuma';
COMMENT ON COLUMN person_h.last_modfied IS 'Ut�ls� m�dos�t�s d�tuma';
 
PROMPT Done.
