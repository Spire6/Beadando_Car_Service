
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

    
COMMENT ON TABLE part IS 'Alkatrészek tábla';
COMMENT ON COLUMN part.part_id IS 'Alkatrész ID';
COMMENT ON COLUMN part.part_name IS 'Alkatrész neve';
COMMENT ON COLUMN part.part_price IS 'Alkatrész ár/db';
COMMENT ON COLUMN part.weight IS 'Alkatrész súlya';
COMMENT ON COLUMN part.part_guarantee IS 'Garancia (hó)';
COMMENT ON COLUMN part.material IS 'Alkatrész anyaga';
COMMENT ON COLUMN part.mod_user IS 'Módosító felhasználó';
COMMENT ON COLUMN part.registered IS 'Regisztráció dátuma';
COMMENT ON COLUMN part.last_modfied IS 'Utolsó módosítás dátuma';
COMMENT ON COLUMN part.DML_FLAG IS 'DML flag';
COMMENT ON COLUMN part.version IS 'Verzió';

PROMPT Done.
