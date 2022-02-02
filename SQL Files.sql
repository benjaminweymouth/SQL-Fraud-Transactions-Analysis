/* Benjamin Weymouth

POSTGRE SQL Example */

DROP TABLE IF EXISTS card_holder;
CREATE TABLE card_holder(
	
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
 
);

/* Importing the CSV File from local machine */
COPY card_holder
FROM 'C:\postgreSQLdata\card_holder.csv'
DELIMITER ','
CSV HEADER;

/* check that the import worked */
select * from card_holder;

/* creating credit_card table*/
DROP TABLE IF EXISTS credit_card;
CREATE TABLE credit_card(
	card VARCHAR(30) PRIMARY KEY NOT NULL,
	cardholder_id int NOT NULL

);
 
/* Importing the CSV File from local machine */
-- step 1: utilize PgAdmin wizard to import the csv 
-- step 2: check that the import worked 
select * from credit_card;

/* check that the import worked */
select * from card_holder;

/* creating merchant_category table*/
DROP TABLE IF EXISTS merchant_category;
CREATE TABLE merchant_category(
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(30) NOT NULL

);
 
-- step 1: utilize PgAdmin wizard to import the csv 
-- step 2: check that the import worked 
select * from merchant_category;

/* creating merchant table*/
DROP TABLE IF EXISTS merchant;
CREATE TABLE merchant(
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL,
    id_merchant_category int NOT NULL
);
 
-- step 1: utilize PgAdmin wizard to import the csv 
-- step 2: check that the import worked 
select * from merchant;
