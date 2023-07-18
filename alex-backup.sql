--Q5
--Q6
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