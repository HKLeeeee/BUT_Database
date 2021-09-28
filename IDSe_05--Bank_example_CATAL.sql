-- Tables in the system catalogue
-- Oracle

SELECT table_name
FROM User_tables;

SELECT table_name
FROM All_tables;

SELECT *
FROM User_tables
WHERE table_name = 'CUSTOMER';

SELECT *
FROM User_tables
WHERE table_name = 'Customer';

SELECT *
FROM User_tables
WHERE table_name = UPPER('Customer');

-- Table columns in the system catalogue
-- Oracle

SELECT table_name, column_name
FROM User_tab_columns;

SELECT column_name
FROM User_tab_columns
WHERE table_name = 'CUSTOMER';

DESCRIBE Customer;

-- Views in the system catalogue

CREATE VIEW Janska AS
  SELECT C.*
  FROM Customer C,
       Account A
  WHERE C.custNo = C.custNo
    AND branch = 'Janska';

-- Oracle

SELECT view_name, text
FROM User_views
WHERE view_name = 'JANSKA';

-- Constraints in the system catalogue
-- Oracle

SELECT owner, constraint_name
FROM USER_CONSTRAINTS
WHERE table_name = 'CUSTOMER';

-- PRIMARY KEY or UNIQUE constraints in the system catalogue

SELECT CC.table_name, CC.column_name, C.constraint_type
FROM USER_CONSTRAINTS C
       JOIN USER_CONS_COLUMNS CC USING (constraint_name)
WHERE CC.table_name = 'CUSTOMER'
  AND (C.constraint_type = 'P' OR C.constraint_type = 'U');
