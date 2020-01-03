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
                   ,p_owner_id      IN NUMBER
                   ,p_last_serviced IN DATE);

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
    WHEN OTHERS THEN
      RAISE ex_error;
  END new_person;

  PROCEDURE new_car(p_license_plate IN VARCHAR2
                   ,p_brand         IN VARCHAR2
                   ,p_model_type    IN VARCHAR2
                   ,p_model_year    IN NUMBER
                   ,p_mileage       IN NUMBER
                   ,p_owner_id      IN NUMBER
                   ,p_last_serviced IN DATE) IS
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
      ,p_last_serviced);
  
  EXCEPTION
    WHEN OTHERS THEN
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
      ,(SELECT C.OWNER_ID FROM CAR C WHERE C.CAR_ID = p_car_id)
      ,p_waiting_time
      ,p_price
      ,p_part_id);
  
  EXCEPTION
    WHEN OTHERS THEN
      RAISE ex_error;
  END;

END add_new;
/
