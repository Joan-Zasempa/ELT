CREATE DATABASE dw_mutuelle_elt;
 
CREATE USER dw_user WITH ENCRYPTED PASSWORD 'dw_password';
 
GRANT ALL PRIVILEGES ON DATABASE dw_mutuelle_elt TO dw_user;
 