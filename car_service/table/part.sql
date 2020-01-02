
PROMPT Creating table part...

CREATE TABLE part(
  part_id           NUMBER         NOT NULL
 ,part_name         VARCHAR2(40)   NOT NULL
 ,part_price        NUMBER
 ,weight            NUMBER(5,2)
 ,part_guarantee    NUMBER
 ,material          VARCHAR2(20)
 ,mod_user            varchar2(300)
 ,registered          timestamp      NOT NULL
 ,last_modfied        timestamp      NOT NULL
 ,DML_FLAG            varchar2(1)
 ,VERSION             number
) 
TABLESPACE users;

    
COMMENT ON TABLE part IS 'Alkatrészek tábla';
COMMENT ON COLUMN part.part_price IS 'alkatrész ár/db';
COMMENT ON COLUMN part.weight IS 'alkatrész súlya';
COMMENT ON COLUMN part.part_guarantee IS 'garancia (hó)';
COMMENT ON COLUMN part.material IS 'alkatrész anyaga';

PROMPT Done.
