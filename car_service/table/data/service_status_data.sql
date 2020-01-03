PROMPT Loading service_status

INSERT INTO service_status(status_id, status_name) VALUES(0, '-' );
INSERT INTO service_status(status_id, status_name) VALUES(1, 'Várakozik' );
INSERT INTO service_status(status_id, status_name) VALUES(2, 'Szervizelés folyamatban' );
INSERT INTO service_status(status_id, status_name) VALUES(3, 'Kész. Fizetésre vár' );
INSERT INTO service_status(status_id, status_name) VALUES(4, 'Kifizetve' );

PROMPT Done.
