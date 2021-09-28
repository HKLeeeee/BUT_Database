/* This is a script that creates an index */

DROP INDEX Customer_name;

CREATE INDEX Customer_name
  ON Customer (name);

SELECT *
FROM Customer
WHERE name = 'Jan Novak';

/* The usage of the index can be seen in Explain plan */
