INSERT INTO Utilisateurs (id_utilisateur, nom, prenom, email)
VALUES (1, 'Doe', 'John', 'johndoe@example.com');

INSERT INTO Utilisateurs (id_utilisateur, nom, prenom, email)
VALUES (2, 'Smith', 'Jane', 'janesmith@example.com');

INSERT INTO Utilisateurs (id_utilisateur, nom, prenom, email)
VALUES (3, 'Dupont', 'Pierre', 'pierre.dupont@example.com');

INSERT INTO Utilisateurs (id_utilisateur, nom, prenom, email)
VALUES (4, 'Garcia', 'Maria', 'm.garcia@example.com');

INSERT INTO Utilisateurs (id_utilisateur, nom, prenom, email)
VALUES (5, 'Lee', 'Bruce', 'bruce.lee@example.com');

INSERT INTO Utilisateurs (id_utilisateur, nom, prenom, email)
VALUES (6, 'Dupont', 'Marie', 'marie.dupont@mail.com');

INSERT INTO Utilisateurs (id_utilisateur, nom, prenom, email)
VALUES (7, 'Martin', 'Pierre', 'pierre.martin@mail.com');

INSERT INTO Utilisateurs (id_utilisateur, nom, prenom, email)
VALUES (8, 'Lefevre', 'Sophie', 'sophie.lefevre@mail.com');

INSERT INTO Utilisateurs (id_utilisateur, nom, prenom, email)
VALUES (9, 'Garcia', 'Julien', 'julien.garcia@mail.com');

INSERT INTO Utilisateurs (id_utilisateur, nom, prenom, email)
VALUES (10, 'Chen', 'Li', 'li.chen@mail.com');

INSERT INTO Materiel (id_materiel, type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel)
VALUES (1, 'Ordinateur portable', '01-01-2022', '01-01-2023', '01-01-2025', 'Neuf');

INSERT INTO Materiel (id_materiel, type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel)
VALUES (2, 'Imprimante', '01-FEB-2022', '01-FEB-2023', '01-FEB-2026', 'En service');

INSERT INTO Materiel (id_materiel, type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel)
VALUES (3, 'Scanner', '01-MAR-2022', '01-MAR-2023', '01-MAR-2027', 'Hors service');

INSERT INTO Materiel (id_materiel, type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel)
VALUES (4, 'Ordinateur portable', TO_DATE('2021-05-15', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'),
        TO_DATE('2026-05-15', 'YYYY-MM-DD'), 'Bon état');

INSERT INTO Materiel (id_materiel, type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel)
VALUES (5, 'Imprimante', TO_DATE('2020-09-20', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'),
        TO_DATE('2026-09-20', 'YYYY-MM-DD'), 'Bon état');

INSERT INTO Materiel (id_materiel, type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel)
VALUES (6, 'Scanner', TO_DATE('2022-01-10', 'YYYY-MM-DD'), TO_DATE('2025-01-10', 'YYYY-MM-DD'),
        TO_DATE('2028-01-10', 'YYYY-MM-DD'), 'En panne');

INSERT INTO Materiel (id_materiel, type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel)
VALUES (7, 'Serveur', TO_DATE('2019-03-01', 'YYYY-MM-DD'), TO_DATE('2022-03-01', 'YYYY-MM-DD'),
        TO_DATE('2025-03-01', 'YYYY-MM-DD'), 'Bon état');

INSERT INTO Materiel (id_materiel, type_materiel, date_achat, date_garantie, date_fin_vie, etat_materiel)
VALUES (8, 'Téléphone', TO_DATE('2021-11-23', 'YYYY-MM-DD'), TO_DATE('2024-11-23', 'YYYY-MM-DD'),
        TO_DATE('2027-11-23', 'YYYY-MM-DD'), 'Bon état');

INSERT INTO Logiciels
VALUES (1, 'Microsoft Office', 'Bureautique', '2019', TO_DATE('01/01/2019', 'dd/mm/yyyy'),
        TO_DATE('01/01/2024', 'dd/mm/yyyy'));
INSERT INTO Logiciels
VALUES (2, 'Adobe Photoshop', 'Graphisme', '2022', TO_DATE('01/01/2022', 'dd/mm/yyyy'),
        TO_DATE('01/01/2027', 'dd/mm/yyyy'));
INSERT INTO Logiciels
VALUES (3, 'Autodesk AutoCAD', 'CAO/DAO', '2021', TO_DATE('01/01/2021', 'dd/mm/yyyy'),
        TO_DATE('01/01/2026', 'dd/mm/yyyy'));
INSERT INTO Logiciels
VALUES (4, 'Symantec Norton', 'Antivirus', '2021', TO_DATE('01/01/2021', 'dd/mm/yyyy'),
        TO_DATE('01/01/2023', 'dd/mm/yyyy'));
INSERT INTO Logiciels
VALUES (5, 'Mozilla Firefox', 'Navigateur Web', '89.0', TO_DATE('01/01/2021', 'dd/mm/yyyy'),
        TO_DATE('01/01/2024', 'dd/mm/yyyy'));
INSERT INTO Logiciels
VALUES (6, 'VMware Workstation', 'Virtualisation', '16', TO_DATE('01/01/2021', 'dd/mm/yyyy'),
        TO_DATE('01/01/2026', 'dd/mm/yyyy'));

INSERT INTO Projet (id_projet, nom_projet, description, date_creation, date_modification, etat_projet, site)
VALUES (1, 'Projet A', 'Description du projet A', '01-JAN-2022', '15-FEB-2022', 'En cours', 'Paris');

INSERT INTO Projet (id_projet, nom_projet, description, date_creation, date_modification, etat_projet, site)
VALUES (2, 'Projet B', 'Description du projet B', '10-FEB-2022', '20-MAR-2022', 'Terminé', 'Lyon');

INSERT INTO Projet (id_projet, nom_projet, description, date_creation, date_modification, etat_projet, site)
VALUES (3, 'Projet C', 'Description du projet C', '01-MAR-2022', '25-MAR-2022', 'En cours', 'Marseille');

INSERT INTO Projet (id_projet, nom_projet, description, date_creation, date_modification, etat_projet, site)
VALUES (4, 'Projet D', 'Description du projet D', '15-JAN-2022', '30-JAN-2022', 'Terminé', 'Bordeaux');

INSERT INTO Tickets (id_ticket, titre, description, date_creation, date_modification, date_cloture, etat_ticket, site, utilisateur_id, projet_id)
VALUES (1, 'Ticket 1', 'Description du ticket 1', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-03-02', 'YYYY-MM-DD'), NULL, 'En attente', 'Site 1', 1, 1);

INSERT INTO Tickets (id_ticket, titre, description, date_creation, date_modification, date_cloture, etat_ticket, site, utilisateur_id, projet_id)
VALUES (2, 'Ticket 2', 'Description du ticket 2', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-03-02', 'YYYY-MM-DD'), TO_DATE('2022-03-03', 'YYYY-MM-DD'), 'Résolu', 'Site 2', 2, 1);

INSERT INTO Tickets (id_ticket, titre, description, date_creation, date_modification, date_cloture, etat_ticket, site, utilisateur_id, projet_id)
VALUES (3, 'Ticket 3', 'Description du ticket 3', TO_DATE('2022-03-02', 'YYYY-MM-DD'), TO_DATE('2022-03-03', 'YYYY-MM-DD'), NULL, 'En attente', 'Site 2', 1, 2);

INSERT INTO Tickets (id_ticket, titre, description, date_creation, date_modification, date_cloture, etat_ticket, site, utilisateur_id, projet_id)
VALUES (4, 'Ticket 4', 'Description du ticket 4', TO_DATE('2022-03-03', 'YYYY-MM-DD'), TO_DATE('2022-03-04', 'YYYY-MM-DD'), TO_DATE('2022-03-05', 'YYYY-MM-DD'), 'Résolu', 'Site 1', 3, 2);
