CREATE TABLE Client (
    Client_ID VARCHAR(20) PRIMARY KEY,
    Client_Name VARCHAR(20),
    Client_Phone_num VARCHAR(20),
    Client_Address VARCHAR(100)
    );
INSERT INTO Client VALUES ('xleehe00', 'Heekyoung', '777674569', 'Kolejn? 2');

CREATE TABLE Shop_manager (
    manager_ID VARCHAR(20) PRIMARY KEY,
    manager_Name VARCHAR(20),
    working_section VARCHAR(50)
);
INSERT INTO Shop_manager VALUES ('1938', 'Kristoff', 'customer service');

CREATE TABLE Storage_manager (
    manager_ID VARCHAR(20) PRIMARY KEY,
    manager_Name VARCHAR(20),
    working_section VARCHAR(50)
);
INSERT INTO Storage_manager VALUES ('4519', 'Oaken', 'stock management');

CREATE TABLE Transaction (
    Oredar_No Number(4) PRIMARY KEY,
    Total_price Number(4),
    Quantity INT,
    Payment_method VARCHAR(20),
    Order_date DATE
    ); 
INSERT INTO transaction VALUES (1,1870, 3, 'debit card', '2020-03-23');
    
CREATE TABLE Invoice (
    Invoice_no NUMBER(4) PRIMARY KEY
    );
INSERT INTO Invoice VALUES (1);   

CREATE TABLE Shop (
    Shop_No NUMBER(10) PRIMARY KEY,
    Shop_Name VARCHAR(10),
    Shop_Address VARCHAR(40),
    Shop_phone NUMBER(20)
    );

INSERT INTO Shop VALUES (1, 'Billa' ,'koleji', '12345');

CREATE TABLE Shop_stock (
    Shop_stock_Item_No NUMBER(10) PRIMARY KEY,
    Shop_stock_Item_Name VARCHAR(10),
    Shop_stock_Quantity NUMBER(10),
    Shop_stock_Price NUMBER(10)
    );
INSERT INTO Shop_stock VALUES (1, 'milk' ,'10', '15');

CREATE TABLE Storage (
    Storage_No NUMBER(10) PRIMARY KEY,
    Storage_Name VARCHAR(20),
    Storage_Address VARCHAR(20),
    Storage_Phone NUMBER(10)
    );

INSERT INTO Storage VALUES (1, 'Billa_storage' ,'italy', '54321');

CREATE TABLE Storage_stock (
    Storage_stock_Item_No NUMBER(10) PRIMARY KEY,
    Storage_stock_Item_Name VARCHAR(20),
    Storage_stock_Quantity NUMBER(10),
    Storage_stock_Price NUMBER(10)
    );
    
INSERT INTO Storage_stock VALUES (1, 'water' ,'5', '5');
        