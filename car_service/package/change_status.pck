CREATE OR REPLACE PACKAGE change_status IS

  PROCEDURE start_service(p_car_id IN NUMBER);
  
  PROCEDURE finish_service(p_car_id IN NUMBER);
  
  PROCEDURE pay_service(p_car_id IN NUMBER);

END change_status;
/
CREATE OR REPLACE PACKAGE BODY change_status IS

  PROCEDURE start_service(p_car_id IN NUMBER) IS
    v_status_id NUMBER;
    ex_error EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_error, -20000);
  BEGIN
  
    SELECT c.service_status
      INTO v_status_id
      FROM car c
     WHERE c.car_id = p_car_id;
  
    IF v_status_id = 0
       OR v_status_id = 1
    THEN
      UPDATE car c SET c.service_status = 2 WHERE c.car_id = p_car_id;
    ELSE
      raise_application_error( -20001, 'Csak kinti(0) �s v�rakoz�(1) st�tusz aut�t lehet szervizelni!' );
    END IF;
  END;



  PROCEDURE finish_service(p_car_id IN NUMBER) IS
    v_status_id NUMBER;
    ex_error EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_error, -20000);
  BEGIN
  
    SELECT c.service_status
      INTO v_status_id
      FROM car c
     WHERE c.car_id = p_car_id;
  
    IF v_status_id = 2
    THEN
      UPDATE car c SET c.service_status = 3 WHERE c.car_id = p_car_id;
    ELSE
      raise_application_error(-20001, 'Csak Szervizel�s folyamatban(2) st�tusz aut�t lehet befejezni!');
    END IF; 
  END;
  
  
  PROCEDURE pay_service(p_car_id IN NUMBER) IS
    v_status_id NUMBER;
    ex_error EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_error, -20000);
  BEGIN
  
    SELECT c.service_status
      INTO v_status_id
      FROM car c
     WHERE c.car_id = p_car_id;
  
    IF v_status_id = 3
    THEN
      UPDATE car c SET c.service_status = 4 WHERE c.car_id = p_car_id;
    ELSE
      raise_application_error(-20001, 'Csak K�sz, Fizet�sre v�r(2) st�tusz aut�t lehet kifizetni!');
    END IF; 
  END;



END change_status;
/
