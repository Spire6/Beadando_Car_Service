
ALTER TABLE person
  ADD CONSTRAINT person_pk PRIMARY KEY (person_id);
  
ALTER TABLE car
  ADD CONSTRAINT car_pk PRIMARY KEY (car_id);
  
ALTER TABLE service
  ADD CONSTRAINT service_pk PRIMARY KEY (service_id);
  
ALTER TABLE part
  ADD CONSTRAINT part_pk PRIMARY KEY (part_id);
  

ALTER TABLE service_status
  ADD CONSTRAINT service_status_pk PRIMARY KEY (status_id);
  


ALTER TABLE car
  ADD CONSTRAINT car_person_fk FOREIGN KEY (owner_id) REFERENCES person(person_id);

ALTER TABLE service
  ADD CONSTRAINT service_car_fk FOREIGN KEY (car_id) REFERENCES car(car_id);

ALTER TABLE service
  ADD CONSTRAINT service_person_fk FOREIGN KEY (owner_id) REFERENCES person(person_id);
  
ALTER TABLE service
  ADD CONSTRAINT service_part_fk FOREIGN KEY (part_id) REFERENCES part(part_id);
  
ALTER TABLE car
  ADD CONSTRAINT car_service_status_fk FOREIGN KEY (service_status) REFERENCES service_status(status_id);



ALTER TABLE person
  ADD CONSTRAINT phone_uk UNIQUE (phone);
  
ALTER TABLE person
  ADD CONSTRAINT age_ck CHECK ((EXTRACT(YEAR FROM birth_date) ) < 2002);

ALTER TABLE car
  ADD CONSTRAINT car_license_plate_uk UNIQUE (license_plate);
  
ALTER TABLE car
  ADD CONSTRAINT car_license_plate_ck CHECK (LENGTH(license_plate) = 7 );
  
ALTER TABLE car
  ADD CONSTRAINT car_year_ck CHECK (model_year BETWEEN 1900 AND (EXTRACT(YEAR FROM registered)));
   
ALTER TABLE car
  ADD CONSTRAINT car_model_year_ck CHECK (model_year <= EXTRACT(YEAR FROM last_serviced) );


