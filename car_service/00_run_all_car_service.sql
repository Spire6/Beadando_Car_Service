
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


PROMPT Creating alters, Primary, Foreign keys...
 @./table/alter/alter.sql
PROMPT Done


PROMPT Creating sequences
 @./sequence/sequences.sql
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

PROMPT Creating history tiggers...
@./trigger/person_trg_h.trg
@./trigger/car_trg_h.trg
@./trigger/service_trg_h.trg
@./trigger/part_trg_h.trg
@./trigger/service_status_trg_h.trg
PROMPT Done


-- recompile. recompile utáni hiba esetén kivétel dobása javasolt
declare
begin
dbms_utility.compile_schema('CAR_MANAGER');
end;
/
