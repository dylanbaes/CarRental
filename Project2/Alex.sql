--Question 9a:

--Create a report for the J. Brown customer with all vehicles he rented. List the description, 
--year, type, and category. Also, calculate the unit price for every rental, the total duration mention if it is 
--on weeks or days, the total amount, and if there is any payment. Similarly, as in Question 7, you need to 
--change the numeric values to the corresponding text. Order the results by the StartDate. 
SELECT Description, 
Year,
replace(replace(replace(replace(replace(replace(V.Type,'1','Compact'),'2','Medium'),'3','Large'),'4','SUV'),'5','Truck'),'6','VAN') as Type,
replace(replace(Category,'0','Basic'),'1','Luxury') as Category,
Qty, 
replace(replace(RentalType, 1, 'days'),7,'weeks') as Term, 
TotalAmount, 
replace(replace(PaymentDate,'NULL', 'NONE'),PaymentDate, 'PAID') as Payment,
(TotalAmount/Qty) as UnitPrice
FROM CUSTOMER C, VEHICLE V, RENTAL R
WHERE C.Name = 'J. Brown' AND C.CustID = R.CustID AND R.VehicleID = V.VehicleID
ORDER BY R.StartDate;


--Question 9b:

--For the same customer return the current balance.
SELECT SUM(TotalAmount) as CurrentDue
FROM CUSTOMER C, VEHICLE V, RENTAL R 
WHERE C.Name = 'J. Brown' AND C.CustID = R.CustID AND R.VehicleID = V.VehicleID AND R.PaymentDate = 'NULL';


--Question 10:

--Retrieve all weekly rentals for the vechicleID ‘19VDE1F3XEE414842’ that are not paid 
--yet. List the Customer Name, the start and return date, and the amount. 
SELECT Name, StartDate, ReturnDate, TotalAmount
FROM CUSTOMER C, RENTAL R
WHERE C.CustID = R.CustID AND R.VehicleID ='19VDE1F3XEE414842' AND R.RentalType = '7' AND R.PaymentDate = 'NULL';
 

--Question 11:

--Return all customers that they never rent a vehicle.
SELECT CustID, Name
FROM CUSTOMER
WHERE NOT EXISTS 
    (
        SELECT NULL
        FROM RENTAL
        WHERE RENTAL.CustID = CUSTOMER.CustID
    );


--Question 12: 

--Return all rentals that the customer paid on the StartDate. List Customer Name, Vehicle 
--Description, StartDate, ReturnDate, and TotalAmount. Order by Customer Name. 
SELECT Name,Description, StartDate, ReturnDate, TotalAmount
FROM CUSTOMER C, RENTAL R, VEHICLE V
WHERE C.CustID = R.CustID AND R.StartDate = PaymentDate AND R.VehicleID = V.VehicleID
ORDER BY Name;

