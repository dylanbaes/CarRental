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