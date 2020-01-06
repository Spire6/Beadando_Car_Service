SELECT * FROM SERVICE;
SELECT * FROM PERSON;
SELECT * FROM PART;
SELECT * FROM SERVICE_STATUS;
SELECT * FROM CAR;
---------------------------------------------------------------------------------------------------
BEGIN
  add_new.new_person(p_first_name => 'teszt',
                     p_last_name  => 'adat',
                     p_birth_date => to_date('23-10-1996', 'dd-mm-yyyy'),
                     p_city       => 'próba',
                     p_address    => 'cim',
                     p_phone      => '+36209995555',
                     p_email      => 'valaki@mail.he');
END;
/
SELECT * FROM person;


BEGIN
  add_new.new_car(p_license_plate => 'ABC-123',
                  p_brand         => 'toyota',
                  p_model_type    => 'próba',
                  p_model_year    => 1996,
                  p_mileage       => 77000,
                  p_owner_id      => 900);
END;
/
SELECT * FROM car;


BEGIN
  add_new.new_service(p_service_name => 'Próba javítás',
                      p_car_id       => 500,
                      p_waiting_time => 25,
                      p_price        => 2200,
                      p_part_id      => 100);
END;
/
SELECT * FROM service;
SELECT * FROM car;

---------------------------------------------------------------------------------------------------

BEGIN
  change_status.start_service(500);
END;
/
SELECT * FROM CAR;
--Szervizek száma: SELECT * FROM person WHERE person_id=903;

BEGIN
  change_status.finish_service(500);
END;
/
SELECT * FROM CAR;


BEGIN
  change_status.pay_service(500);
END;
/
SELECT * FROM CAR;

---------------------------------------------------------------------------------------------------

SELECT search_by.plate_search('AFG-321') FROM dual;

SELECT search_by.plate_search_service(p_plate => 'PRT-629') AS service_history FROM dual;

SELECT search_by.person_search(p_first_name => 'Áron',
                               p_last_name  => 'Kovács') AS person_contact FROM dual;


---------------------------------------------------------------------------------------------------


SELECT * FROM max_mileage_vw;

SELECT * FROM max_service_vw;

SELECT * FROM service_history_vw v WHERE v.license_plate = 'PRT-629';


---------------------------------------------------------------------------------------------------

SELECT * FROM car c WHERE c.license_plate = 'DVF-342';   -- person_id 903 -> 913
SELECT * FROM person p WHERE p.person_id = '903' ;       -- István Baba -> Zsolt Bajnok

BEGIN
  change_car.car_change_owner(p_car_plate            => 'DVF-342' ,
                              p_new_owner_first_name => 'Zsolt',
                              p_new_owner_last_name  => 'Bajnok');
END;
/

SELECT * FROM car_owner_h;

SELECT * FROM error_log;

