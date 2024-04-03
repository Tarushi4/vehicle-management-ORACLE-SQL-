CREATE TABLE Brandtable (
    brand_name VARCHAR(100) PRIMARY KEY,
    company_name VARCHAR(100)
);

CREATE TABLE Suppliertable (
    supplier_name VARCHAR(100),
    supplier_location VARCHAR(100),
    supplierID INT PRIMARY KEY
);

CREATE TABLE CarModeltable (
    modelID INT PRIMARY KEY,
    model_name VARCHAR(100),
    model_year INT,
    body_style VARCHAR(100),
    brand_name VARCHAR(100),
    FOREIGN KEY (brand_name) REFERENCES Brandtable(brand_name)
);

CREATE TABLE Optionstable (
    optionID INT PRIMARY KEY,
    engine VARCHAR(100),
    transmission VARCHAR(100),
    color VARCHAR(100),
    modelID INT,
    FOREIGN KEY (modelID) REFERENCES CarModeltable(modelID)
);

CREATE TABLE Dealertable (
    DealerID INT PRIMARY KEY,
    name VARCHAR(100),
    dealer_location VARCHAR(100)
);

CREATE TABLE Customertable (
    customerID INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(15),
    gender CHAR(1),
    income DECIMAL(10, 2)
);

CREATE TABLE Vehicletable (
    vehicleID INT PRIMARY KEY,
    optionID INT,
    model_name VARCHAR(100),
    inventory INT,
    customerID INT,
    manufacturerID INT,
    FOREIGN KEY (optionID) REFERENCES Optionstable(optionID),
    FOREIGN KEY (customerID) REFERENCES Customertable(customerID)
);

CREATE TABLE Inventorytable (
    inventoryID INT PRIMARY KEY,
    inventory_location VARCHAR(100),
    vehicleID INT,
    FOREIGN KEY (vehicleID) REFERENCES Vehicletable(vehicleID)
);

CREATE TABLE Saletable (
    invoiceID INT PRIMARY KEY,
    customerID INT,
    DealerID INT,
    vehicleID INT,
    sale_date DATE,
    price DECIMAL(10, 2),
    FOREIGN KEY (customerID) REFERENCES Customertable(customerID),
    FOREIGN KEY (DealerID) REFERENCES Dealertable(DealerID),
    FOREIGN KEY (vehicleID) REFERENCES Vehicletable(vehicleID)
);

CREATE TABLE Suppliestable (
    part_type VARCHAR(100),
    part_date DATE,
    supply_date DATE,
    supplierID INT,
    FOREIGN KEY (supplierID) REFERENCES Suppliertable(supplierID)
);

CREATE TABLE Manufacturertable (
    manufacturer_name VARCHAR(100),
    manufacturerID INT PRIMARY KEY,
    manufacturer_location VARCHAR(100),
    vehicleeID INT,
    FOREIGN KEY (vehicleeID) REFERENCES Vehicletable(vehicleID)
);


-- Brandtable
insert into Brandtable values ('Toyota', 'Toyota Motor Corporation');
insert into Brandtable values ('Honda', 'Honda Motor Co., Ltd.');
insert into Brandtable values ('Ford', 'Ford Motor Company');
insert into Brandtable values ('BMW', 'Bayerische Motoren Werke AG');
insert into Brandtable values ('Mercedes-Benz', 'Daimler AG');
insert into Brandtable values ('Audi', 'Audi AG');
insert into Brandtable values ('Chevrolet', 'Chevrolet');
insert into Brandtable values ('Volkswagen', 'Volkswagen Group');
insert into Brandtable values ('Nissan', 'Nissan Motor Corporation');
insert into Brandtable values ('Hyundai', 'Hyundai Motor Company');
insert into Brandtable values ('Kia', 'Kia Corporation');
insert into Brandtable values ('Tesla', 'Tesla, Inc.');
insert into Brandtable values ('Subaru', 'Subaru Corporation');
insert into Brandtable values ('Mazda', 'Mazda Motor Corporation');
insert into Brandtable values ('Lexus', 'Lexus');

-- Suppliertable
insert into Suppliertable values ('ABC Parts Supplier', 'New York', 101);
insert into Suppliertable values ('XYZ Auto Parts', 'Los Angeles', 102);
insert into Suppliertable values ('Best Car Accessories', 'Chicago', 103);
insert into Suppliertable values ('Auto Tech Solutions', 'Houston', 104);
insert into Suppliertable values ('Global Automotive', 'Detroit', 105);
insert into Suppliertable values ('Superior Auto Parts', 'San Francisco', 106);
insert into Suppliertable values ('Perfect Motors', 'Seattle', 107);
insert into Suppliertable values ('Speedy Auto', 'Miami', 108);
insert into Suppliertable values ('Quality Car Parts', 'Dallas', 109);
insert into Suppliertable values ('Auto City', 'Atlanta', 110);
insert into Suppliertable values ('Pro Auto Parts', 'Boston', 111);
insert into Suppliertable values ('Car World', 'Phoenix', 112);
insert into Suppliertable values ('Auto Masters', 'Denver', 113);
insert into Suppliertable values ('Top Gear Motors', 'Las Vegas', 114);
insert into Suppliertable values ('Prime Auto Accessories', 'Orlando', 115);

-- CarModeltable
insert into CarModeltable values (1, 'Camry', 2023, 'Sedan', 'Toyota');
insert into CarModeltable values (2, 'Civic', 2022, 'Sedan', 'Honda');
insert into CarModeltable values (3, 'Accord', 2023, 'Sedan', 'Honda');
insert into CarModeltable values (4, 'Mustang', 2022, 'Coupe', 'Ford');
insert into CarModeltable values (5, '3 Series', 2023, 'Sedan', 'BMW');
insert into CarModeltable values (6, 'C-Class', 2022, 'Sedan', 'Mercedes-Benz');
insert into CarModeltable values (7, 'A4', 2022, 'Sedan', 'Audi');
insert into CarModeltable values (8, 'Cruze', 2023, 'Sedan', 'Chevrolet');
insert into CarModeltable values (9, 'Golf', 2022, 'Hatchback', 'Volkswagen');
insert into CarModeltable values (10, 'Altima', 2023, 'Sedan', 'Nissan');
insert into CarModeltable values (11, 'Elantra', 2022, 'Sedan', 'Hyundai');
insert into CarModeltable values (12, 'Optima', 2023, 'Sedan', 'Kia');
insert into CarModeltable values (13, 'Model S', 2023, 'Sedan', 'Tesla');
insert into CarModeltable values (14, 'Outback', 2022, 'SUV', 'Subaru');
insert into CarModeltable values (15, 'CX-5', 2022, 'SUV', 'Mazda');

-- Optionstable
insert into Optionstable values (101, 'V6', 'Automatic', 'Red', 1);
insert into Optionstable values (102, 'I4', 'CVT', 'Black', 2);
insert into Optionstable values (103, 'V6', 'Automatic', 'Blue', 3);
insert into Optionstable values (104, 'V8', 'Manual', 'Yellow', 4);
insert into Optionstable values (105, 'I4', 'Automatic', 'White', 5);
insert into Optionstable values (106, 'V6', 'Automatic', 'Silver', 6);
insert into Optionstable values (107, 'I4', 'Automatic', 'Gray', 7);
insert into Optionstable values (108, 'I4', 'Automatic', 'Green', 8);
insert into Optionstable values (109, 'I4', 'Automatic', 'Red', 9);
insert into Optionstable values (110, 'V6', 'Automatic', 'Blue', 10);
insert into Optionstable values (111, 'I4', 'Automatic', 'Black', 11);
insert into Optionstable values (112, 'I4', 'Automatic', 'White', 12);
insert into Optionstable values (113, 'Electric', 'Automatic', 'Red', 13);
insert into Optionstable values (114, 'I4', 'Automatic', 'Gray', 14);
insert into Optionstable values (115, 'I4', 'Automatic', 'Blue', 15);

-- Dealertable
insert into Dealertable values (301, 'ABC Dealership', 'New York');
insert into Dealertable values (302, 'XYZ Motors', 'Los Angeles');
insert into Dealertable values (303, 'Best Cars', 'Chicago');
insert into Dealertable values (304, 'Auto Haven', 'Houston');
insert into Dealertable values (305, 'Speed Motors', 'Detroit');
insert into Dealertable values (306, 'City Auto Sales', 'San Francisco');
insert into Dealertable values (307, 'Prime Dealers', 'Seattle');
insert into Dealertable values (308, 'Sunshine Autos', 'Miami');
insert into Dealertable values (309, 'Highway Motors', 'Dallas');
insert into Dealertable values (310, 'Metro Auto', 'Atlanta');
insert into Dealertable values (311, 'Super Cars', 'Boston');
insert into Dealertable values (312, 'Phoenix Auto', 'Phoenix');
insert into Dealertable values (313, 'Mountain Motors', 'Denver');
insert into Dealertable values (314, 'Vegas Auto', 'Las Vegas');
insert into Dealertable values (315, 'Magic Motors', 'Orlando');

-- Customertable
insert into Customertable values (401, 'John Smith', '123 Main St', '555-1234', 'M', 50000.00);
insert into Customertable values (402, 'Jane Doe', '456 Elm St', '555-5678', 'F', 60000.00);
insert into Customertable values (403, 'Mike Johnson', '789 Oak St', '555-9012', 'M', 75000.00);
insert into Customertable values (404, 'Emily Brown', '101 Pine St', '555-3456', 'F', 40000.00);
insert into Customertable values (405, 'David Wilson', '222 Maple St', '555-7890', 'M', 80000.00);
insert into Customertable values (406, 'Sarah Lee', '333 Birch St', '555-2345', 'F', 55000.00);
insert into Customertable values (407, 'Chris Anderson', '444 Cedar St', '555-6789', 'M', 70000.00);
insert into Customertable values (408, 'Lisa Taylor', '555 Walnut St', '555-1234', 'F', 65000.00);
insert into Customertable values (409, 'Mark Thompson', '666 Ash St', '555-5678', 'M', 85000.00);
insert into Customertable values (410, 'Laura Martinez', '777 Pine St', '555-9012', 'F', 45000.00);
insert into Customertable values (411, 'James Garcia', '888 Oak St', '555-3456', 'M', 90000.00);
insert into Customertable values (412, 'Amanda Hernandez', '999 Elm St', '555-7890', 'F', 70000.00);
insert into Customertable values (413, 'Daniel Lopez', '121 Cedar St', '555-2345', 'M', 60000.00);
insert into Customertable values (414, 'Jennifer Perez', '131 Birch St', '555-6789', 'F', 75000.00);
insert into Customertable values (415, 'Matthew Rodriguez', '141 Walnut St', '555-1234', 'M', 95000.00);

-- Vehicletable
insert into Vehicletable values (501, 101, 'Camry', 10, NULL, 201);
insert into Vehicletable values (502, 102, 'Civic', 8, NULL, 202);
insert into Vehicletable values (503, 103, 'Accord', 7, NULL, 202);
insert into Vehicletable values (504, 104, 'Mustang', 5, NULL, 203);
insert into Vehicletable values (505, 105, '3 Series', 12, NULL, 204);
insert into Vehicletable values (506, 106, 'C-Class', 9, NULL, 205);
insert into Vehicletable values (507, 107, 'A4', 6, NULL, 206);
insert into Vehicletable values (508, 108, 'Cruze', 15, NULL, 207);
insert into Vehicletable values (509, 109, 'Golf', 14, NULL, 208);
insert into Vehicletable values (510, 110, 'Altima', 11, NULL, 209);
insert into Vehicletable values (511, 111, 'Elantra', 13, NULL, 210);
insert into Vehicletable values (512, 112, 'Optima', 10, NULL, 211);
insert into Vehicletable values (513, 113, 'Model S', 7, NULL, 212);
insert into Vehicletable values (514, 114, 'Outback', 9, NULL, 213);
insert into Vehicletable values (515, 115, 'CX-5', 11, NULL, 214);

-- Inventorytable
insert into Inventorytable values (601, 'New York', 501);
insert into Inventorytable values (602, 'Los Angeles', 502);
insert into Inventorytable values (603, 'Chicago', 503);
insert into Inventorytable values (604, 'Houston', 504);
insert into Inventorytable values (605, 'New York', 505);
insert into Inventorytable values (606, 'Los Angeles', 506);
insert into Inventorytable values (607, 'Chicago', 507);
insert into Inventorytable values (608, 'Houston', 508);
insert into Inventorytable values (609, 'New York', 509);
insert into Inventorytable values (610, 'Los Angeles', 510);
insert into Inventorytable values (611, 'Chicago', 511);
insert into Inventorytable values (612, 'Houston', 512);
insert into Inventorytable values (613, 'New York', 513);
insert into Inventorytable values (614, 'Los Angeles', 514);
insert into Inventorytable values (615, 'Chicago', 515);

-- Saletable
insert into Saletable values (701, 401, 301, 501, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 25000.00);
insert into Saletable values (702, 402, 302, 502, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 23000.00);
insert into Saletable values (703, 403, 303, 503, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 28000.00);
insert into Saletable values (704, 404, 304, 504, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 35000.00);
insert into Saletable values (705, 405, 305, 505, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 45000.00);
insert into Saletable values (706, 406, 306, 506, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 40000.00);
insert into Saletable values (707, 407, 307, 507, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 38000.00);
insert into Saletable values (708, 408, 308, 508, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 27000.00);
insert into Saletable values (709, 409, 309, 509, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 32000.00);
insert into Saletable values (710, 410, 310, 510, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 29000.00);
insert into Saletable values (711, 411, 311, 511, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 27000.00);
insert into Saletable values (712, 412, 312, 512, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 26000.00);
insert into Saletable values (713, 413, 313, 513, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 60000.00);
insert into Saletable values (714, 414, 314, 514, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 35000.00);
insert into Saletable values (715, 415, 315, 515, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 32000.00);

-- Suppliestable
insert into Suppliestable values ('Engine Oil', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 101);
insert into Suppliestable values ('Brake Pads', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 102);
insert into Suppliestable values ('Air Filters', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 103);
insert into Suppliestable values ('Spark Plugs', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 104);
insert into Suppliestable values ('Headlights', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 105);
insert into Suppliestable values ('Windshield Wipers', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 106);
insert into Suppliestable values ('Tires', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 107);
insert into Suppliestable values ('Batteries', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 108);
insert into Suppliestable values ('Radiators', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 109);
insert into Suppliestable values ('Alternators', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 110);
insert into Suppliestable values ('Starter Motors', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 111);
insert into Suppliestable values ('Fuel Filters', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 112);
insert into Suppliestable values ('Oxygen Sensors', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 113);
insert into Suppliestable values ('Catalytic Converters', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 114);
insert into Suppliestable values ('Thermostats', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 115);

-- Manufacturertable
insert into Manufacturertable values ('Toyota Motor Corporation', 201, 'Japan', 501);
insert into Manufacturertable values ('Honda Motor Co., Ltd.', 202, 'Japan', 502);
insert into Manufacturertable values ('Ford Motor Company', 203, 'USA', 503);
insert into Manufacturertable values ('Ford Motor Company', 204, 'Canada', 504);
insert into Manufacturertable values ('BMW AG', 205, 'Germany', 505);
insert into Manufacturertable values ('Daimler AG', 206, 'Germany', 506);
insert into Manufacturertable values ('Audi AG', 207, 'Germany', 507);
insert into Manufacturertable values ('Chevrolet', 208, 'USA', 508);
insert into Manufacturertable values ('Volkswagen Group', 209, 'Germany', 509);
insert into Manufacturertable values ('Nissan Motor Corporation', 210, 'Japan', 510);
insert into Manufacturertable values ('Hyundai Motor Company', 211, 'South Korea', 511);
insert into Manufacturertable values ('Kia Corporation', 212, 'South Korea', 512);
insert into Manufacturertable values ('Tesla, Inc.', 213, 'USA', 513);
insert into Manufacturertable values ('Subaru Corporation', 214, 'Japan', 514);
insert into Manufacturertable values ('Mazda Motor Corporation', 215, 'Japan', 515);

