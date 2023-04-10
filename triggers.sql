CREATE OR REPLACE TRIGGER trig_insert_utilisateur
    BEFORE INSERT
    ON Utilisateurs
    FOR EACH ROW
BEGIN
    SELECT seq_utilisateur.NEXTVAL
    INTO :new.id_utilisateur
    FROM DUAL;
END;

CREATE OR REPLACE TRIGGER trig_insert_materiel
    BEFORE INSERT
    ON Materiel
    FOR EACH ROW
BEGIN
    SELECT seq_materiel.NEXTVAL
    INTO :new.id_materiel
    FROM DUAL;
END;

CREATE OR REPLACE TRIGGER trig_insert_logiciel
    BEFORE INSERT
    ON Logiciels
    FOR EACH ROW
BEGIN
    SELECT seq_logiciel.NEXTVAL
    INTO :new.id_logiciel
    FROM DUAL;
END;

CREATE OR REPLACE TRIGGER trig_insert_ticket
    BEFORE INSERT
    ON Tickets
    FOR EACH ROW
BEGIN
    SELECT seq_ticket.NEXTVAL
    INTO :new.id_ticket
    FROM DUAL;
END;

CREATE OR REPLACE TRIGGER trig_insert_projet
    BEFORE INSERT
    ON Projet
    FOR EACH ROW
BEGIN
    SELECT seq_projet.NEXTVAL
    INTO :new.id_projet
    FROM DUAL;
END;

CREATE OR REPLACE TRIGGER tr_insert_utilisateur
    BEFORE INSERT
    ON Utilisateurs
    FOR EACH ROW
DECLARE
    email_exist NUMBER;
BEGIN
    SELECT COUNT(*) INTO email_exist FROM Utilisateurs WHERE email = :NEW.email;
    IF email_exist > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cet email est déjà utilisé.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER tr_materiel_before_insert
BEFORE INSERT ON Materiel
FOR EACH ROW
DECLARE
    v_etat_materiel VARCHAR2(50);
BEGIN
    -- Récupérer l'état du matériel
    v_etat_materiel := :NEW.etat_materiel;

    -- Vérifier si l'état du matériel est valide
    IF v_etat_materiel NOT IN ('Bon état', 'Mauvais état', 'En réparation') THEN
        RAISE_APPLICATION_ERROR(-20001, 'L''état du matériel doit être "Bon état", "Mauvais état" ou "En réparation".');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_utilisateurs_upd
BEFORE UPDATE ON Utilisateurs
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Utilisateurs
    WHERE email = :new.email AND id_utilisateur != :old.id_utilisateur;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'L''email existe déjà pour un autre utilisateur.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER prevent_project_delete
BEFORE DELETE ON Projet
FOR EACH ROW
DECLARE
    v_ticket_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_ticket_count FROM Tickets WHERE projet_id = :OLD.projet_id AND etat != 'CLOTURE';
    IF v_ticket_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Impossible de supprimer ce projet car il contient des tickets non clôturés');
    END IF;
END;
/
