--Query 1--
/*Add an extra column ‘Returned’ to the RENTAL table. Values will be 0-for non-returned cars, and 1-for 
--returned. Then update the ‘Returned’ column with '1' for all records that they have a payment date and 
--with '0' for those that they do not have a payment date. */

ALTER TABLE RENTAL
ADD COLUMN Returned;
UPDATE RENTAL SET Returned = 1 WHERE PaymentDate IS NOT NULL;
UPDATE RENTAL SET Returned = 0 WHERE PaymentDate IS 'NULL';

--Query 2--
/*Create a view vRentalInfo that retrieves all information per rental. The view should have the following 
  attributes:  
• OrderDate ! 
• StartDate – in an ascending order  !
• ReturnDate  !
• Total Days per Rental as 'TotalDays'– you need to change weeks to days  
• Vehicle’s ID as 'VIN'  !
• Vehicle’s Description as 'Vehicle'  !
• Vehicle’s Type as 'Type'– you need to use the description of the type  !
• Vehicle’s Category as 'Category' – you need to use the description of the category  !
• Customer’s ID as 'CustomerID'  !
• Customer’s Name as 'CustomerName' ! 
• Order Total Amount as 'OrderAmount',  !
• Order Remaining Amount as 'RentalBalance' – If there is no remaining balance return zero ‘0’ */
--

CREATE VIEW vRentalInfo AS
SELECT OrderDate, 
StartDate, 
ReturnDate,
julianday( R.ReturnDate) - julianday(R.StartDate ) AS TotalDays, 
R.VehicleID AS VIN, 
Description AS Vehicle,
replace(replace(replace(replace(replace(replace(V.Type,'1','Compact'),'2','Medium'),'3','Large'),'4','SUV'),'5','Truck'),'6','VAN') as Type,
replace(replace(Category,'0','Basic'),'1','Luxury') as Category,
R.CustID AS CustomerID,
C.Name AS CustomerName,
R.TotalAmount AS OrderAmount,
replace(replace(R.PaymentDate,'NULL', R.TotalAmount),PaymentDate, '0') as RentalBalance
FROM RENTAL R, VEHICLE V, CUSTOMER C
WHERE R.VehicleID = V.VehicleID AND R.CustID = C.CustID
ORDER BY StartDate ASC;

SELECT * FROM vRentalInfo; 


