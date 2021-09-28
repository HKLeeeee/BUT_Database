--------------------------------------------------------------------------------------------------------------------------------------
--PREVIOUS_TASK
----------------------------------------------------------------------------------------------------------------------------------------
--PROJECT_1
-------------------------------------------------------------------------------------------------------------------------
DROP TABLE CLIENT;
DROP TABLE STORAGE;
DROP TABLE SHOP;
DROP TABLE SHOP_MANAGER;
DROP TABEL STORAGE_MANAGER;
DROP TABLE SHOP_STOCK;
DROP TABLE STORAGE_STOCK;
DROP TABLE TRANSACTION;
DROP TABLE INVOICE;
DROP TABLE PRODUCT;

CREATE TABLE Client (
    Client_ID VARCHAR(20) PRIMARY KEY,
    Client_Name VARCHAR(20),
    Client_Phone_num VARCHAR(30),
    Client_Address VARCHAR(40)
    );

CREATE TABLE Storage (
    Storage_No VARCHAR(20) PRIMARY KEY,
    Storage_Name VARCHAR(20),
    Storage_Address VARCHAR(40),
    Storage_Phone VARCHAR(30)
    );
    
CREATE TABLE Shop (
    Shop_No VARCHAR(20) PRIMARY KEY,
    Shop_Name VARCHAR(20),
    Shop_Address VARCHAR(40),
    Shop_phone VARCHAR(30),
    STORAGE VARCHAR(20),
    FOREIGN KEY(STORAGE) REFERENCES STORAGE(STORAGE_NO)
    );


    
CREATE TABLE Shop_manager (
    manager_ID VARCHAR(20) PRIMARY KEY,
    manager_Name VARCHAR(20),
    shop VARCHAR(20),
    working_section VARCHAR(20),
    FOREIGN KEY(shop) REFERENCES SHOP(SHOP_NO)
);

CREATE TABLE Storage_manager (
    manager_ID VARCHAR(20) PRIMARY KEY,
    manager_Name VARCHAR(20),
    storage VARCHAR(20),
    working_section VARCHAR(20),
    FOREIGN KEY(storage) REFERENCES STORAGE(STORAGE_NO)
);

CREATE TABLE Transaction (
    Oredar_No Number(4) PRIMARY KEY,
    Total_price INT,
    Quantity INT,
    Payment_method VARCHAR(20),
    Order_date DATE,
    CLIENT VARCHAR(20),
    ITEM VARCHAR(20),
    FOREIGN KEY(CLIENT) REFERENCES CLIENT(CLIENT_ID)
    ); 
ALTER TABLE TRANSACTION DROP COLUMN Oredar_No;
ALTER TABLE TRANSACTION 
    ADD ORDER_NO NUMBER(4)PRIMARY KEY;
    
ALTER TABLE TRANSACTION ADD CONSTRAINT ITEM FOREIGN KEY (ITEM) REFERENCES PRODUCT(ITEM_NO);    
CREATE TABLE Invoice (
    Invoice_no NUMBER(4) PRIMARY KEY,
    ORDER_NO NUMBER(4),
    FOREIGN KEY (ORDER_NO) REFERENCES TRANSACTION(ORDER_NO)
    );
CREATE TABLE PRODUCT(
    ITEM_NO VARCHAR(20) PRIMARY KEY,
    ITEM_NAME VARCHAR(20), 
    PRICE INT
    );
 
DROP TABLE SHOP_STOCK;

CREATE TABLE Shop_stock (
    Item_No VARCHAR(20) PRIMARY KEY,
    Item_Name VARCHAR(20),
    Quantity INT,
    Shop VARCHAR(20),
    PRICE INT,
    FOREIGN KEY (ITEM_NO) REFERENCES PRODUCT(ITEM_NO),
    FOREIGN KEY (SHOP) REFERENCES SHOP(SHOP_NO)
    );
ALTER TABLE SHOP_STOCK DROP COLUMN PRICE;
ALTER TABLE SHOP_STOCK DROP COLUMN ITEM_NAME;    
DROP TABLE STORAGE_STOCK;
CREATE TABLE Storage_stock (
    Item_No VARCHAR(20) PRIMARY KEY,
    Quantity INT,
    Storage VARCHAR(20),
    FOREIGN KEY (ITEM_NO) REFERENCES PRODUCT(ITEM_NO),
    FOREIGN KEY(STORAGE) REFERENCES STORAGE(STORAGE_NO)
    );
--------------------------------------------------------------------------------------------------------------------------
--PROJECT_2
-------------------------------------------------------------------------------------------------------------------------
INSERT INTO Client VALUES ('APPLE', 'SVEN', '111-111-111', 'GERMANY');
INSERT INTO Client VALUES ('BANANA', 'SEVVAL', '222-222-222', 'TURKEY');
INSERT INTO Client VALUES ('ORANGE', 'JONNY', '333-333-333', 'SPAIN');
INSERT INTO Client VALUES ('MELON', 'LUNA', '444-444-444', 'SPAIN');
INSERT INTO Client VALUES ('PEACH', 'CHAIWEI', '555-555-555', 'TAIWAN');

INSERT INTO STORAGE VALUES ('ST01', 'SUN', '123-123','BRNO');
INSERT INTO STORAGE VALUES ('ST02', 'MOON', '456-456','PRAGUE');
INSERT INTO STORAGE VALUES ('ST03', 'STAR', '789-789','ZLIN');    

INSERT INTO SHOP VALUES('SH01','CABBAGE','BRNO','111-222','ST01');
INSERT INTO SHOP VALUES('SH02','CARROT','PRAGUE','333-444','ST03');
INSERT INTO SHOP VALUES('SH03','ONION','ZLIN','555-666','ST02');
    
INSERT INTO SHOP_MANAGER VALUES ('ABC', 'JOHN','SH01','STOCK');
INSERT INTO SHOP_MANAGER VALUES ('DEF', 'Kristoff', 'SH01','SALE');
INSERT INTO SHOP_MANAGER VALUES ('GHI', 'TONY', 'SH01','FINANCE');
INSERT INTO SHOP_MANAGER VALUES ('JKL', 'STIVE','SH01','PERSONNEL');
INSERT INTO SHOP_MANAGER VALUES ('MNO', 'CHRISS', 'SH02','FINANCE');
INSERT INTO SHOP_MANAGER VALUES ('PQR', 'SCOTT', 'SH02', 'SALE');
INSERT INTO SHOP_MANAGER VALUES ('STU', 'OLIVIA', 'SH03', 'SALE');
INSERT INTO SHOP_MANAGER VALUES ('VWX', 'EMMA', 'SH02', 'STOCK');
INSERT INTO SHOP_MANAGER VALUES ('YZA', 'HARRY', 'SH03', 'STOCK');

INSERT INTO STORAGE_MANAGER VALUES ('ABCD', 'BRUCE', 'ST01', 'STOCK');
INSERT INTO STORAGE_MANAGER VALUES ('EFGH', 'NATASHA', 'ST01', 'FINANCE');
INSERT INTO STORAGE_MANAGER VALUES ('IJKL', 'CLINT', 'ST01', 'TRANSACTION');
INSERT INTO STORAGE_MANAGER VALUES ('MNOP', 'WANDA', 'ST02', 'STOCK');
INSERT INTO STORAGE_MANAGER VALUES ('QRST', 'JAMES', 'ST02', 'TRANSACTION');
INSERT INTO STORAGE_MANAGER VALUES ('UVWX', 'BUCKY', 'ST02', 'FINANCE');
INSERT INTO STORAGE_MANAGER VALUES ('YZAB', 'NICK', 'ST02', 'PERSONNEL');
INSERT INTO STORAGE_MANAGER VALUES ('CDEF', 'MARIA', 'ST03', 'STOCK');
INSERT INTO STORAGE_MANAGER VALUES ('GHIJ', 'SHURI', 'ST03', 'TRANSACTION');
INSERT INTO STORAGE_MANAGER VALUES ('KLMN', 'RYAN', 'ST03', 'FINANCE');

INSERT INTO PRODUCT VALUES('P001','MASK','1.5');
INSERT INTO PRODUCT VALUES('P002','TISSUE','5');
INSERT INTO PRODUCT VALUES('P003','TOMATO','2');    
INSERT INTO PRODUCT VALUES('P004','PASTA','3');    
INSERT INTO PRODUCT VALUES('P005','CHOCOLATE','1');    
INSERT INTO PRODUCT VALUES('P006','POTATO_CHIP','1.5');
INSERT INTO PRODUCT VALUES('P007','EGG','4');    
INSERT INTO PRODUCT VALUES('P008','WATER','1');    
INSERT INTO PRODUCT VALUES('P009','MILK','1.3');    
INSERT INTO PRODUCT VALUES('P010','BEER','3');
    
INSERT INTO STORAGE_STOCK VALUES ('P001',50,'ST01');
INSERT INTO STORAGE_STOCK VALUES ('P002',50,'ST01');
INSERT INTO STORAGE_STOCK VALUES ('P003',50,'ST02');
INSERT INTO STORAGE_STOCK VALUES ('P004',50,'ST02');
INSERT INTO STORAGE_STOCK VALUES ('P005',50,'ST02');
INSERT INTO STORAGE_STOCK VALUES ('P006',50,'ST02');
INSERT INTO STORAGE_STOCK VALUES ('P007',50,'ST02');
INSERT INTO STORAGE_STOCK VALUES ('P008',50,'ST03');
INSERT INTO STORAGE_STOCK VALUES ('P009',50,'ST03');
INSERT INTO STORAGE_STOCK VALUES ('P010',50,'ST03');


INSERT INTO SHOP_STOCK VALUES('P001',30,'SH01');    
INSERT INTO SHOP_STOCK VALUES('P002',30,'SH01'); 
INSERT INTO SHOP_STOCK VALUES('P003',30,'SH03'); 
INSERT INTO SHOP_STOCK VALUES('P004',30,'SH03'); 
INSERT INTO SHOP_STOCK VALUES('P005',30,'SH03'); 
INSERT INTO SHOP_STOCK VALUES('P006',30,'SH03'); 
INSERT INTO SHOP_STOCK VALUES('P007',30,'SH03'); 
INSERT INTO SHOP_STOCK VALUES('P008',30,'SH02'); 
INSERT INTO SHOP_STOCK VALUES('P009',30,'SH02'); 
INSERT INTO SHOP_STOCK VALUES('P010',30,'SH02'); 

SELECT
    "A1"."ITEM_NO"    "ITEM_NO",
    "A1"."PRICE"      "PRICE"
FROM
    "XLEEHE00"."PRODUCT" "A1";

INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('001','APPLE','P001',5,2*5,'CASH',TO_DATE('23.03.2020', 'dd.mm.yyyy'));
INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('002','APPLE','P002',3,5*3,'DEBITCARD',TO_DATE('30.03.2020', 'dd.mm.yyyy'));
INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('003','BANANA','P003',3,2*3,'CASH',TO_DATE('07.04.2020', 'dd.mm.yyyy'));
INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('004','BANANA','P004',2,3*2,'CASH',TO_DATE('07.04.2020', 'dd.mm.yyyy'));
INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('005','ORANGE','P005',1,1*1,'CASH',TO_DATE('03.04.2020', 'dd.mm.yyyy'));
INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('006','MELON','P006',4,2*4,'CASH',TO_DATE('29.03.2020', 'dd.mm.yyyy'));
INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('007','PEACH','P007',10,4*10,'DEBITCARD',TO_DATE('23.03.2020', 'dd.mm.yyyy'));
INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('008','ORANGE','P008',6,1*6,'CASH',TO_DATE('25.03.2020', 'dd.mm.yyyy'));
INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('009','MELON','P009',1,1*1,'CASH',TO_DATE('28.03.2020', 'dd.mm.yyyy'));
INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('010','PEACH','P010',8,3*8,'DEBITCARD',TO_DATE('27.03.2020', 'dd.mm.yyyy'));

INSERT INTO INVOICE VALUES(1,'001');
INSERT INTO INVOICE VALUES(2,'002');
INSERT INTO INVOICE VALUES(3,'003');
INSERT INTO INVOICE VALUES(4,'004');
INSERT INTO INVOICE VALUES(5,'005');
INSERT INTO INVOICE VALUES(6,'006');
INSERT INTO INVOICE VALUES(7,'007');
INSERT INTO INVOICE VALUES(8,'008');
INSERT INTO INVOICE VALUES(9,'009');
INSERT INTO INVOICE VALUES(10,'010');

--------------------------------------------------------------------------------------------------------------------------
--PROJECT_3
--------------------------------------------------------------------------------------------------------------------------
--THE NAME OF PRODUCTS THAT CLIENT 'BANANA' PURCHASED
SELECT PRODUCT.ITEM_NAME
FROM PRODUCT, TRANSACTION
WHERE TRANSACTION.CLIENT='BANANA' AND TRANSACTION.ITEM=PRODUCT.ITEM_NO;

--WHERE CAN I BUY PRODUCT 'P001'?
SELECT SHOP_NAME, Shop_Address
FROM SHOP
WHERE EXISTS(SELECT * FROM SHOP_STOCK WHERE ITEM_NO='P001' 
                                            AND shop.shop_no=SHOP_STOCK.SHOP);

--TOTAL PRICE THAT EACH CLIENT SPENT SO FAR
SELECT CLIENT, SUM(TOTAL_PRICE) AS TOTAL_PRICE
FROM transaction
GROUP BY CLIENT;

--THE LIST OF NAME OF PRODUCTS THAT SHOP CABBAGE HAS
CREATE OR REPLACE VIEW T1(ITEM_NO,NAME,SHOP) AS
SELECT PRODUCT.ITEM_NO, PRODUCT.ITEM_NAME, SHOP_STOCK.SHOP
FROM PRODUCT, SHOP_STOCK
WHERE PRODUCT.ITEM_NO=SHOP_STOCK.ITEM_NO;

SELECT * 
FROM T1
WHERE SHOP=(SELECT SHOP_NO
            FROM SHOP
            WHERE SHOP_NAME='CABBAGE');



--------------------------------------------------------------------------------------------------------------------------
--THIS_WEEK_TASK_PROJECT_4
-------------------------------------------------------------------------------------------------------------------------

CREATE INDEX PRODUCE_PRICE_IDX ON PRODUCT(PRICE);
CREATE INDEX TOTAL_PRICE_IDX ON TRANSACTION(TOTAL_PRICE);
---------------------------------------------------
CREATE OR REPLACE TRIGGER UPDATE_ID
    AFTER UPDATE OF CLIENT_ID ON CLIENT
    REFERENCING OLD AS PRE NEW AS POST
    FOR EACH ROW
BEGIN
    UPDATE TRANSACTION SET CLIENT = :POST.CLIENT_ID
    WHERE CLIENT= :PRE.CLIENT_ID;
END;

UPDATE CLIENT SET CLIENT_ID='STARFRUIT'
WHERE CLIENT_ID='APPLE';

SELECT A.CLIENT_ID, A.CLIENT_NAME,B.CLIENT
FROM CLIENT A, TRANSACTION B
WHERE CLIENT_ID='STARFRUIT'
    AND A.CLIENT_ID=B.CLIENT ;
-----------------------------------------------------------
CREATE OR REPLACE PROCEDURE REMOVE_SHOP_MANAGER(
    ID VARCHAR
)
AS BEGIN 
    DELETE FROM SHOP_MANAGER
    WHERE SHOP_MANAGER.MANAGER_ID = REMOVE_SHOP_MANAGER.ID;
END;    

EXEC REMOVE_SHOP_MANAGER('DEF');
---------------------------------------------------------
ALTER TABLE CLIENT
    ADD GRADE VARCHAR(20);

CREATE OR REPLACE TRIGGER UP_GRADE
 AFTER INSERT ON TRANSACTION
 BEGIN
    UPDATE CLIENT SET GRADE='VIP'
    WHERE CLIENT.CLIENT_ID IN (SELECT TRANSACTION.client
                                FROM TRANSACTION
                                GROUP BY CLIENT having sum(total_price)>100);
 END;



INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('011','PEACH','P001',10,1.5*10,'DEBITCARD',TO_DATE('28.04.2020', 'dd.mm.yyyy'));
INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('012','PEACH','P002',10,5*10,'DEBITCARD',TO_DATE('28.04.2020', 'dd.mm.yyyy'));    
INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('013','STARFRUIT','P010',15,3*15,'DEBITCARD',TO_DATE('28.04.2020', 'dd.mm.yyyy'));
INSERT INTO TRANSACTION(ORDER_NO,CLIENT,ITEM,QUANTITY,TOTAL_PRICE,PAYMENT_METHOD,ORDER_DATE) 
    VALUES('014','STARFRUIT','P007',10,4*10,'DEBITCARD',TO_DATE('28.04.2020', 'dd.mm.yyyy'));        

SELECT CLIENT, SUM(TOTAL_PRICE) AS TOTAL_ORDER_PRICE
FROM TRANSACTION GROUP BY CLIENT ORDER BY TOTAL_ORDER_PRICE DESC;

SELECT CLIENT_ID, GRADE
FROM CLIENT WHERE GRADE IS NOT NULL;

