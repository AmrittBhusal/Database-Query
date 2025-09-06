-- show all database

SHOW databases;


use mydb;

-- to create a table

CREATE TABLE IF NOT EXISTS Rooms(
    RoomID INT Primary Key,


);



SHOW TABLES;

-- add columns to an existing table

ALTER TABLE rooms
add RoomNumber varchar(10) NOT null,
add RoomType ENUM('single', 'Double', 'Suite', 'Deluxe') NOT null,
add PricePerNight DECIMAL(10,2) NOT null,
add Status ENUM('Available', 'Occupied', 'Maintenance') DEFAULT 'Available';


-- to select table

SELECT * FROM rooms;

-- create Guests table

CREATE TABLE IF NOT EXISTS Guests (
    GuestsID INT Primary Key,
    FirstName varchar(50) NOT null,
    LastName varchar(50) NOT null,
    Email varchar(100) UNIQUE NOT NULL,
    Phone varchar(50),
    Adress varchar(200) NOT NULL
);

select * from guests;

-- Create  Reservations Table

Create TABLE IF NOT EXISTS Reservations(
    ReservationID int auto_increment primary key,
    GuestID int not null,
    RoomID int not null,
    CheckInDate date not null,
    CheckOutDate date not null,
    TotalAmount decimal(10,2) not null,
    Status Enum('pending', 'confirmed', 'cancelled', 'checkedIn', 'checkedOut') default 'pending',
    foreign key(GuestID) references Guests(GuestsID) on delete cascade,
    foreign key(RoomID) references Rooms(RoomID) on delete cascade
);

select * from Reservations;


