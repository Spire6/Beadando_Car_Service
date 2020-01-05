CREATE OR REPLACE VIEW max_mileage_vw AS
SELECT * FROM 
  (SELECT c.license_plate
        ,c.brand || ' ' || c.model_type AS autó
        ,MAX(c.mileage) over(PARTITION BY c.license_plate) AS megtett_km    
        ,p.number_of_services AS Szervizek_száma
        ,p.last_name || ' ' || p.first_name as tulajdonos
        ,p.phone AS Telefonszám
        ,p.email AS Email
    FROM car c
    INNER JOIN person p ON c.owner_id = p.person_id
   ORDER BY megtett_km DESC) 
WHERE ROWNUM = 1;



CREATE OR REPLACE VIEW max_service_vw AS
SELECT * FROM 
  (SELECT c.license_plate
        ,c.brand || ' ' || c.model_type AS autó
        ,c.mileage AS megtett_km
        ,MAX(p.number_of_services) over(PARTITION BY c.license_plate) AS szervizek_szama
        ,p.last_name || ' ' || p.first_name as tulajdonos 
        ,p.phone AS Telefonszám
        ,p.email AS Email
    FROM car c
    INNER JOIN person p ON c.owner_id = p.person_id
   ORDER BY szervizek_szama DESC) 
WHERE ROWNUM = 1;



CREATE OR REPLACE VIEW in_the_service_vw AS
SELECT * FROM car c WHERE service_status != 0;



CREATE OR REPLACE VIEW service_history_vw AS
SELECT c.license_plate, cc.service_name, cc.date_of_service
FROM car c, table(c.list_of_service) cc;

