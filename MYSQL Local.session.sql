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

-- create Payments table

CREATE table IF NOT EXISTS  Payments (
    PaymentID int auto_increment primary key,
    ReservationID int not null,
    PaymentDate date not null,
    Amount decimal(10,2) not null,
    PaymentMethod Enum('creditcard', 'cash', 'online', 'Debitcard') not null,
    foreign key(ReservationID) references Reservations(ReservationID) on delete cascade
)

select * from Payments;

CREATE table IF NOT EXISTS Department(
    Departmentid int auto_increment primary key,
    deptName varchar(200)
)
select * from Department;

-- delete table

Drop TABLE department;

-- insert data 

INSERT into rooms(
    RoomID,
    RoomNumber,
    RoomType, 
    PricePerNight,
    Status
    ) values
    (4,104, 'single', 15000,'Available'),
    (5,102, 'Double', 10000, 'occupied'),
    (6,103, 'Double', 30000,'Maintenance'),
    (7, 102, 'Suite', 18000.00, 'Available');


-- to select table



insert INTO guests VALUES
(1,'Amrit', 'Bhusal', 'amrit123@gamil.com', '98736734664','bangalore'),
(2, 'Arun', 'pandey', 'arun@gmail.com', '3463888888', 'Nepal'),
(3,  'Suman', 'KC', 'suman@gmail.com', '9749886068', 'kanakapur'),
(4, 'Sumant', 'venkatas', 'suman123@gmail.com','9387465656','tamilnadu'),
(5, 'promish','Bhandari', 'promish@gmail.com', '3947747477', 'kathmandu');

INSERT INTO reservations(GuestID,RoomID,CheckInDate,CheckOutDate,TotalAmount) VALUES
(3,2,'2025-07-13', '2025-07-15', 300.00 ),
(4,3,'2025-07-13', '2025-07-15', 200.00 ),
(5,5,'2025-07-13', '2025-07-15', 100.00 ),
(3,1,'2025-07-13', '2025-07-15', 500.00 ),
(5,3,'2025-07-13', '2025-07-15', 1000.00 ),
(1,1,'2025-07-13', '2025-07-15', 1200.00 ),
(2,1,'2025-07-13', '2025-07-15', 200.00 ),
(3,2,'2025-07-13', '2025-07-15', 800.00 ),
(5,5,'2025-07-13', '2025-07-15', 350.00 ),
(2,5,'2025-07-13', '2025-07-15', 1520.00 ),
(5,4,'2025-07-13', '2025-07-15', 3000.00 ),
(4,4,'2025-07-13', '2025-07-15', 1000.00 ),
(1,5,'2025-07-13', '2025-07-15', 1240.00 ),
(4,6,'2025-07-13', '2025-07-15', 250.00 ),
(3,3,'2025-07-13', '2025-07-15', 800.00 ),
(2,3,'2025-07-13', '2025-07-15', 900.00 ),
(2,2,'2025-07-13', '2025-07-15', 700.00 ),
(2,5,'2025-07-13', '2025-07-15', 120.00 ),
(5,2,'2025-07-13', '2025-07-15', 1600.00 );


--updating table data


update reservations SET 
Status = 'checkedOut' WHERE ReservationID = 3;

SELECT * FROM reservations;

INSERT into payments
(ReservationID, PaymentDate, Amount,PaymentMethod)
values
(1,'2025-09-15', 1000.00,'Debitcard' ),
(1,'2025-10-09', 500.00,'creditcard' ),
(1,'2025-05-01', 1200.00,'cash' ),
(1,'2025-05-25', 100.00,'creditcard' ),
(1,'2025-08-07', 1300.00,'online' ),
(1,'2025-04-05', 100.00,'online' ),
(1,'2024-12-23', 1050.00,'online' ),
(1,'2024-06-15', 5000.00,'Debitcard' ),
(1,'2024-05-15', 4000.00,'cash' );



update payments SET
ReservationID=64 WHERE PaymentID=7;


-- delete row from table

delete from reservations 
where ReservationID=78;

--select limited columns from table using condition

SELECT PaymentID, PaymentDate, Amount
FROM payments
WHERE Amount > 1000;

--calculate average amount

select AVG(Amount) 
as average_amout from payments;


-- groupby 

select RoomID, count(*) 
as guests_count from reservations
GROUP BY RoomID
HAVING guests_count > 3;


-- using where cluse

SELECT * from payments
where Amount <= 1300 and  PaymentMethod = 'creditcard';







select* from payments;