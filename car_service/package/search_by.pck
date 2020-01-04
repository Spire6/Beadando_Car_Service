CREATE OR REPLACE PACKAGE search_by IS

  FUNCTION plate_search(p_plate IN VARCHAR2) RETURN VARCHAR2;

  FUNCTION person_search(p_first_name IN VARCHAR2
                        ,p_last_name  IN VARCHAR2) RETURN VARCHAR2;

  FUNCTION plate_search_service(p_plate IN VARCHAR2) RETURN ty_service_list;

END search_by;
/
CREATE OR REPLACE PACKAGE BODY search_by IS

  FUNCTION plate_search(p_plate IN VARCHAR2) RETURN VARCHAR2 IS
    v_car VARCHAR2(100);
    ex_error EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_error, -20000);
  BEGIN
  
    BEGIN
      SELECT c.brand || ' ' || c.model_type || ' - ' || p.last_name || ' ' ||
             p.first_name
        INTO v_car
        FROM car c
       INNER JOIN person p
          ON c.owner_id = p.person_id
       WHERE c.license_plate = p_plate;
    EXCEPTION
      WHEN no_data_found THEN
        RAISE ex_error;
    END;
  
    RETURN v_car;
  END;



  FUNCTION person_search(p_first_name IN VARCHAR2
                        ,p_last_name  IN VARCHAR2) RETURN VARCHAR2 IS
    v_contact VARCHAR2(100);
    ex_error EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_error, -20000);
  BEGIN
    
    BEGIN
      SELECT p.first_name || ' ' || p.last_name || ',  ' || p.email || ',  ' ||
             p.phone
        INTO v_contact
        FROM person p
       WHERE p.first_name = p_first_name
         AND p.last_name = p_last_name;
    EXCEPTION
      WHEN no_data_found THEN
        RAISE ex_error;
    END;
    
    RETURN v_contact;
  END;



  FUNCTION plate_search_service(p_plate IN VARCHAR2) RETURN ty_service_list IS
     v_list ty_service_list;
     ex_error EXCEPTION;
     PRAGMA EXCEPTION_INIT(ex_error, -20000);
   BEGIN
    
     BEGIN
      SELECT ty_service(cc.car_id, cc.service_name, cc.date_of_service)  
        BULK COLLECT
        INTO v_list
        FROM car c, table(c.list_of_service) cc
        WHERE c.license_plate = p_plate; 
     EXCEPTION
        WHEN NO_DATA_FOUND THEN
          RAISE ex_error;
     END;
   
    RETURN v_list;
   END;

END search_by;
/
