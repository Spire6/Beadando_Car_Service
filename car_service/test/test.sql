SELECT * FROM SERVICE;
SELECT * FROM PERSON;
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
                     p_email      => 'vala@mi.he');
END;
/
SELECT * FROM person;



BEGIN
  add_new.new_car(p_license_plate => 'ABC-123',
                  p_brand         => 'toyota',
                  p_model_type    => 'próba',
                  p_model_year    => 1950,
                  p_mileage       => 77000,
                  p_owner_id      => 900,
                  p_last_serviced => TRUNC(SYSDATE));
END;
/
SELECT * FROM car;


BEGIN
  add_new.new_service(p_service_name => 'Teszt javítás',
                      p_car_id       => 500,
                      p_waiting_time => 25,
                      p_price        => 2200,
                      p_part_id      => 100);
END;
/
SELECT * FROM service;
---------------------------------------------------------------------------------------------------

BEGIN
  change_status.start_service(500);
END;
/
SELECT * FROM CAR;


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






