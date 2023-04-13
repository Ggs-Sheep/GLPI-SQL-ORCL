CREATE DATABASE LINK Pau_link2
CONNECT TO Pau IDENTIFIED BY Pau
USING 'XE';

CREATE OR REPLACE VIEW vue_technicien_pau AS
SELECT id_utilisateur, nom, prenom, email, type_utilisateur
FROM utilisateur@PAU_LINK2
WHERE type_utilisateur = 'technicien';
