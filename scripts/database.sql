CREATE TABLE Utilisateur(
    id              serial          PRIMARY KEY,
    role            varchar(25),
    premium         boolean,

    nom             varchar(255),
    prenom          varchar(255),
    date_naissance  date,
    adresse_postale varchar(255),

    mail            varchar(255),
    mot_de_passe    varchar(255),
    date_inscrit    date
);

--- Les tables pour la section Recette ---
CREATE TABLE Recette(
    id              serial          PRIMARY KEY,
    date_post       date,

    auteur          int             REFERENCES Utilisateur (id),
    titre           varchar(50),
    type            varchar(50),
    description     varchar(50),
    difficulte      decimal(1)
);

CREATE TABLE Ingredient(
    id              serial          PRIMARY KEY,
    nom             varchar(50)
);

CREATE TABLE Recette_ingredient(
    recette         int             REFERENCES Recette (id),
    ingredient      int             REFERENCES Ingredient (id),
    quantite        int
);

CREATE TABLE Commentaire_recette(
    id              serial          PRIMARY KEY,
    auteur          int             REFERENCES Utilisateur (id),
    recette         int             REFERENCES Recette (id),
    date_post       date,
    contenu         text
);
--- Fin tables pour la section Recette ---


--- Les tables pour la section Atelier ---
CREATE TABLE Atelier(
    id              serial          PRIMARY KEY,
    chef            int             REFERENCES Utilisateur (id),

    nom             varchar(255),
    theme           varchar(255),
    description     text,

    localisation    varchar(255),
    prix            decimal(5,2),
    date_debut      date,
    date_fin        date
);

CREATE TABLE Commentaire_atelier(
    id              serial          PRIMARY KEY,
    auteur          int             REFERENCES Utilisateur (id),
    atelier         int             REFERENCES Atelier (id),
    date_post       date,
    contenu         text
);

CREATE TABLE Reservation(
    atelier         int             REFERENCES Atelier (id),
    utilisateur     int             REFERENCES Utilisateur (id),
    nombre_pers     int,
    date_reserv     date
);
--- Fin tables pour la section Atelier ---
