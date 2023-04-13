CREATE VIEW vue_materiels_hors_garantie AS
SELECT *
FROM MATERIEL
WHERE date_garantie < ADD_MONTHS(SYSDATE, 2);

CREATE VIEW vue_materiel_hors_service AS
SELECT *
FROM MATERIEL
WHERE etat_materiel = 'hors service';

CREATE VIEW vue_utilisateurs_techniciens AS
SELECT *
FROM Utilisateur
WHERE type_utilisateur = 'technicien';

CREATE VIEW Vue_des_tickets_ouverts AS
SELECT id_ticket, titre, description, date_creation, date_modification, etat_ticket, site
FROM Ticket
WHERE etat_ticket = 'ouvert';

