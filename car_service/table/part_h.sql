
PROMPT Creating table part_h...

CREATE TABLE part_h(
  part_id           NUMBER         
 ,part_name         VARCHAR2(40)   
 ,part_price        NUMBER(10)
 ,weight            NUMBER(5,2)
 ,part_guarantee    NUMBER(2)
 ,material          VARCHAR2(20)
 ,mod_user          varchar2(300)
 ,registered        DATE      
 ,last_modfied      DATE      
 ,DML_FLAG          varchar2(1)
 ,VERSION           number
)
TABLESPACE users;

COMMENT ON TABLE part_h IS 'Alkatrészek History tábla';
COMMENT ON COLUMN part_h.part_price IS 'alkatrész ár/db';
COMMENT ON COLUMN part_h.weight IS 'alkatrész súlya';
COMMENT ON COLUMN part_h.part_guarantee IS 'garancia (hó)';
COMMENT ON COLUMN part_h.material IS 'alkatrész anyaga';

PROMPT Done.
