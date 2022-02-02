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

/* creating transaction table*/
DROP TABLE IF EXISTS transaction;
CREATE TABLE transaction(
	id int PRIMARY KEY NOT NULL,
	date TIMESTAMP NOT NULL,
    amount float NOT NULL,
	card VARCHAR(30) NOT NULL,
	id_merchant int NOT NULL
);
 
-- step 1: utilize PgAdmin wizard to import the csv 
-- step 2: check that the import worked 
select * from transaction;

--adding foreign key constraints for credit_card table

ALTER TABLE credit_card 
ADD CONSTRAINT fk_credit_card
FOREIGN KEY (cardholder_id) 
REFERENCES card_holder (id);

--adding foreign key constraints for credit_card table

ALTER TABLE merchant
ADD CONSTRAINT fk_merchant
FOREIGN KEY (id_merchant_category) 
REFERENCES merchant_category (id);

--adding a foreign key constraint for the transaction table

ALTER TABLE transaction
ADD CONSTRAINT fk_transaction
FOREIGN KEY (id_merchant) 
REFERENCES merchant (id);

--adding another foreign key constraint for the transaction table

ALTER TABLE transaction
ADD CONSTRAINT fk_transaction_card
FOREIGN KEY (card) 
REFERENCES credit_card (card);

--find all transactions in the transaction table less that $2.00 
SELECT *
FROM transaction
WHERE amount < 2.00;

-- how many unique cardholder_id are present in the card_holder table? 

SELECT
	COUNT (DISTINCT id)
FROM
	card_holder;

select count(*)
from card_holder t1 
inner join credit_card t2 on t1.id = t2.cardholder_id
inner join transaction t3 on t2.card = t3.card
WHERE t3.amount < 2.00
GROUP BY t1.id;


