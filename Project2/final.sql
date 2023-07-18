CREATE TABLE CUSTOMER (
    CustId INT NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    PRIMARY KEY(CustId)
);

CREATE TABLE RENTAL(
    CustId INT NOT NULL,
    VehicleID VARCHAR(20) NOT NULL,
    StartDate DATE NOT NULL,
    OrderDate DATE NOT NULL,
    RentalType INT NOT NULL,
    Qty INT NOT NULL,
    ReturnDate DATE NOT NULL,
    TotalAmount DECIMAL NOT NULL,
    PaymentDate DATE NOT NULL,
    FOREIGN KEY (VehicleID) REFERENCES VEHICLE(VehicleID),
    FOREIGN KEY (CustId) REFERENCES CUSTOMER(CustId)
);
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