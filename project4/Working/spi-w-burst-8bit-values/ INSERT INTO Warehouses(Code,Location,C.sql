-- Table: Warehouses
CREATE TABLE Warehouses (
    Code INTEGER PRIMARY KEY,
    Location TEXT NOT NULL,
    Capacity INTEGER NOT NULL
);

-- Table: Producers
CREATE TABLE Producers (
    Code INTEGER PRIMARY KEY,
    Name TEXT NOT NULL
);

-- Table: Boxes2
CREATE TABLE Boxes2 (
    Code TEXT PRIMARY KEY,
    Contents TEXT NOT NULL,
    Value REAL NOT NULL,
    Warehouse INTEGER NOT NULL,
    Producer INTEGER NOT NULL,
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code),
    FOREIGN KEY (Producer) REFERENCES Producers(Code)
);

INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(6,'San Francisco',7);

INSERT INTO Producers(Code,Name) VALUES(11,'Hal');
INSERT INTO Producers(Code,Name) VALUES(12,'Archie');
INSERT INTO Producers(Code,Name) VALUES(13,'Rebecca');
INSERT INTO Producers(Code,Name) VALUES(14,'Annie');
INSERT INTO Producers(Code,Name) VALUES(15,'Bob');

INSERT INTO Boxes2(Code,Contents,Value,Warehouse,Producer) VALUES('0MN7','Rocks',180,3,11);
INSERT INTO Boxes2(Code,Contents,Value,Warehouse,Producer) VALUES('4H8P','Rocks',250,1,11);
INSERT INTO Boxes2(Code,Contents,Value,Warehouse,Producer) VALUES('4RT3','Scissors',190,4,11);
INSERT INTO Boxes2(Code,Contents,Value,Warehouse,Producer) VALUES('7G3H','Rocks',200,1,14);
INSERT INTO Boxes2(Code,Contents,Value,Warehouse,Producer) VALUES('8JN6','Papers',75,1,12);
INSERT INTO Boxes2(Code,Contents,Value,Warehouse,Producer) VALUES('8Y6U','Papers',50,3,13);
INSERT INTO Boxes2(Code,Contents,Value,Warehouse,Producer) VALUES('9J6F','Papers',175,2,14);
INSERT INTO Boxes2(Code,Contents,Value,Warehouse,Producer) VALUES('LL08','Rocks',140,4,13);
INSERT INTO Boxes2(Code,Contents,Value,Warehouse,Producer) VALUES('P0H6','Scissors',125,1,14);
INSERT INTO Boxes2(Code,Contents,Value,Warehouse,Producer) VALUES('P2T6','Scissors',150,2,11);
INSERT INTO Boxes2(Code,Contents,Value,Warehouse,Producer) VALUES('TU55','Papers',90,5,11);
INSERT INTO Boxes2(Code,Contents,Value,Warehouse,Producer) VALUES('TW22','Scissors',160,6,11);
INSERT INTO Boxes2(Code,Contents,Value,Producer) VALUES('AB15','Glues',120,13);
INSERT INTO Boxes2(Code,Contents,Value,Producer) VALUES('AG22','Rocks',100,15);

---
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);

--
INSERT INTO Departments(Code,Name,Budget)
VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget)
VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human
Resources',240000);
INSERT INTO Departments(Code,Name,Budget)
VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department)
VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department)
VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-
Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department)
VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);