-- ============================
-- SCHEMA BRONZE
-- ============================
CREATE SCHEMA IF NOT EXISTS bronze;

-- ============================
-- TABLE : adhesion_detail
-- ============================
DROP TABLE IF EXISTS bronze.adhesion_detail;
CREATE TABLE bronze.adhesion_detail (
    num_adhesion_normalise        VARCHAR,
    num_beneficiaire_unique       VARCHAR,
    date_naissance_assure         VARCHAR,
    code_postal                   VARCHAR,
    exercice_paiement             VARCHAR,
    num_beneficiaire              VARCHAR,
    type_beneficiaire             VARCHAR,
    date_naissance_beneficiaire   VARCHAR,
    code_profession               VARCHAR,
    code_produit                  VARCHAR,
    code_fractionnement           VARCHAR,
    code_garantie                 VARCHAR,
    formule                       VARCHAR,
    primes_acquises               VARCHAR,
    code_agent                    VARCHAR,
    code_region                   VARCHAR,
    prime_garantie                VARCHAR
);

COPY bronze.adhesion_detail
FROM '/data/Adhesion_detail.csv'
DELIMITER ';'
CSV HEADER;

-- ============================
-- TABLE : beneficiaire
-- ============================
DROP TABLE IF EXISTS bronze.beneficiaire;
CREATE TABLE bronze.beneficiaire (
    num_beneficiaire  VARCHAR,
    sexe              VARCHAR,
    regime_social     VARCHAR
);

COPY bronze.beneficiaire
FROM '/data/Beneficiaire.csv'
DELIMITER ';'
CSV HEADER;

-- ============================
-- TABLE : dept_region
-- ============================
DROP TABLE IF EXISTS bronze.dept_region;
CREATE TABLE bronze.dept_region (
    departmentcode  VARCHAR,
    departmentname  VARCHAR,
    regioncode      VARCHAR,
    regionname      VARCHAR
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
    date        VARCHAR,
    departement VARCHAR,
    tempmin     VARCHAR,
    tempmax     VARCHAR,
    ventmax     VARCHAR,
    precip      VARCHAR
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
    num_sinistre               VARCHAR,
    num_adhesion               VARCHAR,
    acte                       VARCHAR,
    designation_acte           VARCHAR,
    libelle_bareme             VARCHAR,
    num_beneficiaire           VARCHAR,
    num_beneficiaire_sinistre  VARCHAR,
    jour_debut_soins           VARCHAR,
    mois_debut_soins           VARCHAR,
    annee_debut_soins          VARCHAR,
    jour_paiement              VARCHAR,
    mois_paiement              VARCHAR,
    annee_paiement             VARCHAR,
    frais_reel_assure          VARCHAR,
    montant_secu               VARCHAR,
    montant_rembourse          VARCHAR
);

COPY bronze.prestation_sante
FROM '/data/Prestations_sante.csv'
DELIMITER ';'
CSV HEADER;

-- ============================
-- TABLE : profession
-- ============================
DROP TABLE IF EXISTS bronze.profession;
CREATE TABLE bronze.profession (
    niveau          VARCHAR,
    code            VARCHAR,
    categorie       VARCHAR,
    famille_metier  VARCHAR,
    intitule        VARCHAR
);

COPY bronze.profession
FROM '/data/Classification_CCN_IDCC218.csv'
DELIMITER ';'
CSV HEADER;
