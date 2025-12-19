-- ============================
-- SCHEMA BRONZE
-- ============================
CREATE SCHEMA IF NOT EXISTS bronze;
 
-- ============================
-- TABLE : adhesion_detail
-- ============================
DROP TABLE IF EXISTS bronze.adhesion_detail;
CREATE TABLE bronze.adhesion_detail (
    num_adhesion_normalise VARCHAR,
    num_beneficiaire_unique VARCHAR,
    date_naissance_assure DATE,
    code_postal VARCHAR,
    exercice_paiement INTEGER,
    num_beneficiaire VARCHAR,
    type_beneficiaire VARCHAR,
    date_naissance_beneficiaire DATE,
    code_profession VARCHAR,
    code_produit VARCHAR,
    code_fractionnement VARCHAR,
    code_garantie VARCHAR,
    formule VARCHAR,
    primes_acquises NUMERIC,
    code_agent VARCHAR,
    code_region VARCHAR,
    prime_garantie NUMERIC
);
 
COPY bronze.adhesion_detail
FROM '/data/adhesion_detail.csv'
DELIMITER ';'
CSV HEADER;
 
-- ============================
-- TABLE : beneficiaire
-- ============================
DROP TABLE IF EXISTS bronze.beneficiaire;
CREATE TABLE bronze.beneficiaire (
    num_beneficiaire VARCHAR,
    sexe VARCHAR,
    regime_social VARCHAR
);
 
COPY bronze.beneficiaire
FROM '/data/beneficiaire.csv'
DELIMITER ';'
CSV HEADER;
 
-- ============================
-- TABLE : dept_region
-- ============================
DROP TABLE IF EXISTS bronze.dept_region;
CREATE TABLE bronze.dept_region (
    departmentcode VARCHAR,
    departmentname VARCHAR,
    regioncode VARCHAR,
    regionname VARCHAR
);
 
COPY bronze.dept_region
FROM '/data/Dept_region.csv'
DELIMITER ';'
CSV HEADER;
 
-- ============================
-- TABLE : meteo
-- ============================
DROP TABLE IF EXISTS bronze.meteo;
CREATE TABLE bronze.meteo (
    date DATE,
    departement VARCHAR,
    tempmin NUMERIC,
    tempmax NUMERIC,
    ventmax NUMERIC,
    precip NUMERIC
);
 
COPY bronze.meteo
FROM '/data/MeteoByDep.csv'
DELIMITER ';'
CSV HEADER;
 
-- ============================
-- TABLE : prestation_sante
-- ============================
DROP TABLE IF EXISTS bronze.prestation_sante;
CREATE TABLE bronze.prestation_sante (
    num_sinistre VARCHAR,
    num_adhesion VARCHAR,
    acte VARCHAR,
    designation_acte VARCHAR,
    libelle_bareme VARCHAR,
    num_beneficiaire VARCHAR,
    num_beneficiaire_sinistre VARCHAR,
    jour_debut_soins INTEGER,
    mois_debut_soins INTEGER,
    annee_debut_soins INTEGER,
    jour_paiement INTEGER,
    mois_paiement INTEGER,
    annee_paiement INTEGER,
    frais_reel_assure NUMERIC,
    montant_secu NUMERIC,
    montant_rembourse NUMERIC
);
 
COPY bronze.prestation_sante
FROM '/data/Prestations_sante.csv'
DELIMITER ';'
CSV HEADER;
 
-- ============================
-- TABLE : profession
-- (Classification_CNN_IDCC218.xlsx converti en CSV)
-- ============================
DROP TABLE IF EXISTS bronze.profession;
CREATE TABLE bronze.profession (
    niveau VARCHAR,
    code VARCHAR,
    categorie VARCHAR,
    famille_metier VARCHAR,
    intitule VARCHAR
);
 
COPY bronze.profession
FROM '/data/Classification_CNN_IDCC218.csv'
DELIMITER ';'
CSV HEADER;

CREATE DATABASE dw_mutuelle_elt;
 
CREATE USER dw_user WITH ENCRYPTED PASSWORD 'dw_password';
 
GRANT ALL PRIVILEGES ON DATABASE dw_mutuelle_elt TO dw_user;