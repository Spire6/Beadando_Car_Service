
PROMPT Creating sequences
 @./sequence/sequences.sql
PROMPT Done


PROMPT Creating tables...
 @./table/car.sql
 @./table/person.sql
 @./table/service.sql
 @./table/part.sql
 @./table/service_status.sql
PROMPT Done


PROMPT Creating history tables...
 @./table/car_h.sql
 @./table/person_h.sql
 @./table/service_h.sql
 @./table/part_h.sql
 @./table/service_status_h.sql
PROMPT Done


-- PROMPT Creating types...


-- PROMPT Creating packages...


PROMPT Creating tiggers...
 @./trigger/person_trg.trg
 @./trigger/car_trg.trg
 @./trigger/service_trg.trg
 @./trigger/part_trg.trg
 @./trigger/service_status_trg.trg
PROMPT Done


PROMPT Loading sample data...
 @./table/data/service_status_data.sql
 @./table/data/part_data.sql
 @./table/data/person_data.sql
 @./table/data/car_data.sql
 @./table/data/service_data.sql
PROMPT Done


PROMPT Creating history tiggers...
 @./trigger/person_trg_h.trg
 @./trigger/car_trg_h.trg
 @./trigger/service_trg_h.trg
 @./trigger/part_trg_h.trg
 @./trigger/service_status_trg_h.trg
PROMPT Done


PROMPT Creating alters, Primary, Foreign keys...
 @./table/alter/alter.sql
PROMPT Done


-- recompile. recompile utáni hiba esetén kivétel dobása javasolt
DECLARE
BEGIN
  dbms_utility.compile_schema('CAR_MANAGER');
END;
/
