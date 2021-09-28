DROP TRIGGER Branch_on_update_cascade;
DROP TRIGGER Customer_date_of_change;
DROP TABLE Audit_account;
DROP TRIGGER Audit_account;

-- Implementation of integrity constraint ON UPDATE CASCADE
-- for Account(branch)

CREATE OR REPLACE TRIGGER Branch_on_update_cascade
  AFTER UPDATE OF name
  ON Branch
  FOR EACH ROW
  BEGIN
    UPDATE Account SET branch = :NEW.name WHERE branch = :OLD.name;
  END;
/

SELECT *
FROM Branch;

SELECT accNo, branch
FROM Account;

UPDATE Branch
SET name = 'Janska 20'
WHERE name = 'Janska';

ROLLBACK;

-- Operation on background
-- Adding a new column date_of_last_change in table Customer
-- and storing the value by means of a database trigger

SELECT custNo, name
FROM Customer;
SELECT *
FROM Customer;

ALTER TABLE Customer
  ADD date_of_last_change TIMESTAMP;

SELECT custNo, name, TO_CHAR(date_of_last_change, 'DD.MM.YYYY HH24:MM:SS') "date"
FROM Customer;

CREATE OR REPLACE TRIGGER Customer_date_of_change
  BEFORE INSERT OR UPDATE
  ON Customer
  FOR EACH ROW
  BEGIN
    :NEW.date_of_last_change := SYSTIMESTAMP;
  END;
/

UPDATE Customer
SET name = 'Jana Velka'
WHERE name = 'Jana Mala';

INSERT INTO Customer (custNo, name)
VALUES ('580721/2580', 'Josef Velky');

SELECT custNo, name, TO_CHAR(date_of_last_change, 'DD.MM.YYYY HH24:MM:SS') "date"
FROM Customer;

ROLLBACK;

ALTER TABLE Customer
  DROP COLUMN date_of_last_change;

-- Audit of changes in the database
-- When table Account is modified, information about a modification is 
-- inserted into table Audit_account

CREATE TABLE Audit_account (
  accNo_old   INTEGER,
  balance_old DECIMAL(10, 2),
  custNo_old  CHAR(11),
  branch_old  VARCHAR(20),
  accNo_new   INTEGER,
  balance_new DECIMAL(10, 2),
  custNo_new  CHAR(11),
  branch_new  VARCHAR(20),
  modified_by VARCHAR(20),
  time        TIMESTAMP
);

CREATE OR REPLACE TRIGGER Audit_account
  AFTER INSERT OR DELETE OR UPDATE
  ON Account
  FOR EACH ROW
  BEGIN
    INSERT INTO Audit_account
    VALUES (:OLD.accNo,
            :OLD.balance,
            :OLD.custNo,
            :OLD.branch,
            :NEW.accNo,
            :NEW.balance,
            :NEW.custNo,
            :NEW.branch,
            USER,
            SYSTIMESTAMP);
  END;
/

SELECT accNo, balance
FROM Account;

UPDATE Account
SET balance = balance - 1000
WHERE accNo = 2075752;

UPDATE Account
SET balance = balance + 1000
WHERE accNo = 4320286;

SELECT accNo_old, balance_old, balance_new, modified_by, TO_CHAR(time, 'DD.MM.YYYY HH24:MM:SS') time
FROM Audit_account;

ROLLBACK;
