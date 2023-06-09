alter session set "_ORACLE_SCRIPT"=true;
-- création tablespace où sont stockées les données des sites Cergy et Pau
CREATE TABLESPACE stockageCergy
    DATAFILE 'stockageCergy_data.dbf'
    SIZE 100m;

CREATE TABLESPACE stockagePau
    DATAFILE 'stockagePau_data.dbf'
    SIZE 100m;

-- création des sites Cergy et Pau : émulé par 2 utilisateurs
CREATE USER Cergy
    IDENTIFIED BY Cergy
    DEFAULT TABLESPACE stockageCergy;

CREATE USER Pau
    IDENTIFIED BY Pau
    DEFAULT TABLESPACE stockagePau;

CREATE ROLE super_admin;
GRANT CREATE DATABASE LINK, CREATE SEQUENCE, CREATE TRIGGER, CREATE PROCEDURE, CREATE SESSION, CREATE VIEW, DROP USER, DROP TABLESPACE, CREATE ANY TABLE TO super_admin;
GRANT super_admin TO Cergy;

CREATE ROLE local_admin;
GRANT CREATE SEQUENCE, CREATE TRIGGER, CREATE PROCEDURE, CREATE SESSION, CREATE VIEW, CREATE ANY TABLE TO local_admin;
GRANT local_admin TO Pau;

ALTER USER Cergy quota unlimited on stockageCergy;
ALTER USER Pau quota unlimited on stockagePau;