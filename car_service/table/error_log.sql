
PROMPT Creating table car...

CREATE TABLE error_log(
  err_id          number,
  err_time        timestamp default sysdate,
  err_message     varchar2(4000),
  err_value       varchar2(4000),
  api             varchar2(100)
)
TABLESPACE users;
   
COMMENT ON TABLE error_log IS 'Error_log tábla';

PROMPT Done
