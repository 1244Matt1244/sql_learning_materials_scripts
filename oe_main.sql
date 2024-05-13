rem
rem Header: OE_main.sql 09-jan-01
rem
rem Copyright (c) 2001, 2004, Oracle. All rights reserved.  
rem
rem Owner  : ahunold
rem
rem NAME
rem   OE_main.sql - Main script for OE schema
rem
rem DESCRIPTON
rem   OE (Order Entry) is the Sample Schemas
rem   
rem NOTES
rem   Run as SYS or SYSTEM
rem
rem MODIFIED   (MM/DD/YY)
rem   pthornto  07/16/04 - obsolete 'connect' role 
rem   hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
rem   ahunold   08/28/01 - roles
rem   ahunold   07/13/01 - NLS Territory
rem   ahunold   04/13/01 - parameter 5, notes, spool
rem   ahunold   03/29/01 - spool
rem   ahunold   03/12/01 - prompts


SET ECHO OFF

REM Password for OE
DEFINE pass     = OE

REM tablespace for OE
DEFINE tbs      = users

REM Temporary table space for OE
DEFINE ttbs     = temp

REM Sys password
DEFINE pass_system = &&Sys_password


SPOOL OE_main_out.log

REM =======================================================
REM cleanup section
REM =======================================================


DROP USER OE CASCADE;


REM =======================================================
REM create user
REM three separate commands, so the create user command 
REM will succeed regardless of the existence of the 
REM DEMO and TEMP tablespaces 
REM =======================================================

CREATE USER OE IDENTIFIED BY &pass;

ALTER USER OE DEFAULT TABLESPACE &tbs
              QUOTA UNLIMITED ON &tbs;

ALTER USER OE TEMPORARY TABLESPACE &ttbs;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO OE;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE TO OE;

REM =======================================================
REM grants from sys schema
REM =======================================================

CONNECT system/&pass_system  AS SYSDBA;
GRANT execute ON sys.dbms_stats TO OE;

REM =======================================================
REM create OE schema objects
REM =======================================================

CONNECT OE/&pass
ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;

--
-- create tables, sequences and constraint
--

@oe_cre

-- 
-- populate tables
--

@oe_p_cat 

@oe_p_pi
 
@oe_p_cus 

@oe_p_ord
 
@oe_p_itm

spool off
