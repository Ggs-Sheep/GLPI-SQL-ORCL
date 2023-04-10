-- Création de la table Utilisateurs
alter session set "_ORACLE_SCRIPT"=true;
CREATE TABLE Utilisateurs (
    id_utilisateur NUMBER(10) PRIMARY KEY,
    nom VARCHAR2(50) NOT NULL,
    prenom VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    type_utilisateur VARCHAR2(50)
);
ALTER TABLE Utilisateurs
ADD CONSTRAINT email_check CHECK (REGEXP_LIKE(email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'));
ALTER TABLE Utilisateurs
ADD CONSTRAINT chk_type_utilisateur CHECK (type_utilisateur IN ('technicien', 'utilisateur'));


-- Création de la table Projet
CREATE TABLE Projet (
    id_projet NUMBER(10) PRIMARY KEY,
    nom_projet VARCHAR2(50) NOT NULL,
    description VARCHAR2(500),
    date_creation DATE,
    date_modification DATE,
    etat_projet VARCHAR2(50),
    site VARCHAR2(50)
);
CREATE INDEX idx_projet_nom_projet
ON Projet (nom_projet);


-- Création de la table Matériel
CREATE TABLE Materiel (
    id_materiel NUMBER(10) PRIMARY KEY,
    type_materiel VARCHAR2(50) NOT NULL,
    date_achat DATE,
    date_garantie DATE,
    date_fin_vie DATE,
    etat_materiel VARCHAR2(50)
);
CREATE INDEX idx_materiel_etat_materiel
ON Materiel (etat_materiel);


-- Création de la table Logiciels
CREATE TABLE Logiciels (
    id_logiciel NUMBER(10) PRIMARY KEY,
    nom_logiciel VARCHAR2(50) NOT NULL,
    type_logiciel VARCHAR2(50),
    version VARCHAR2(50),
    date_achat DATE,
    date_fin_support DATE
);
CREATE INDEX idx_logiciels_nom_logiciel
ON Logiciels (nom_logiciel);


-- Création de la table Tickets
CREATE TABLE Tickets (
    id_ticket NUMBER(10) PRIMARY KEY,
    titre VARCHAR2(50) NOT NULL,
    description VARCHAR2(500),
    date_creation DATE,
    date_modification DATE,
    date_cloture DATE,
    etat_ticket VARCHAR2(50),
    site VARCHAR2(50),
    projet_id NUMBER(10),
    FOREIGN KEY (projet_id) REFERENCES Projet(id_projet)
);
CREATE INDEX idx_tickets_titre
ON Tickets (titre);

CREATE TABLE Utilisateurs_Tickets (
    utilisateur_id NUMBER(10),
    ticket_id NUMBER(10),
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateurs(id_utilisateur),
    FOREIGN KEY (ticket_id) REFERENCES Tickets(id_ticket)
);

CREATE TABLE Utilisateurs_Materiel (
    id_utilisateur NUMBER(10) NOT NULL,
    id_materiel NUMBER(10) NOT NULL,
    CONSTRAINT pk_utilisateurs_materiel PRIMARY KEY (id_utilisateur, id_materiel),
    CONSTRAINT fk_utilisateurs_materiel_utilisateurs FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs (id_utilisateur),
    CONSTRAINT fk_utilisateurs_materiel_materiel FOREIGN KEY (id_materiel) REFERENCES Materiel (id_materiel)
);

CREATE TABLE Utilisateurs_Logiciels (
    id_utilisateur NUMBER(10) NOT NULL,
    id_logiciel NUMBER(10) NOT NULL,
    CONSTRAINT pk_utilisateurs_logiciels PRIMARY KEY (id_utilisateur, id_logiciel),
    CONSTRAINT fk_utilisateurs_logiciels_utilisateurs FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs (id_utilisateur),
    CONSTRAINT fk_utilisateurs_logiciels_logiciels FOREIGN KEY (id_logiciel) REFERENCES Logiciels (id_logiciel)
);

CREATE TABLE Materiel_Logiciels (
    id_materiel NUMBER(10) NOT NULL,
    id_logiciel NUMBER(10) NOT NULL,
    CONSTRAINT pk_materiel_logiciels PRIMARY KEY (id_materiel, id_logiciel),
    CONSTRAINT fk_materiel_logiciels_materiel FOREIGN KEY (id_materiel) REFERENCES Materiel (id_materiel),
    CONSTRAINT fk_materiel_logiciels_logiciels FOREIGN KEY (id_logiciel) REFERENCES Logiciels (id_logiciel)
);
