-- Create a table with customers of the branch Janska.

CREATE TABLE Customer_Janska (
  custNo CHAR(11)    NOT NULL,
  name   VARCHAR(40) NOT NULL,
  street VARCHAR(20),
  town   VARCHAR(20)
);

SELECT *
FROM Customer
       NATURAL JOIN Account
WHERE branch = 'Janska';

INSERT INTO Customer_Janska
SELECT custNo, name, street, town
FROM Customer C
       NATURAL JOIN Account
WHERE branch = 'Janska';

-- It is possible to insert rows with the same value of custNo
-- to the table Customer_Janska  
ROLLBACK;
COMMIT;

SELECT custNo, name
FROM Customer_Janska;

DELETE
FROM Customer_Janska;

ROLLBACK;

DELETE
FROM Customer_Janska
WHERE custNo = '440726/0672';

-- Delete customers who do not have account in our bank
-- -> It is necessary to change constraints for FK (not shown here)
DELETE
FROM Customer
WHERE custNo NOT IN
      (SELECT custNo FROM Account);

SELECT *
FROM Customer;

-- Deposit 1000 CZK on account 2075752.
UPDATE Account
SET balance = balance + 1000
WHERE accNo = 2075752;

SELECT *
FROM Account
WHERE accNo = 2075752;

ROLLBACK;

DROP TABLE Customer_Janska;
