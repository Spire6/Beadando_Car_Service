CREATE OR REPLACE PACKAGE error_log_pck IS

  PROCEDURE err_log(p_err_message VARCHAR2
                   ,p_err_value   VARCHAR2
                   ,p_api         VARCHAR2);

END error_log_pck;
/
CREATE OR REPLACE PACKAGE BODY error_log_pck IS

  PROCEDURE err_log(p_err_message VARCHAR2
                   ,p_err_value   VARCHAR2
                   ,p_api         VARCHAR2) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    INSERT INTO error_log
      (err_id
      ,err_message
      ,err_value
      ,api)
    VALUES
      (err_seq.nextval
      ,p_err_message
      ,p_err_value
      ,p_api);
  
    COMMIT;
  
  END err_log;

END error_log_pck;
/
