# ELT
Un projet ELT qui nous permet de construire et te comprendre cette méthode 


Nous avons choisie de construire notre projet avec cette architecture : 

ELT/
├── docker-compose.yml
├── init.sql
├── data/
│   ├── assure.csv
│   ├── sinistre.csv
│   ├── acte.csv
│   └── temps.csv
└── sql/
    ├── 01_bronze.sql
    ├── 02_silver.sql
    └── 03_gold.sql


Partie Bronze :

Nous avons modifier le fichier  : Classification_CCN_IDCC218.xlsx en Classification_CCN_IDCC218.csv 

puis nous vaons importé nos fichier csv dans DBeaver 

Partie Silver : 
