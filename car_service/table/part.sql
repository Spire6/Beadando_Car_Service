
PROMPT Creating table part...

CREATE TABLE part(
  part_id           NUMBER         NOT NULL
 ,part_name         VARCHAR2(40)   NOT NULL
 ,part_price        NUMBER(10)
 ,weight            NUMBER(5,2)
 ,part_guarantee    NUMBER(2)
 ,material          VARCHAR2(20)
 ,mod_user          varchar2(300)
 ,registered        DATE           NOT NULL
 ,last_modfied      DATE           NOT NULL
 ,DML_FLAG          varchar2(1)
 ,VERSION           number
) 
TABLESPACE users;

    
COMMENT ON TABLE part IS 'Alkatr�szek t�bla';
COMMENT ON COLUMN part.part_id IS 'Alkatr�sz ID';
COMMENT ON COLUMN part.part_name IS 'Alkatr�sz neve';
COMMENT ON COLUMN part.part_price IS 'Alkatr�sz �r/db';
COMMENT ON COLUMN part.weight IS 'Alkatr�sz s�lya';
COMMENT ON COLUMN part.part_guarantee IS 'Garancia (h�)';
COMMENT ON COLUMN part.material IS 'Alkatr�sz anyaga';
COMMENT ON COLUMN part.mod_user IS 'M�dos�t� felhaszn�l�';
COMMENT ON COLUMN part.registered IS 'Regisztr�ci� d�tuma';
COMMENT ON COLUMN part.last_modfied IS 'Utols� m�dos�t�s d�tuma';
COMMENT ON COLUMN part.DML_FLAG IS 'DML flag';
COMMENT ON COLUMN part.version IS 'Verzi�';

PROMPT Done.
