CREATE TABLE VEHICLE (
    VechileID int NOT NULL,
    Description varchar(255) NOT NULL,
    Year int NOT NULL,
    Type int NOT NULL,
    Category int NOT NULL,
    PRIMARY KEY (VehicleID)
);

CREATE TABLE RATE (
    Type int NOT NULL,
    Category int NOT NULL,
    Weekly int NOT NULL,
    Daily int NOT NULL
);

--Q1
--Insert yourself as a new customer. Do not provide the customerID in your query
INSERT INTO CUSTOMER (Name, Phone)
VALUES ('D. Baes', '(636) 555-3226');

--Q2
-- Update your phone number to (837) 721-8965
UPDATE CUSTOMER
SET Phone = '(837) 721-8965'
WHERE Name = 'D. Baes';

--Q3
-- Increase only daily rates for luxury vehicles by 5%


--Q4
--A
-- Insert a new luxury van with the following info: Honda Odyssey 2019, vehicle id: 5FNRL6H58KB133711
INSERT INTO VEHICLE
VALUES ('5FNRL6H58KB133711', 'Honda Odyssey', '2019', 4, 1);

--Q4
--B
-- You also need to insert the following rates
INSERT INTO RATE
VALUES  (5, 1, 900, 150), 
        (6, 1, 800, 135);
