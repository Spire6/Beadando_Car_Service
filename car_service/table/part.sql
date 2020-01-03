
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
COMMENT ON COLUMN part.part_price IS 'alkatrész ár/db';
COMMENT ON COLUMN part.weight IS 'alkatrész súlya';
COMMENT ON COLUMN part.part_guarantee IS 'garancia (hó)';
COMMENT ON COLUMN part.material IS 'alkatrész anyaga';

PROMPT Done.
