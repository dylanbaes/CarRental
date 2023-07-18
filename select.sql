--Q1
SELECT Distinct FirstName,
    LastName
FROM Ticket t,
    Passenger p
WHERE Status = 'Booked'
    AND t.SSN = P.SSN;
--Q2
SELECT FirstName,
    LastName,
    TrainName
FROM Ticket i,
    Train t
    INNER JOIN Passenger ON i.SSN = Passenger.SSN
WHERE t.TrainNumber = i.Train_Number
    AND Status = 'WaitL'
ORDER BY FirstName DESC;
- -
GROUP BY TrainNumber
HAVING COUNT(*) >= 2;
--Q3
SELECT *
FROM Ticket
WHERE Status = 'WaitL'
DELETE FROM Ticket
WHERE Status = 'WaitL'
    AND SSN = '277292710'
SELECT *
FROM Ticket
Where Status = 'WaitL';
SELECT TrainName,
    (
        PremiumSeatsAvailable + GeneralSeatsAvailable
    ),
    (
        PremiumSeatsOccupied + GeneralSeatsOccupied
    )
FROM Train
    INNER JOIN Train_Status ON Train.TrainNumber = Train_Status.number;
--Q7
SELECT TrainName
FROM Train
WHERE Train.TrainNumber IN(
        SELECT Train_Number
        FROM Ticket
        WHERE Ticket.Status = 'Booked'
            AND Ticket.SSN IN(
                SELECT SSN
                FROM Passenger
                WHERE Passenger.FirstName = 'James'
                    AND Passenger.LastName = 'Butt'
            )
    );
--Q8
SELECT TrainNumber,
    TrainName,
    SourceStart,
    DestinationStation,
    FirstName,
    LastName,
    Adress,
    Ticket_Type,
    Status
FROM Train,
    Passenger,
    Ticket
WHERE Passenger.Age < 60
    AND Passenger.Age > 50;
--Q9
SELECT TrainName,
    (
        SELECT COUNT(SSN)
        FROM Ticket
        WHERE train.TrainNumber = Ticket.Train_Number
            AND Ticket.Status = 'Booked'
    )
FROM Train train;
--Q10
SELECT FirstName,
    LastName
FROM Passenger passenger
WHERE EXISTS(
        SELECT NULL
        FROM Ticket ticket
        WHERE ticket.Status = 'Booked'
            AND ticket.Ticket_Type = 'Premium'
            AND ticket.SSN = passenger.SSN IN(
                SELECT TrainNumber
                FROM Availability
                WHERE Availability.weekDays = 'Sunday'
                    OR Availability.weekDays = 'Saturday'
                    AND TrainNumber = ticket.Train_Number
            )
    );