CREATE TABLE SAUVETEURS(
   idSauveteur INT,
   nomSauveteur VARCHAR(30),
   prenomSauveteur VARCHAR(30),
   dateNaissance DATE,
   dateDeces DATE,
   fonctionSauveteur VARCHAR(50),
   nbSauvetages INT,
   photoSauveteur TEXT,
   CONSTRAINT pk_Sauveteur PRIMARY KEY(idSauveteur)
);

CREATE TABLE SAUVETAGES(
   codeSauvetage INT,
   lieuSauvetage VARCHAR(50),
   dateSauvetage DATE NOT NULL,
   nbHommesSauvés INT,
   nbSauveteursDécédés INT,
   capitaineSauvetage INT NOT NULL,
   CONSTRAINT pk_Sauvetages PRIMARY KEY(codeSauvetage),
   CONSTRAINT fk_idCapiSauvetage FOREIGN KEY (capitaineSauvetage) REFERENCES SAUVETEURS(idSauveteur)
);

CREATE TABLE BATEAUX(
   idBateau INT,
   nomBateau VARCHAR(50) NOT NULL,
   typeBateau VARCHAR(50),
   CONSTRAINT pk_Bateaux PRIMARY KEY(idBateau)
);

CREATE TABLE NAUFRAGES(
   idNaufrage INT,
   nomNaufragé VARCHAR(50),
   prenomNaufragé VARCHAR(50),
   dateNaissance DATE,
   codeSauvetage INT NOT NULL,
   CONSTRAINT pk_Naufrages PRIMARY KEY(idNaufrage)
);

CREATE TABLE Participer(
   idSauveteur INT,
   codeSauvetage INT,
   CONSTRAINT pk_Participer PRIMARY KEY(idSauveteur, codeSauvetage),
   CONSTRAINT fk_idSauveteur FOREIGN KEY (idSauveteur) REFERENCES SAUVETEURS(idSauveteur),
   CONSTRAINT fk_codeSauvetage FOREIGN KEY (codeSauvetage) REFERENCES SAUVETAGES(codeSauvetage)
);

CREATE TABLE Concerner(
   codeSauvetage INT,
   idBateau INT,
   CONSTRAINT pk_Concerner PRIMARY KEY(codeSauvetage, idBateau),
   CONSTRAINT fk_codeSauvetage_Concerner FOREIGN KEY (codeSauvetage) REFERENCES SAUVETAGES(codeSauvetage),
   CONSTRAINT fk_idBateau FOREIGN KEY (idBateau) REFERENCES BATEAUX(idBateau)
);