/* This is a script that creates a sample database used on lectures*/

DROP TABLE Transaction CASCADE CONSTRAINTS;
DROP TABLE Account CASCADE CONSTRAINTS;
DROP TABLE Branch CASCADE CONSTRAINTS;
DROP TABLE Customer CASCADE CONSTRAINTS;
DROP SEQUENCE seq_accNo;
DROP TABLE Loan CASCADE CONSTRAINTS;

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

COMMIT;

SELECT *
FROM Customer;
SELECT *
FROM Branch;
SELECT *
FROM Account;
SELECT *
FROM Transaction;
