alter session set "_ORACLE_SCRIPT"=true;

CREATE USER Cergy IDENTIFIED BY password;
GRANT CONNECT, RESOURCE TO Cergy;
CREATE TABLESPACE Cergy_TS
   DATAFILE 'cergy_tspace.dbf'
   SIZE 50m;
ALTER USER Cergy DEFAULT TABLESPACE Cergy_TS;
ALTER USER Cergy QUOTA UNLIMITED ON Cergy_TS;

CREATE USER Pau IDENTIFIED BY password;
GRANT CONNECT, RESOURCE TO Pau;
CREATE TABLESPACE Pau_TS
   DATAFILE 'pau_tspace.dbf'
   SIZE 50m;
ALTER USER Pau DEFAULT TABLESPACE Pau_TS;
ALTER USER Pau QUOTA UNLIMITED ON Pau_TS;