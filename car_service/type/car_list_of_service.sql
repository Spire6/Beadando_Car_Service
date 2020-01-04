ALTER TABLE car ADD (list_of_service ty_service_list) NESTED TABLE list_of_service STORE AS list_of_service_table;

-- Delete --
-- ALTER TABLE car DROP COLUMN list_of_service;
