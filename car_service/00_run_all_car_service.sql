
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





-- PROMPT Creating types...


-- PROMPT Creating packages...


-- PROMPT Creating tiggers...


-- recompile. recompile utáni hiba esetén kivétel dobása javasolt
