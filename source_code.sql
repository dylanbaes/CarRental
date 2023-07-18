CREATE TABLE [Train_status] (
    [TrainDate] NVARCHAR(10) NOT NULL,
    [PremiumSeatsAvailable] INTEGER NOT NULL,
    [GenSeatsAvailable] INTEGER NOT NULL,
    [PremiumSeatsOccupied] INTEGER NOT NULL,
    [GenSeatsOccupied] INTEGER NOT NULL,
    [TrainName] NVARCHAR(64) NOT NULL,
    FOREIGN KEY ([TrainName]) REFERENCES [Train] ([TrainName])
);
CREATE TABLE [Passenger] (
    [Address] NVARCHAR(50) NOT NULL,
    [SSN] NVARCHAR(9) NOT NULL PRIMARY KEY,
    [FirstName] NVARCHAR(20) NOT NULL,
    [LastName] NVARCHAR(20),
    [BDate] NVARCHAR(10) NOT NULL,
    [Phone] NVARCHAR(10) NOT NULL,
    [Age] INTEGER NOT NULL
);
CREATE TABLE [Ticket] (
    [Ticket_Type] NVARCHAR(20) NOT NULL,
    [SSN] INTEGER NOT NULL,
    [Status] NVARCHAR(20) NOT NULL,
    [TrainName] NVARCHAR(64) NOT NULL,
    FOREIGN KEY ([SSN]) REFERENCES [Passenger] ([SSN]),
    FOREIGN KEY ([TrainName]) REFERENCES [Train] ([TrainName])
);
CREATE TABLE [Train] (
    [TrainNumber] INTEGER NOT NULL PRIMARY KEY,
    [TrainName] NVARCHAR(50) NOT NULL UNIQUE,
    [PremiumFair] INTEGER NOT NULL,
    [GeneralFair] INTEGER NOT NULL,
    [SourceStation] INTEGER NOT NULL,
    [Destination] NVARCHAR(50) NOT NULL,
);
CREATE TABLE [Availability] (
    weekDays NVARCHAR(200),
    [TrainNumber] INTEGER,
    FOREIGN KEY([TrainNumber]) REFERENCES [Train]([TrainNumber])
);