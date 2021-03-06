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
