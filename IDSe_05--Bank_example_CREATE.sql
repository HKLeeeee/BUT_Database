-- Script demonstrating the usage of DDL SQL statements
-- CREATE TABLE, ALTER TABLE, DROP TABLE on a sample database Bank
-- In addition, CREATE SYNONYM and CREATE SEQUENCE statements 
-- are demonstrated here too.

-- CREATING THE SAMPLE DATABASE BANK ------------------
-------------------------------------------------------

-- This statement shows all my tables (I have created)

SELECT table_name
FROM USER_TABLES;

-- The following statements drop tables of the database Bank if they exist

DROP TABLE Transaction CASCADE CONSTRAINTS;
DROP TABLE Account CASCADE CONSTRAINTS;
DROP TABLE Branch CASCADE CONSTRAINTS;
DROP TABLE Customer CASCADE CONSTRAINTS;
DROP SEQUENCE seq_accNo;
DROP TABLE Loan CASCADE CONSTRAINTS;

-- The following statements create the tables of the database without 
-- integrity constraints for primary, alternate and foreign keys

CREATE TABLE Customer (
  custNo CHAR(11)    NOT NULL,
  name   VARCHAR(20) NOT NULL,
  street VARCHAR(20),
  town   VARCHAR(20)
);

CREATE TABLE Branch (
  name   VARCHAR(20) NOT NULL,
  assets INTEGER
);

CREATE TABLE Account (
  accNo   INTEGER  NOT NULL,
  balance DECIMAL(10, 2),
  custNo  CHAR(11) NOT NULL,
  branch  VARCHAR(20)
);

CREATE TABLE Transaction (
  accNo   INTEGER NOT NULL,
  transNo INTEGER NOT NULL,
  "date"  DATE,
  amount  DECIMAL(7, 2)
);

-- The following statements add integrity constraints for primary, alternate 
-- and foreign keys 

ALTER TABLE Customer
  ADD CONSTRAINT PK_Customer PRIMARY KEY (custNo);
ALTER TABLE Account
  ADD CONSTRAINT PK_Account PRIMARY KEY (accNo);
ALTER TABLE Branch
  ADD CONSTRAINT PK_Branch PRIMARY KEY (name);
ALTER TABLE Transaction
  ADD CONSTRAINT PK_Transaction PRIMARY KEY
  (accNo, transNo);

ALTER TABLE Account
  ADD CONSTRAINT FK_Account_custNo
FOREIGN KEY (custNo) REFERENCES Customer (custNo) ON DELETE CASCADE;
ALTER TABLE Account
  ADD CONSTRAINT FK_Account_branch
FOREIGN KEY (branch) REFERENCES Branch (name);
ALTER TABLE Transaction
  ADD CONSTRAINT FK_Transaction_accNo
FOREIGN KEY (accNo) REFERENCES Account ON DELETE CASCADE;

-- The following statements populate the tables with sample data
-- each INSERT statement inserts one row

INSERT INTO Customer
VALUES ('440726/0672', 'Jan Novak', 'Cejl 8', 'Brno');
INSERT INTO Customer
VALUES ('530610/4532', 'Petr Vesely', 'Podzimni 28', 'Brno');
INSERT INTO Customer
VALUES ('601001/2218', 'Ivan Zeman ', 'Cejl 8', 'Brno');
INSERT INTO Customer
VALUES ('510230/048', 'Pavel Tomek', 'Tomkova 34', 'Brno');
INSERT INTO Customer
VALUES ('580807/9638', 'Josef Madr', 'Svatoplukova 15', 'Brno');
INSERT INTO Customer
VALUES ('625622/6249', 'Jana Mala', 'Brnenska 56', 'Vy?kov');

INSERT INTO Branch
VALUES ('Janska', 10000000);
INSERT INTO Branch
VALUES ('Palackeho', 5000000);

SELECT *
FROM Branch;

INSERT INTO Account
VALUES (4320286, 52000, '440726/0672', 'Janska');
INSERT INTO Account
VALUES (2348531, 10000, '530610/4532', 'Janska');
INSERT INTO Account
VALUES (1182648, 10853, '530610/4532', 'Palackeho');
INSERT INTO Account
VALUES (2075752, 26350, '440726/0672', 'Palackeho');

SELECT *
FROM Account;

INSERT INTO Transaction
VALUES (4320286, 1, TO_DATE('10.10.1998', 'dd.mm.yyyy'), 3000);
INSERT INTO Transaction
VALUES (4320286, 2, TO_DATE('12.10.1998', 'dd.mm.yyyy'), -5000);
INSERT INTO Transaction
VALUES (2075752, 1, TO_DATE('14.10.1998', 'dd.mm.yyyy'), -2000);
INSERT INTO Transaction
VALUES (2075752, 2, TO_DATE('14.10.1998', 'dd.mm.yyyy'), 10000);

-- Now we can retrieve the content of the tables by means of 
-- the following SELECT statements

SELECT *
FROM Customer;

SELECT *
FROM Branch;

SELECT *
FROM Account;

SELECT *
FROM Transaction;

-- To make the efect of the INSERT statements durable we have
-- to confirm it using the COMMIT statement (will be explained
-- on lectures as part of transaction processing).

COMMIT;

-- The next part of the script demonstrates the usage of
-- the CREATE SYNONYM statement
-- Here we use some statements related to data security that will
-- be explained on lectures later.

-- First we drop the synonym if it exists and also drop an account
-- zendulka1 and a role studentrole1 that we use in the demonstration

DROP SYNONYM Customer1;
DROP USER zendulka1 CASCADE;
DROP role studentrole1;

-- Now we create a new account in the DB named zendulka1. To do it
-- you must have the role of a database administrator.

CREATE USER zendulka1 IDENTIFIED BY zendulka1
  DEFAULT TABLESPACE Users
  QUOTA 10 M ON USERS;
;

-- We create a role for students and assign it to zendulka1

CREATE ROLE studentrole1;
GRANT CONNECT, RESOURCE, CREATE SESSION TO studentrole1;
GRANT studentrole1 TO zendulka1;

-- Now you should connect to the database as zendulka1,  
-- create a table Customer in the schema zendulka1, populata 
-- the table with one row and grant the privilege to read the table's
-- content to you.

-- This statements should be executed when connected as zendulka1

CREATE TABLE Customer (
  id   INTEGER,
  name VARCHAR(50)
);

INSERT INTO Customer
VALUES (1, 'Zendulka');

COMMIT;

GRANT SELECT ON Customer TO zendulka;

-- The end of statements executed when connected as zendulka1

SELECT *
FROM Customer;

SELECT *
FROM zendulka1.Customer;

-- The following statement creates a synonym for the full 
-- (qualified)name of the table in the schema zendulka1

CREATE SYNONYM Customer1 FOR zendulka1.Customer;

-- And to use the synonym instead of the full name

SELECT *
FROM Customer1;

-- The next section of this script shows how to create 
-- a sequence and how to retrieve the generated value.

CREATE SEQUENCE seq_accNo
  START WITH 1
  INCREMENT BY 1;

-- DUAL in Oracle is a table with one column and one row.
-- We use it when we need get a somehow generated value
-- (here by the sequence seq_accNo).

SELECT seq_accNo.NEXTVAL
FROM DUAL;
