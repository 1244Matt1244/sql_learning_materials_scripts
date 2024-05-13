DROP USER SCOTT CASCADE;
-- DROP USER ADAMS CASCADE;
-- DROP USER JONES CASCADE;
-- DROP USER CLARK CASCADE;
-- DROP USER BLAKE CASCADE;
CREATE USER scott identified by tiger;
GRANT connect to scott;
alter user scott default tablespace USERS temporary tablespace TEMP;
alter user scott QUOTA  UNLIMITED ON USERS;
GRANT CREATE SESSION TO scott;
GRANT CREATE VIEW TO scott;
GRANT CREATE TABLE TO scott;
GRANT CREATE SYNONYM TO scott;
GRANT CREATE TRIGGER TO scott;
GRANT CREATE SEQUENCE TO scott;
GRANT CREATE PROCEDURE TO scott;
-- GRANT CONNECT TO ADAMS IDENTIFIED BY WOOD;
-- GRANT CONNECT TO JONES IDENTIFIED BY STEEL;
-- GRANT CONNECT TO CLARK IDENTIFIED BY CLOTH;
-- GRANT CONNECT TO BLAKE IDENTIFIED BY PAPER;
DISCONNECT;
prompt =============================================================================
prompt Redom pustiti skripte prijavljen kao user scott ( connect scott/passwd@baza )
prompt =============================================================================
prompt SET TERMOUT OFF
prompt @demobld
prompt @hr_cre
prompt @hr_popul
prompt @oe_cre
prompt @oe_p_cat 
prompt @oe_p_pi
prompt @oe_p_cus 
prompt @oe_p_ord
prompt @oe_p_itm

