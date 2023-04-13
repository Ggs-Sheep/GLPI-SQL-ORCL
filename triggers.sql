CREATE OR REPLACE TRIGGER tr_utilisateur_unique_email
  BEFORE INSERT OR UPDATE ON Utilisateur
  FOR EACH ROW
BEGIN
  IF (:NEW.email IS NOT NULL) THEN
    IF (EXISTS(SELECT 1 FROM Utilisateur WHERE email = :NEW.email AND id_utilisateur != :NEW.id_utilisateur)) THEN
      RAISE_APPLICATION_ERROR(-20001, 'L''email doit être unique');
    END IF;
  END IF;
END;
/

CREATE OR REPLACE TRIGGER tr_date_materiel
BEFORE INSERT OR UPDATE ON Materiel
FOR EACH ROW
DECLARE
  v_current_date DATE;
BEGIN
  v_current_date := SYSDATE;

  IF :NEW.date_garantie >= :NEW.date_fin_vie THEN
    RAISE_APPLICATION_ERROR(-20001, 'La date de garantie doit être antérieure à la date de fin de vie.');
  END IF;
END;
/

