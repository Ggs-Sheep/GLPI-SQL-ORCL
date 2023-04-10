CREATE OR REPLACE PROCEDURE create_user(
  p_username IN VARCHAR2,
  p_password IN VARCHAR2,
  p_default_tablespace IN VARCHAR2,
  p_temporary_tablespace IN VARCHAR2)
IS
BEGIN
  EXECUTE IMMEDIATE 'CREATE USER ' || p_username || ' IDENTIFIED BY ' || p_password ||
                    ' DEFAULT TABLESPACE ' || p_default_tablespace || ' TEMPORARY TABLESPACE ' || p_temporary_tablespace;
END;
/

CREATE OR REPLACE PROCEDURE update_utilisateur(
    p_id_utilisateur IN NUMBER,
    p_nom_utilisateur IN VARCHAR2,
    p_prenom_utilisateur IN VARCHAR2,
    p_email_utilisateur IN VARCHAR2
)
AS
BEGIN
    UPDATE Utilisateurs
    SET nom = p_nom_utilisateur,
        prenom = p_prenom_utilisateur,
        email = p_email_utilisateur
    WHERE id_utilisateur = p_id_utilisateur;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Utilisateurs updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error updating Utilisateurs: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE update_materiel(
    p_id_materiel IN Materiel.id_materiel%TYPE,
    p_type_materiel IN Materiel.type_materiel%TYPE,
    p_date_achat IN Materiel.date_achat%TYPE,
    p_date_garantie IN Materiel.date_garantie%TYPE,
    p_date_fin_vie IN Materiel.date_fin_vie%TYPE,
    p_etat_materiel IN Materiel.etat_materiel%TYPE
)
IS
BEGIN
    UPDATE Materiel SET
        type_materiel = p_type_materiel,
        date_achat = p_date_achat,
        date_garantie = p_date_garantie,
        date_fin_vie = p_date_fin_vie,
        etat_materiel = p_etat_materiel
    WHERE id_materiel = p_id_materiel;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Materiel updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error updating Materiel: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_logiciel(
    p_id_logiciel IN Logiciels.id_logiciel%TYPE,
    p_nom_logiciel IN Logiciels.nom_logiciel%TYPE,
    p_type_logiciel IN Logiciels.type_logiciel%TYPE,
    p_version IN Logiciels.version%TYPE,
    p_date_achat IN Logiciels.date_achat%TYPE,
    p_date_fin_support IN Logiciels.date_fin_support%TYPE
)
IS
BEGIN
    UPDATE Logiciels SET
        nom_logiciel = p_nom_logiciel,
        type_logiciel = p_type_logiciel,
        version = p_version,
        date_achat = p_date_achat,
        date_fin_support = p_date_fin_support
    WHERE id_logiciel = p_id_logiciel;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Logiciels updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error updating Logiciels: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_ticket(
    p_id_ticket IN Tickets.id_ticket%TYPE,
    p_titre IN Tickets.titre%TYPE,
    p_description IN Tickets.description%TYPE,
    p_date_creation IN Tickets.date_creation%TYPE,
    p_date_modification IN Tickets.date_modification%TYPE,
    p_date_cloture IN Tickets.date_cloture%TYPE,
    p_etat_ticket IN Tickets.etat_ticket%TYPE,
    p_site IN Tickets.site%TYPE,
    p_projet_id IN Tickets.projet_id%TYPE
)
IS
BEGIN
    UPDATE Tickets SET
        titre = p_titre,
        description = p_description,
        date_creation = p_date_creation,
        date_modification = p_date_modification,
        date_cloture = p_date_cloture,
        etat_ticket = p_etat_ticket,
        site = p_site,
        projet_id = p_projet_id
    WHERE id_ticket = p_id_ticket;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Tickets updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error updating Tickets: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_projet(
    p_id_projet IN Projet.id_projet%TYPE,
    p_nom_projet IN Projet.nom_projet%TYPE,
    p_description IN Projet.description%TYPE,
    p_date_modification IN Projet.date_modification%TYPE,
    p_etat_projet IN Projet.etat_projet%TYPE,
    p_site IN Projet.site%TYPE
)
IS
BEGIN
    UPDATE Projet
    SET nom_projet = p_nom_projet,
        description = p_description,
        date_modification = p_date_modification,
        etat_projet = p_etat_projet,
        site = p_site
    WHERE id_projet = p_id_projet;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Projet updated successfully');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error updating projet: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE creer_ticket(
    p_titre IN VARCHAR2,
    p_description IN VARCHAR2,
    p_site IN VARCHAR2,
    p_projet_id IN NUMBER
)
AS
    v_id_ticket NUMBER;
BEGIN
    SELECT MAX(id_ticket) + 1 INTO v_id_ticket FROM Tickets;

    INSERT INTO Tickets (
        id_ticket,
        titre,
        description,
        date_creation,
        date_modification,
        date_cloture,
        etat_ticket,
        site,
        projet_id
    ) VALUES (
        v_id_ticket,
        p_titre,
        p_description,
        SYSDATE,
        SYSDATE,
        NULL,
        'Ouvert',
        p_site,
        p_projet_id
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Ticket créé avec succès.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);
        ROLLBACK;
END;

