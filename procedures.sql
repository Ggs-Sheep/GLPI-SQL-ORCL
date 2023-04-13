CREATE OR REPLACE PROCEDURE supprimer_materiels_hors_service
IS
BEGIN
  DELETE FROM Materiel
  WHERE etat_materiel = 'hors service'
  AND date_fin_vie > ADD_MONTHS(SYSDATE, -1);

  COMMIT;
END;

CREATE OR REPLACE PROCEDURE passer_revision IS
    mois_avant DATE;
BEGIN
    mois_avant := ADD_MONTHS(SYSDATE, 1);
    UPDATE Materiel SET etat_materiel = 'en revision' WHERE date_garantie < mois_avant;
END;

-- Procédure d'ajout d'un nouveau matériel
CREATE OR REPLACE PROCEDURE AjoutMateriel (
    type_materiel IN materiel.type_materiel%TYPE,
    date_achat IN Materiel.date_achat%TYPE,
    date_garantie IN Materiel.date_garantie%TYPE,
    date_fin_vie IN Materiel.date_fin_vie%TYPE,
    etat_materiel IN Materiel.etat_materiel%TYPE
)
IS
BEGIN
    INSERT INTO Materiel (id_materiel, type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel)
    VALUES (seq_materiel.nextval, type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel);
    COMMIT;
END;

-- Procédure de modification d'un matériel existant
CREATE OR REPLACE PROCEDURE ModificationMateriel (
    id_materiel IN Materiel.id_materiel%TYPE,
    type_materiel IN Materiel.type_materiel%TYPE,
    date_achat IN Materiel.date_achat%TYPE,
    date_garantie IN Materiel.date_garantie%TYPE,
    date_fin_vie IN Materiel.date_fin_vie%TYPE,
    etat_materiel IN Materiel.etat_materiel%TYPE
)
IS
BEGIN
    UPDATE Materiel
    SET type_materiel = type_materiel,
        date_achat = date_achat,
        date_garantie = date_garantie,
        date_fin_vie = date_fin_vie,
        etat_materiel = etat_materiel
    WHERE id_materiel = id_materiel;
    COMMIT;
END;

-- Procédure de lecture d'un matériel
CREATE OR REPLACE PROCEDURE LectureMateriel (
    id_materiel IN Materiel.id_materiel%TYPE,
    type_materiel OUT Materiel.type_materiel%TYPE,
    date_achat OUT Materiel.date_achat%TYPE,
    date_garantie OUT Materiel.date_garantie%TYPE,
    date_fin_vie OUT Materiel.date_fin_vie%TYPE,
    etat_materiel OUT Materiel.etat_materiel%TYPE
)
IS
BEGIN
    SELECT type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel
    INTO type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel
    FROM Materiel
    WHERE id_materiel = id_materiel;
END;

-- Procédure de suppression d'un matériel
CREATE OR REPLACE PROCEDURE SuppressionMateriel (
    id_materiel IN Materiel.id_materiel%TYPE
)
IS
BEGIN
    DELETE FROM Materiel
    WHERE id_materiel = id_materiel;
    COMMIT;
END;

    CREATE OR REPLACE PROCEDURE AjoutTicket (
    p_titre IN VARCHAR2,
    p_description IN VARCHAR2,
    p_site IN VARCHAR2
) AS
    v_id_ticket NUMBER(10);
BEGIN
    SELECT MAX(id_ticket) + 1 INTO v_id_ticket FROM Ticket;

    IF v_id_ticket IS NULL THEN
        v_id_ticket := 1;
    END IF;

    INSERT INTO Ticket (id_ticket, titre, description, date_creation, date_modification, date_cloture, etat_ticket, site)
    VALUES (v_id_ticket, p_titre, p_description, SYSDATE, SYSDATE, NULL, 'ouvert', p_site);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE ModifTicket (
    p_id_ticket IN NUMBER,
    p_titre IN VARCHAR2,
    p_description IN VARCHAR2,
    p_site IN VARCHAR2
) AS
BEGIN
    UPDATE Ticket
    SET titre = p_titre,
        description = p_description,
        site = p_site,
        date_modification = SYSDATE
    WHERE id_ticket = p_id_ticket;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE ResoudreTicket (
    p_id_ticket IN NUMBER
) AS
BEGIN
    UPDATE Ticket
    SET etat_ticket = 'résolu',
        date_cloture = SYSDATE
    WHERE id_ticket = p_id_ticket;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE SupprTicket (
    p_id_ticket IN NUMBER
) AS
BEGIN
    DELETE FROM Ticket WHERE id_ticket = p_id_ticket;
    COMMIT;
END;



-- Procédure pour ajouter un logiciel
CREATE OR REPLACE PROCEDURE ajouter_logiciel (
    id_logiciel IN NUMBER,
    nom_logiciel IN VARCHAR2,
    type_logiciel IN VARCHAR2,
    version IN VARCHAR2,
    date_achat IN DATE,
    date_fin_support IN DATE
)
AS
BEGIN
    INSERT INTO Logiciel (id_logiciel, nom_logiciel, type_logiciel, version, date_achat, date_fin_support)
    VALUES (id_logiciel, nom_logiciel, type_logiciel, version, date_achat, date_fin_support);
END;

-- Procédure pour modifier un logiciel
CREATE OR REPLACE PROCEDURE modifier_logiciel (
    id_logiciel IN NUMBER,
    nom_logiciel IN VARCHAR2,
    type_logiciel IN VARCHAR2,
    version IN VARCHAR2,
    date_achat IN DATE,
    date_fin_support IN DATE
)
AS
BEGIN
    UPDATE Logiciel
    SET nom_logiciel = nom_logiciel,
        type_logiciel = type_logiciel,
        version = version,
        date_achat = date_achat,
        date_fin_support = date_fin_support
    WHERE id_logiciel = id_logiciel;
END;

-- Procédure pour supprimer un logiciel
CREATE OR REPLACE PROCEDURE supprimer_logiciel (
    id_logiciel IN NUMBER
)
AS
BEGIN
    DELETE FROM Logiciel WHERE id_logiciel = id_logiciel;
END;

