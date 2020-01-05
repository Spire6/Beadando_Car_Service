CREATE OR REPLACE PACKAGE add_new IS

  PROCEDURE new_person(p_first_name IN VARCHAR2
                      ,p_last_name  IN VARCHAR2
                      ,p_birth_date IN DATE
                      ,p_city       IN VARCHAR2
                      ,p_address    IN VARCHAR2
                      ,p_phone      IN VARCHAR2
                      ,p_email      IN VARCHAR2);

  PROCEDURE new_car(p_license_plate IN VARCHAR2
                   ,p_brand         IN VARCHAR2
                   ,p_model_type    IN VARCHAR2
                   ,p_model_year    IN NUMBER
                   ,p_mileage       IN NUMBER
                   ,p_owner_id      IN NUMBER);

  PROCEDURE new_service(p_service_name IN VARCHAR2
                       ,p_car_id       IN NUMBER
                       ,p_waiting_time IN NUMBER
                       ,p_price        IN NUMBER
                       ,p_part_id      IN NUMBER);

END add_new;
/
CREATE OR REPLACE PACKAGE BODY add_new IS

  PROCEDURE new_person(p_first_name IN VARCHAR2
                      ,p_last_name  IN VARCHAR2
                      ,p_birth_date IN DATE
                      ,p_city       IN VARCHAR2
                      ,p_address    IN VARCHAR2
                      ,p_phone      IN VARCHAR2
                      ,p_email      IN VARCHAR2) IS
    ex_error EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_error, -20000);
  BEGIN
    INSERT INTO person
      (first_name
      ,last_name
      ,birth_date
      ,city
      ,address
      ,phone
      ,email)
    VALUES
      (p_first_name
      ,p_last_name
      ,p_birth_date
      ,p_city
      ,p_address
      ,p_phone
      ,p_email);
  EXCEPTION
    WHEN no_data_found THEN
      error_log_pck.err_log(p_err_message => dbms_utility.format_error_backtrace,
                            p_err_value   => 'p_first_name = ' ||
                                             p_first_name || ' ' ||
                                             'p_last_name = ' || p_last_name || ' ' ||
                                             'p_phone = ' || p_phone,
                            p_api         => 'add_new.new_person');
      RAISE ex_error;
    WHEN OTHERS THEN
      error_log_pck.err_log(p_err_message => dbms_utility.format_error_backtrace,
                            p_err_value   => 'p_first_name = ' ||
                                             p_first_name || ' ' ||
                                             'p_last_name = ' || p_last_name || ' ' ||
                                             'p_phone = ' || p_phone,
                            p_api         => 'add_new.new_person');
      RAISE ex_error;
  END new_person;



  PROCEDURE new_car(p_license_plate IN VARCHAR2
                   ,p_brand         IN VARCHAR2
                   ,p_model_type    IN VARCHAR2
                   ,p_model_year    IN NUMBER
                   ,p_mileage       IN NUMBER
                   ,p_owner_id      IN NUMBER) IS
    ex_error EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_error, -20000);
  BEGIN
  
    INSERT INTO car
      (license_plate
      ,brand
      ,model_type
      ,model_year
      ,mileage
      ,owner_id
      ,last_serviced)
    VALUES
      (p_license_plate
      ,p_brand
      ,p_model_type
      ,p_model_year
      ,p_mileage
      ,p_owner_id
      ,trunc(SYSDATE));
  
  EXCEPTION
    WHEN no_data_found THEN
      error_log_pck.err_log(p_err_message => dbms_utility.format_error_backtrace,
                            p_err_value   => 'p_license_plate = ' ||
                                             p_license_plate || ' ' ||
                                             'p_model_year = ' ||
                                             p_model_year || ' ' ||
                                             'p_owner_id = ' || p_owner_id,
                            p_api         => 'add_new.new_car');
      RAISE ex_error;
    WHEN OTHERS THEN
      error_log_pck.err_log(p_err_message => dbms_utility.format_error_backtrace,
                            p_err_value   => 'p_license_plate = ' ||
                                             p_license_plate || ' ' ||
                                             'p_model_year = ' ||
                                             p_model_year || ' ' ||
                                             'p_owner_id = ' || p_owner_id,
                            p_api         => 'add_new.new_car');
      RAISE ex_error;
  END;



  PROCEDURE new_service(p_service_name IN VARCHAR2
                       ,p_car_id       IN NUMBER
                       ,p_waiting_time IN NUMBER
                       ,p_price        IN NUMBER
                       ,p_part_id      IN NUMBER) IS
    ex_error EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_error, -20000);
  BEGIN
  
    INSERT INTO service
      (service_name
      ,car_id
      ,owner_id
      ,waiting_time
      ,price
      ,part_id)
    VALUES
      (p_service_name
      ,p_car_id
      ,(SELECT c.owner_id FROM car c WHERE c.car_id = p_car_id)
      ,p_waiting_time
      ,p_price
      ,p_part_id);
  
  EXCEPTION
    WHEN no_data_found THEN
      error_log_pck.err_log(p_err_message => dbms_utility.format_error_backtrace,
                            p_err_value   => 'p_car_id = ' || p_car_id || ' ' ||
                                             'p_part_id = ' || p_part_id,
                            p_api         => 'add_new.new_service');
      RAISE ex_error;
    WHEN OTHERS THEN
      error_log_pck.err_log(p_err_message => dbms_utility.format_error_backtrace,
                            p_err_value   => 'p_car_id = ' || p_car_id || ' ' ||
                                             'p_part_id = ' || p_part_id,
                            p_api         => 'add_new.new_service');
      RAISE ex_error;
  END;

END add_new;
/
