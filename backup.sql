--Q1
SELECT Distinct FirstName, LastName
FROM Ticket t, Passenger p
WHERE Status='Booked' AND t.SSN = P.SSN;

--Q2
SELECT TrainName
FROM Train t,Ticket i
WHERE t.TrainNumber = i.Train_Number AND Status='WaitL'
GROUP BY TrainNumber HAVING COUNT(*) >= 2;

--Q3
SELECT * 
FROM Ticket 
WHERE Status='WaitL'
DELETE FROM Ticket
WHERE Status='WaitL'AND SSN='277292710'
SELECT *
FROM Ticket
Where Status='WaitL';