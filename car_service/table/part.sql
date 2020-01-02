
PROMPT Creating table part...

CREATE TABLE part(
  part_id           NUMBER         NOT NULL
 ,part_name         VARCHAR2(40)   NOT NULL
 ,part_price        NUMBER
 ,weight            NUMBER(5,2)
 ,part_guarantee    NUMBER
 ,material          VARCHAR2(20)
 ,registered        DATE           DEFAULT SYSDATE NOT NULL
 ,last_modfied      DATE           DEFAULT SYSDATE NOT NULL
) 
TABLESPACE users;


ALTER TABLE part
  ADD CONSTRAINT part_pk PRIMARY KEY (part_id);
  
    
COMMENT ON TABLE part IS 'Alkatr�szek t�bla';
COMMENT ON COLUMN part.part_price IS 'alkatr�sz �r/db';
COMMENT ON COLUMN part.weight IS 'alkatr�sz s�lya';
COMMENT ON COLUMN part.part_guarantee IS 'garancia (h�)';
COMMENT ON COLUMN part.material IS 'alkatr�sz anyaga';

PROMPT Done.
