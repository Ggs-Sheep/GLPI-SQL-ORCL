alter session set "_ORACLE_SCRIPT"= true;

BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
            job_name => 'supprimer_materiel_hors_service',
            job_type => 'PLSQL_BLOCK',
            job_action => 'CREATE OR REPLACE PROCEDURE supprimer_materiels_hors_service
IS
BEGIN
  DELETE FROM Materiel
  WHERE etat_materiel = ''hors service''
  AND date_sortie < ADD_MONTHS(SYSDATE, -1);

  COMMIT;
END;',
            start_date => SYSTIMESTAMP,
            repeat_interval => 'FREQ=DAILY; BYHOUR=0; BYMINUTE=0; BYSECOND=0;',
            end_date => NULL,
            enabled => TRUE,
            comments => 'Description de votre job'
        );
END;

BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
            job_name => 'revision_materiel_garantie',
            job_type => 'PLSQL_BLOCK',
            job_action => 'CREATE OR REPLACE PROCEDURE passer_revision IS
    mois_avant DATE;
BEGIN
    mois_avant := ADD_MONTHS(SYSDATE, 1);
    UPDATE Materiel SET etat_materiel = ''en revision'' WHERE garantie < mois_avant;
END;',
            start_date => SYSTIMESTAMP,
            repeat_interval => 'FREQ=DAILY; BYHOUR=0; BYMINUTE=0; BYSECOND=0;',
            end_date => NULL,
            enabled => TRUE,
            comments => 'Description de votre job'
        );
END;