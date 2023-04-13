CREATE VIEW vue_materiels_hors_garantie AS
SELECT *
FROM MATERIEL
WHERE date_garantie < ADD_MONTHS(SYSDATE, 2);

CREATE VIEW vue_materiel_hors_service AS
SELECT *
FROM MATERIEL
WHERE etat_materiel = 'hors service';
