CREATE TABLE car_owner_h(
        car_license_plate    VARCHAR2(7)
       ,new_owner            VARCHAR2(100)
       ,old_owner            VARCHAR2(100)
       ,tr_time              DATE DEFAULT SYSDATE           
)
TABLESPACE users;
       
COMMENT ON TABLE car_owner_h IS 'Autó tulajdonosok history tábla';
