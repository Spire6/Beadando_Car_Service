
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


PROMPT Creating Types...
 @./type/ty_service.typ
 @./type/ty_service_list.tps
 @./type/car_list_of_service.sql 
Prompt Done
 
PROMPT Creating Views
 @./view/views.sql
PROMPT Done

-- PROMPT Creating Packages...
 @./package/add_new.pck
 @./package/change_status.pck
 @./package/search_by.pck


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
 @./table/alter/car_list_of_services.sql
PROMPT Done


PROMPT Recompile...
DECLARE
 ex_error exception;
 pragma exception_init(ex_error, -20001);
BEGIN
  
   dbms_utility.compile_schema('CAR_MANAGER');
-- raise_application_error( -20001, 'Hiba t�rt�nt a telep�t�s k�zben.' );
EXCEPTION 
  WHEN OTHERS THEN
     RAISE ex_error;
END;
/
