-- Création de la table Utilisateurs
alter session set "_ORACLE_SCRIPT"= true;
CREATE TABLE Utilisateur
(
    id_utilisateur   NUMBER(10) PRIMARY KEY,
    nom              VARCHAR2(100) NOT NULL,
    prenom           VARCHAR2(100) NOT NULL,
    email            VARCHAR2(100) UNIQUE,
    type_utilisateur VARCHAR2(100)
);
ALTER TABLE Utilisateur
    ADD CONSTRAINT email_check CHECK (REGEXP_LIKE(email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'));
ALTER TABLE Utilisateur
    ADD CONSTRAINT chk_type_utilisateur CHECK (type_utilisateur IN ('technicien', 'utilisateur'));

-- Création de la table Matériel
CREATE TABLE Materiel
(
    id_materiel   NUMBER(10) PRIMARY KEY,
    type_materiel VARCHAR2(100) NOT NULL,
    date_achat    DATE,
    date_garantie DATE,
    date_fin_vie  DATE,
    etat_materiel VARCHAR2(100)
);
ALTER TABLE Materiel
    ADD CONSTRAINT chk_type_materiel_type CHECK (type_materiel IN
                                                 ('ordinateur fixe', 'ordinateur portable', 'serveur', 'scanner',
                                                  'imprimante', 'telephone'));
ALTER TABLE Materiel
    ADD CONSTRAINT chk_type_materiel_etat CHECK (etat_materiel IN
                                                 ('neuf', 'bon etat', 'etat moyen', 'mauvais etat', 'en reparation',
                                                  'hors service'));
CREATE INDEX idx_materiel_etat_materiel
    ON Materiel (etat_materiel);


-- Création de la table Logiciels
CREATE TABLE Logiciel
(
    id_logiciel      NUMBER(10) PRIMARY KEY,
    nom_logiciel     VARCHAR2(100) NOT NULL,
    type_logiciel    VARCHAR2(100),
    version          VARCHAR2(100),
    date_achat       DATE,
    date_fin_support DATE
);
CREATE INDEX idx_logiciels_nom_logiciel
    ON Logiciel (nom_logiciel);


-- Création de la table Tickets
CREATE TABLE Ticket
(
    id_ticket         NUMBER(10) PRIMARY KEY,
    titre             VARCHAR2(100) NOT NULL,
    description       VARCHAR2(500),
    date_creation     DATE,
    date_modification DATE,
    date_cloture      DATE,
    etat_ticket       VARCHAR2(100),
    site              VARCHAR2(100)
);
CREATE INDEX idx_tickets_titre
    ON Ticket (titre);

CREATE TABLE Utilisateur_Ticket
(
    id_utilisateur NUMBER(10),
    ticket_id      NUMBER(10),
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur (id_utilisateur),
    FOREIGN KEY (ticket_id) REFERENCES Ticket (id_ticket)
);

CREATE TABLE Utilisateur_Materiel
(
    id_utilisateur NUMBER(10) NOT NULL,
    id_materiel    NUMBER(10) NOT NULL,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur (id_utilisateur),
    FOREIGN KEY (id_materiel) REFERENCES Materiel (id_materiel)
);

CREATE TABLE Utilisateur_Logiciel
(
    id_utilisateur NUMBER(10) NOT NULL,
    id_logiciel    NUMBER(10) NOT NULL,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur (id_utilisateur),
    FOREIGN KEY (id_logiciel) REFERENCES Logiciel (id_logiciel)
);
