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
--TASK 3 ---
-- QUESTION 5: 
SELECT VEHICLE.VehicleID as VIN,
    Description,
    Year,
    SUM(julianday(ReturnDate) - julianday(StartDate)) AS days
FROM VEHICLE,
    RENTAL
WHERE Type = '1'
    AND Category = '1'
    AND (
        ReturnDate < '06-01-2019'
        or StartDate > '06-20-2019'
    )
    AND VIN = RENTAL.VehicleID
GROUP BY VIN;
-- QUESTION 6
SELECT Name,
    SUM(TotalAmount) as Balance
FROM CUSTOMER,
    RENTAL
WHERE RENTAL.CustId = CUSTOMER.CustId
    AND CUSTOMER.CustID = '221'
    AND PaymentDate == NULL;
-- QUESTION 7
SELECT DISTINCT VehicleID as VIN,
    Description,
    Year,
    Weekly as WeeklyRate,
    Daily as DailyRate,
    CASE
        WHEN VEHICLE.Type = '1' THEN 'Compact'
        WHEN VEHICLE.Type = '2' THEN 'Medium'
        WHEN VEHICLE.Type = '3' THEN 'Large'
        WHEN VEHICLE.Type = '4' THEN 'SUV'
        WHEN VEHICLE.Type = '5' THEN 'Truck'
        WHEN VEHICLE.Type = '6' THEN 'VAN'
    END as Types,
    CASE
        WHEN VEHICLE.Category = '0' THEN 'Basic'
        WHEN VEHICLE.Category = '1' THEN 'Luxury'
    END as Categories,
    VEHICLE.Type,
    VEHICLE.Category
FROM VEHICLE,
    RATE
WHERE VEHICLE.Type = RATE.Type
    AND VEHICLE.Category = RATE.Category
ORDER BY VEHICLE.Category DESC,
    VEHICLE.Type ASC;
--QUESTION 8
SELECT SUM(TotalAmount) as TotalPaid
FROM RENTAL as R
WHERE R.PaymentDate is NOT NULL;
-- Q 9a 
SELECT Description,
    Year,
    CASE
        WHEN V.Type = '1' THEN 'Compact'
        WHEN V.Type = '2' THEN 'Medium'
        WHEN V.Type = '3' THEN 'Large'
        WHEN V.Type = '4' THEN 'SUV'
        WHEN V.Type = '5' THEN 'Truck'
        WHEN V.Type = '6' THEN 'VAN'
    END as Type,
    CASE
        WHEN V.Category = '0' THEN 'Basic'
        WHEN V.Category = '1' THEN 'Luxury'
    END as Category,
    TotalAmount / R.Qty as UnitPrice,
    (julianday(ReturnDate) - julianday(StartDate)) AS days,
    TotalAmount as TotalAmount,
    PaymentDate
FROM VEHICLE as V,
    RENTAL as R,
    CUSTOMER as C
WHERE Name = 'J. Brown'
    AND V.VehicleID = R.VehicleID
    AND C.CustID = R.CustID
ORDER BY StartDate;