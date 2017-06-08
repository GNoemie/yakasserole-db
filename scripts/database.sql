CREATE TABLE Utilisateur(
    id              SERIAL NOT NULL PRIMARY KEY,
    role            varchar(25),
    premium         boolean,
    confirm	    boolean,
    
    nom             varchar(255),
    prenom          varchar(255),
    adresse_postale varchar(255),
    code_postal	    varchar(5),
    ville	    varchar(255),

    mail            varchar(255),
    mot_de_passe    varchar(255),
    date_inscrit    timestamp
);

CREATE TABLE confirmation(
       cle   varchar(255),
       mail   varchar(255)
       
);

CREATE TABLE mdprecup(
       cle   varchar(255),
       mail   varchar(255)
       
);

--- Les tables pour la section Recette ---
CREATE TABLE Recette(
    id              serial          PRIMARY KEY,
    date_post       timestamp,

    auteur          int             REFERENCES Utilisateur (id),
    titre           varchar(50),
    type            varchar(50),
    ingredients	    varchar(255),
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
    date_post       timestamp,
    contenu         text
);
--- Fin tables pour la section Recette ---


--- Les tables pour la section Atelier ---
CREATE TABLE Atelier(
    id              serial          PRIMARY KEY,
    chef            int             REFERENCES Utilisateur (id),

    titre	    varchar(255),
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
    date_post       timestamp,
    contenu         text
);

CREATE TABLE Reservation(
    atelier         int             REFERENCES Atelier (id),
    utilisateur     int             REFERENCES Utilisateur (id),
    nombre_pers     int,
    date_reserv     timestamp
);
--- Fin tables pour la section Atelier ---

INSERT INTO Utilisateur VALUES (DEFAULT, 'admin', true, true, 'YaKasserole', 'Administrateur', 'quartier Compans', '31000', 'Toulouse', 'yakasserole@gmail.com', '60cb169341e75e6bc7fc70c1b17d3a7fc1149cea481462485bf470ddeece2b31', '2017-06-27');
