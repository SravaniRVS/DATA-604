-- drop 
-- DROP SCHEMA Sales;
-- DROP SCHEMA Stats;
-- DROP SCHEMA Production;
-- DROP SCHEMA HR;


--- Create schemas
CREATE SCHEMA HR;
CREATE SCHEMA Production;
CREATE SCHEMA Sales;
CREATE SCHEMA Stats;


Use HR;


---------------------------------------------------------------------
-- Create Tables
---------------------------------------------------------------------

-- Create table Employees
CREATE TABLE Employees
(
  empid           INT          NOT NULL,
  lastname        NVARCHAR(20) NOT NULL,
  firstname       VARCHAR(10) NOT NULL,
  title           VARCHAR(30) NOT NULL,
  titleofcourtesy VARCHAR(25) NOT NULL,
  birthdate       DATE         NOT NULL,
  hiredate        DATE         NOT NULL,
  address         VARCHAR(60) NOT NULL,
  city            VARCHAR(15) NOT NULL,
  region          VARCHAR(15) NULL,
  postalcode      VARCHAR(10) NULL,
  country         VARCHAR(15) NOT NULL,
  phone           VARCHAR(24) NOT NULL,
  mgrid           INT          NULL,
  CONSTRAINT PK_Employees PRIMARY KEY(empid),
  CONSTRAINT FK_Employees_Employees FOREIGN KEY(mgrid)
    REFERENCES Employees(empid),
  CONSTRAINT CHK_birthdate CHECK(birthdate <= CAST(SYSDATE() AS DATE))
);

CREATE  INDEX idx_nc_lastname   ON Employees(lastname);
CREATE  INDEX idx_nc_postalcode ON Employees(postalcode);

Use Production;
-- Drop tables


-- Create table Production.Suppliers

CREATE TABLE Suppliers
(
  supplierid   INT          NOT NULL ,
  companyname  NVARCHAR(40) NOT NULL,
  contactname  NVARCHAR(30) NOT NULL,
  contacttitle NVARCHAR(30) NOT NULL,
  address      NVARCHAR(60) NOT NULL,
  city         NVARCHAR(15) NOT NULL,
  region       NVARCHAR(15) NULL,
  postalcode   NVARCHAR(10) NULL,
  country      NVARCHAR(15) NOT NULL,
  phone        NVARCHAR(24) NOT NULL,
  fax          NVARCHAR(24) NULL,
  CONSTRAINT PK_Suppliers PRIMARY KEY(supplierid)
);

CREATE  INDEX idx_nc_companyname ON Suppliers(companyname);
CREATE  INDEX idx_nc_postalcode  ON Suppliers(postalcode);

-- Create table Categories
CREATE TABLE Categories
(
  categoryid   INT           NOT NULL,
  categoryname NVARCHAR(15)  NOT NULL,
  description  NVARCHAR(200) NOT NULL,
  CONSTRAINT PK_Categories PRIMARY KEY(categoryid)
);

CREATE  INDEX idx_nc_categoryname ON Categories(categoryname);

-- Create table Products
CREATE TABLE Products
(
  productid    INT          NOT NULL ,
  productname  NVARCHAR(40) NOT NULL,
  supplierid   INT          NOT NULL,
  categoryid   INT          NOT NULL,
  unitprice    decimal(15,2)  NOT NULL DEFAULT 0,
  discontinued BIT          NOT NULL DEFAULT 0,
  CONSTRAINT PK_Products PRIMARY KEY(productid),
  CONSTRAINT FK_Products_Categories FOREIGN KEY(categoryid)
    REFERENCES Categories(categoryid),
  CONSTRAINT FK_Products_Suppliers FOREIGN KEY(supplierid)
    REFERENCES Suppliers(supplierid),
  CONSTRAINT CHK_Products_unitprice CHECK(unitprice >= 0)
);

CREATE  INDEX idx_nc_categoryid  ON Products(categoryid);
CREATE  INDEX idx_nc_productname ON Products(productname);
CREATE  INDEX idx_nc_supplierid  ON Products(supplierid);

Use Sales;



-- Create table Customers
CREATE TABLE Customers
(
  custid       INT          NOT NULL ,
  companyname  NVARCHAR(40) NOT NULL,
  contactname  NVARCHAR(30) NOT NULL,
  contacttitle NVARCHAR(30) NOT NULL,
  address      NVARCHAR(60) NOT NULL,
  city         NVARCHAR(15) NOT NULL,
  region       NVARCHAR(15) NULL,
  postalcode   NVARCHAR(10) NULL,
  country      NVARCHAR(15) NOT NULL,
  phone        NVARCHAR(24) NOT NULL,
  fax          NVARCHAR(24) NULL,
  CONSTRAINT PK_Customers PRIMARY KEY(custid)
);

CREATE INDEX idx_nc_city        ON Customers(city);
CREATE INDEX idx_nc_companyname ON Customers(companyname);
CREATE INDEX idx_nc_postalcode  ON Customers(postalcode);
CREATE INDEX idx_nc_region      ON Customers(region);

-- Create table Shippers
CREATE TABLE Shippers
(
  shipperid   INT          NOT NULL ,
  companyname NVARCHAR(40) NOT NULL,
  phone       NVARCHAR(24) NOT NULL,
  CONSTRAINT PK_Shippers PRIMARY KEY(shipperid)
);

-- Create table Orders
CREATE TABLE Orders
(
  orderid        INT          NOT NULL ,
  custid         INT          NULL,
  empid          INT          NOT NULL,
  orderdate      DATE         NOT NULL,
  requireddate   DATE         NOT NULL,
  shippeddate    DATE         NULL,
  shipperid      INT          NOT NULL,
  freight        Decimal (15,2)        NOT NULL
     DEFAULT(0),
  shipname       VARCHAR(40) NOT NULL,
  shipaddress    VARCHAR(60) NOT NULL,
  shipcity       VARCHAR(15) NOT NULL,
  shipregion     VARCHAR(15) NULL,
  shippostalcode VARCHAR(10) NULL,
  shipcountry    VARCHAR(15) NOT NULL,
  CONSTRAINT PK_Orders PRIMARY KEY(orderid),
  CONSTRAINT FK_Orders_Customers FOREIGN KEY(custid)
    REFERENCES Customers(custid),
  CONSTRAINT FK_Orders_Employees FOREIGN KEY(empid)
    REFERENCES HR.Employees(empid),
  CONSTRAINT FK_Orders_Shippers FOREIGN KEY(shipperid)
    REFERENCES Shippers(shipperid)
);

CREATE INDEX idx_nc_custid         ON Orders(custid);
CREATE INDEX idx_nc_empid          ON Orders(empid);
CREATE INDEX idx_nc_shipperid      ON Orders(shipperid);
CREATE INDEX idx_nc_orderdate      ON Orders(orderdate);
CREATE INDEX idx_nc_shippeddate    ON Orders(shippeddate);
CREATE INDEX idx_nc_shippostalcode ON Orders(shippostalcode);

-- Create table OrderDetails
CREATE TABLE OrderDetails
(
  orderid   INT           NOT NULL,
  productid INT           NOT NULL,
  unitprice Decimal (15,2)         NOT NULL
     DEFAULT(0),
  qty       SMALLINT      NOT NULL
     DEFAULT(1),
  discount  NUMERIC(4, 3) NOT NULL
    DEFAULT(0),
  CONSTRAINT PK_OrderDetails PRIMARY KEY(orderid, productid),
  CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY(orderid)
    REFERENCES Orders(orderid),
  CONSTRAINT FK_OrderDetails_Products FOREIGN KEY(productid)
    REFERENCES Production.Products(productid),
  CONSTRAINT CHK_discount  CHECK (discount BETWEEN 0 AND 1),
  CONSTRAINT CHK_qty  CHECK (qty > 0),
  CONSTRAINT CHK_unitprice CHECK (unitprice >= 0)
);

CREATE INDEX idx_nc_orderid   ON OrderDetails(orderid);
CREATE INDEX idx_nc_productid ON OrderDetails(productid);

Use Stats;


-- Create table Tests
CREATE TABLE Tests
(
  testid    VARCHAR(10) NOT NULL,
  CONSTRAINT PK_Tests PRIMARY KEY(testid)
);

-- Create table Scores
CREATE TABLE Scores
(
  testid    VARCHAR(10) NOT NULL,
  studentid VARCHAR(10) NOT NULL,
  score     TINYINT     NOT NULL
     CHECK (score BETWEEN 0 AND 100),
  CONSTRAINT PK_Scores PRIMARY KEY(testid, studentid),
  CONSTRAINT FK_Scores_Tests FOREIGN KEY(testid)
    REFERENCES Tests(testid)
);

CREATE INDEX idx_nc_testid_score ON Scores(testid, score);



-- Create table Nums

CREATE TABLE Nums(n INT NOT NULL, CONSTRAINT PK_Nums PRIMARY KEY(n));