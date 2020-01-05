CREATE OR REPLACE PACKAGE change_car IS

  PROCEDURE car_change_owner(p_car_plate            IN VARCHAR2
                            ,p_new_owner_first_name IN VARCHAR2
                            ,p_new_owner_last_name  IN VARCHAR2);

END change_car;
/
CREATE OR REPLACE PACKAGE BODY change_car IS

  PROCEDURE car_change_owner(p_car_plate            IN VARCHAR2
                            ,p_new_owner_first_name IN VARCHAR2
                            ,p_new_owner_last_name  IN VARCHAR2) IS
  
    original_owner_name VARCHAR2(20);
    new_owner_id        NUMBER;
    plate_not_found_ex EXCEPTION;
    PRAGMA EXCEPTION_INIT(plate_not_found_ex, -20000);
  BEGIN
    BEGIN
      SELECT p.person_id
        INTO new_owner_id
        FROM person p
       WHERE p.first_name = p_new_owner_first_name
         AND p.last_name = p_new_owner_last_name;
    
      SELECT p.first_name || ' ' || p.last_name
        INTO original_owner_name
        FROM car c
       INNER JOIN person p
          ON c.owner_id = p.person_id
       WHERE c.license_plate = p_car_plate;
    
    EXCEPTION
      WHEN no_data_found THEN
        error_log_pck.err_log(p_err_message => dbms_utility.format_error_backtrace,
                              p_err_value   => 'p_car_plate = ' ||
                                               p_car_plate,
                              p_api         => 'change_car.car_change_owner');
        RAISE plate_not_found_ex;
      WHEN too_many_rows THEN
        error_log_pck.err_log(p_err_message => dbms_utility.format_error_backtrace,
                              p_err_value   => 'p_car_plate = ' ||
                                               p_car_plate,
                              p_api         => 'change_car.car_change_owner');
        RAISE plate_not_found_ex;
      WHEN OTHERS THEN
        error_log_pck.err_log(p_err_message => dbms_utility.format_error_backtrace,
                              p_err_value   => 'p_car_plate = ' ||
                                               p_car_plate,
                              p_api         => 'change_car.car_change_owner');
        RAISE plate_not_found_ex;
    END;
  
    UPDATE car c
       SET c.owner_id = new_owner_id
     WHERE c.license_plate = p_car_plate;
  
    INSERT INTO car_owner_h
      (car_license_plate
      ,new_owner
      ,old_owner)
    VALUES
      (p_car_plate
      ,p_new_owner_first_name || ' ' || p_new_owner_last_name
      ,original_owner_name);
  
  EXCEPTION
    WHEN no_data_found THEN
      error_log_pck.err_log(p_err_message => dbms_utility.format_error_backtrace,
                            p_err_value   => 'p_car_plate = ' || p_car_plate,
                            p_api         => 'change_car.car_change_owner');
      RAISE plate_not_found_ex;
    WHEN too_many_rows THEN
      error_log_pck.err_log(p_err_message => dbms_utility.format_error_backtrace,
                            p_err_value   => 'p_car_plate = ' || p_car_plate,
                            p_api         => 'change_car.car_change_owner');
      RAISE plate_not_found_ex;
    WHEN OTHERS THEN
      error_log_pck.err_log(p_err_message => dbms_utility.format_error_backtrace,
                            p_err_value   => 'p_car_plate = ' || p_car_plate,
                            p_api         => 'change_car.car_change_owner');
      RAISE plate_not_found_ex;
  END;

END change_car;
/
