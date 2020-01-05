PROMPT Add service_list to car table...

 --ALTER TABLE car ADD (list_of_service ty_service_list) NESTED TABLE list_of_service STORE AS list_of_service_table;


UPDATE car c
  SET c.list_of_service = ty_service_list(ty_service(c.car_id, 'Regisztráció', TRUNC(SYSDATE)))
 WHERE c.list_of_service is NULL;


-- Delete --
-- ALTER TABLE car DROP COLUMN list_of_service;

/*
DECLARE
 v_list ty_service_list;
BEGIN
 SELECT ty_service(s.car_id, s.service_name, s.date_of_service)  
  BULK COLLECT
  INTO v_list
  FROM service s;
  
   for i in 1 .. v_list.count LOOP
              
       INSERT INTO THE
            (SELECT c.list_of_service FROM car c WHERE c.car_id = v_list(i).car_id)
          VALUES
             (ty_service(v_list(i).car_id, v_list(i).service_name, v_list(i).date_of_service));
        
    END LOOP;

END;
/
*/
PROMPT Done
