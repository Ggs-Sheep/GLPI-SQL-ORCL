DECLARE
  v_nom VARCHAR2(100);
  v_prenom VARCHAR2(100);
  v_email VARCHAR2(100);
  v_type_utilisateur VARCHAR2(100);
BEGIN
  FOR i IN 1..50 LOOP
    v_nom := 'Nom' || i;
    v_prenom := 'Prenom' || i;
    v_email := 'email' || i || '@example.com';
    IF (DBMS_RANDOM.VALUE() < 0.7) THEN
      v_type_utilisateur := 'utilisateur';
    ELSE
      v_type_utilisateur := 'technicien';
    END IF;
    INSERT INTO Utilisateur (id_utilisateur, nom, prenom, email, type_utilisateur)
    VALUES (i, v_nom, v_prenom, v_email, v_type_utilisateur);
  END LOOP;
  COMMIT;
END;
/

DECLARE
  i NUMBER;
BEGIN
  FOR i IN 1..50 LOOP
    IF (DBMS_RANDOM.VALUE() < 0.6) THEN
      INSERT INTO Materiel (id_materiel, type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel)
      VALUES (i, 'ordinateur portable', SYSDATE-DBMS_RANDOM.VALUE(365,1095), SYSDATE+DBMS_RANDOM.VALUE(90,365), SYSDATE+DBMS_RANDOM.VALUE(1095,1825),
              CASE
                WHEN DBMS_RANDOM.VALUE() < 0.1 THEN 'en reparation'
                WHEN DBMS_RANDOM.VALUE() < 0.2 THEN 'hors service'
                WHEN DBMS_RANDOM.VALUE() < 0.3 THEN 'mauvais etat'
                WHEN DBMS_RANDOM.VALUE() < 0.6 THEN 'etat moyen'
                ELSE 'bon etat'
              END);
    ELSE
      INSERT INTO Materiel (id_materiel, type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel)
      VALUES (i,
              CASE
                WHEN DBMS_RANDOM.VALUE() < 0.4 THEN 'ordinateur fixe'
                WHEN DBMS_RANDOM.VALUE() < 0.6 THEN 'serveur'
                WHEN DBMS_RANDOM.VALUE() < 0.8 THEN 'imprimante'
                ELSE 'scanner'
              END,
              SYSDATE-DBMS_RANDOM.VALUE(365,1095), SYSDATE+DBMS_RANDOM.VALUE(90,365), SYSDATE+DBMS_RANDOM.VALUE(1095,1825),
              CASE
                WHEN DBMS_RANDOM.VALUE() < 0.1 THEN 'en reparation'
                WHEN DBMS_RANDOM.VALUE() < 0.2 THEN 'hors service'
                WHEN DBMS_RANDOM.VALUE() < 0.3 THEN 'mauvais etat'
                WHEN DBMS_RANDOM.VALUE() < 0.6 THEN 'etat moyen'
                ELSE 'bon etat'
              END);
    END IF;
  END LOOP;
  COMMIT;
END;
/

INSERT INTO Logiciel (id_logiciel, nom_logiciel, type_logiciel, version, date_achat, date_fin_support)
VALUES (1, 'Microsoft Word', 'Bureautique', '1.0.0', TO_DATE('2023-04-13', 'yyyy-mm-dd'), TO_DATE('2030-04-13', 'yyyy-mm-dd'));

INSERT INTO Logiciel (id_logiciel, nom_logiciel, type_logiciel, version, date_achat, date_fin_support)
VALUES (2, 'Visual Studio Code', 'Programmation', '2.1.0', TO_DATE('2022-01-01', 'yyyy-mm-dd'), TO_DATE('2032-01-01', 'yyyy-mm-dd'));

INSERT INTO Logiciel (id_logiciel, nom_logiciel, type_logiciel, version, date_achat, date_fin_support)
VALUES (3, 'Paint 3D', 'Graphisme', '3.5.2', TO_DATE('2022-03-15', 'yyyy-mm-dd'), TO_DATE('2030-03-15', 'yyyy-mm-dd'));


/*DECLARE
  v_nom_logiciel VARCHAR2(1000);
  v_type_logiciel VARCHAR2(100);
  v_version VARCHAR2(100);
  v_date_achat DATE;
  v_date_fin_support DATE;
BEGIN
  FOR i IN 1..50 LOOP
    v_nom_logiciel := CASE dbms_random.value(1, 3)
                          WHEN 1 THEN 'Microsoft Word'
                          WHEN 2 THEN 'Visual Studio Code'
                          ELSE 'Paint 3D'
                       END;
    v_type_logiciel := CASE dbms_random.value(1, 3)
                          WHEN 1 THEN 'Bureautique'
                          WHEN 2 THEN 'Graphisme'
                          ELSE 'Programmation'
                       END;
    v_version := TO_CHAR(dbms_random.value(1, 5)) || '.' || TO_CHAR(dbms_random.value(0, 9)) || '.' || TO_CHAR(dbms_random.value(0, 9));
    v_date_achat := TO_DATE('01/01/2010', 'dd/mm/yyyy') + dbms_random.value(1, 3000);
    v_date_fin_support := v_date_achat + dbms_random.value(365, 3650);

    INSERT INTO Logiciel(id_logiciel, nom_logiciel, type_logiciel, version, date_achat, date_fin_support)
    VALUES (i, v_nom_logiciel, v_type_logiciel, v_version, v_date_achat, v_date_fin_support);
  END LOOP;
END;
/*/

DECLARE
  v_titre            VARCHAR2(100);
  v_description      VARCHAR2(500);
  v_date_creation    DATE;
  v_date_modification DATE;
  v_date_cloture     DATE;
  v_etat_ticket      VARCHAR2(100);
  v_site             VARCHAR2(100);
BEGIN
  FOR i IN 1..50 LOOP
    -- Titre avec une probabilité de 70% pour "Problème" et 30% pour "Demande"
    IF (dbms_random.value <= 0.7) THEN
      v_titre := 'Problème';
    ELSE
      v_titre := 'Demande';
    END IF;
    v_titre := v_titre || ' ' || i;

    -- Description aléatoire
    v_description := 'Description ' || i;

    -- Date de création aléatoire entre le 1er janvier 2022 et aujourd'hui
    v_date_creation := TRUNC(SYSDATE - dbms_random.value(0, 365)) + dbms_random.value(1, 24) / 24;

    -- Date de modification aléatoire entre la date de création et aujourd'hui
    v_date_modification := v_date_creation + dbms_random.value(0, (SYSDATE - v_date_creation));

    -- Date de clôture aléatoire entre la date de création et la date de modification
    v_date_cloture := v_date_creation + dbms_random.value(0, (v_date_modification - v_date_creation));

    -- Etat du ticket avec une probabilité de 60% pour "Ouvert" et 40% pour "Fermé"
    IF (dbms_random.value <= 0.6) THEN
      v_etat_ticket := 'Ouvert';
    ELSE
      v_etat_ticket := 'Fermé';
    END IF;

    -- Site avec une probabilité de 80% pour "Batiment A" et 20% pour "Batiment B"
    IF (dbms_random.value <= 0.8) THEN
      v_site := 'Batiment A';
    ELSE
      v_site := 'Batiment B';
    END IF;

    -- Insertion dans la table Ticket
    INSERT INTO Ticket (id_ticket, titre, description, date_creation, date_modification, date_cloture, etat_ticket, site)
    VALUES (i, v_titre, v_description, v_date_creation, v_date_modification, v_date_cloture, v_etat_ticket, v_site);

  END LOOP;
  COMMIT;
END;

BEGIN
   FOR i IN 1..50 LOOP
      INSERT INTO Utilisateur_Ticket (id_utilisateur, ticket_id)
      VALUES (TRUNC(DBMS_RANDOM.VALUE(1,50)), TRUNC(DBMS_RANDOM.VALUE(1,50)));
   END LOOP;
END;
/

BEGIN
    FOR i IN 1..50 LOOP
        INSERT INTO Utilisateur_Materiel (id_utilisateur, id_materiel)
        VALUES (TRUNC(DBMS_RANDOM.VALUE(1,50)), TRUNC(DBMS_RANDOM.VALUE(1,50)));
    END LOOP;
    COMMIT;
END;
/

BEGIN
    FOR i IN 1..50 LOOP
        INSERT INTO UTILISATEUR_LOGICIEL (id_utilisateur, ID_LOGICIEL)
        VALUES (TRUNC(DBMS_RANDOM.VALUE(1,50)), TRUNC(DBMS_RANDOM.VALUE(1,3)));
    END LOOP;
    COMMIT;
END;
/
