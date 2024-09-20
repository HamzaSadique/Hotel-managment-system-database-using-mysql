create database Hotel_Managment;

use Hotel_Managment;

create table Rooms(
room_id int primary key auto_increment,
room_number varchar (10) unique,  -- single, Double, SUITEE
room_type varchar (50),
price_per_night decimal (10,2),
availability_status boolean,  -- True_if_available , --false_if_occupied
max_occupancy int
);


drop table Rooms;
select*from Rooms;

insert into Rooms
(room_id, room_number, room_type, price_per_night, availability_status, max_occupancy)
values
(1,101,'Single',1000.00, true, 1),
(2,102,'Double',4000.00, true, 2),   
(3,103,'Suite',8000.00, true, 3),   
(4,104,'Single',2000.00, true, 2),   
(5,105,'Double',16000.00, true, 4),   
(6,106,'Suite',20000.00, true, 5);  

create table Customers (
customer_id int primary key auto_increment,
first_name varchar (50),
last_name varchar (50),
phone varchar (30),
email varchar (30),
adress varchar (255),
id_proof varchar (50)
);

select*from Customers;


insert into Customers
(customer_id, first_name, last_name,phone,  email, adress, id_proof)
values
(1,'Hamza','Siddique','923005065785','h33696200@gmail.com','Hasilpur','passport'),
(2,'Hamza','Ali','923005065786','hamzaali@gmail.com','Bwp','Driving Licnce'),
(3,'Ali','Talha','923005065787','alitalha@gmail.com','Hasilpur','passport'),
(4,'Amir','Siddique','923005065788','amirali@gmail.com','Bwp','Id Card'),
(5,'Hamza','Siddique','923005065789','h33696@gmail.com','Darawala','Driving Licnce'),
(6,'Huyya','Ali','923005065795','huyyaali@gmail.com','Darawala','Id card');


create table Bookings (
booking_id int primary key,
room_id int,
customer_id int,
check_in_date date,
check_out_date date,
number_of_guest int,
total_amount decimal (10,2),
booking_status varchar (20),
foreign key (room_id) references Rooms (room_id),
foreign key (customer_id) references Customers (customer_id)
);

select*from Bookings;

insert into Bookings
(booking_id, room_id, customer_id, check_in_date, check_out_date, number_of_guest, total_amount ,booking_status)
values
(1,6,1,'2024-01-10', '2024-01-12', 1, 1000.00, 'Confirmed' ),
(2,5,5,'2024-02-15', '2024-02-17', 2, 2000.00, 'Checked-in' ),
(3,3,4,'2024-03-16', '2024-03-19', 3, 10000.00, 'Cancelled' ),
(4,4,6,'2024-05-23', '2024-05-29', 1, 20000.00, 'Confirmed' ),
(5,2,2,'2024-12-10', '2024-01-12', 3, 5000.00, 'Checked-in' ),
(6,1,3,'2024-08-1', '2024-09-12', 1, 500000.00, 'Cancelled' );

create table Staff (
staff_id int primary key,
first_name varchar (50),
last_name varchar (50),
position varchar (50),
salary decimal (10,2),
phone varchar (20),
email varchar (100)
);

select * from Staff;


insert into Staff
(staff_id, first_name, last_name, position, salary, phone, email)
values
(1, 'Hamza', 'Siddique', 'Manager',100000.00,'923005065785', 'hamza@gmail.com'),
(2, 'Hammad', 'Ali', 'HouseKeeping',10000.00,'923005065787', 'hammad@gmail.com'),
(3, 'Hamza', 'Ali', 'Manager',50000.00,'923005065788', 'hamzaali@gmail.com'),
(4, 'Fami', 'khan', 'Receptionist','20000.00','9230050657859', 'famza@gmail.com'),
(5, 'Huma', 'BUkhari', 'Receptionist',30000.00,'923005065786', 'huamza@gmail.com'),
(6, 'Adnan', 'Khan', 'Room Cleaner',10000.00,'923005065766', 'aamza@gmail.com');

create table Services(
service_id int primary KEY,
service_name varchar (50),
price decimal (10,2)
);

select* from Services;

insert into Services
(service_id, service_name, price)
values
(111, 'Spa', 2000.00),
(112, 'ROOM-Service', 5000.00),
(113, 'Laundary', 4000.00),
(114, 'Breakfast-in-Bed', 20000.00),
(115, 'Room-Senitization', 6000.00),
(116, 'Concierge', 3000.00);

create table Payments (
payment_id int primary key,
booking_id int,
payment_date date,
payment_amount decimal (10,2),
payment_method varchar (50),
foreign key (booking_id) references Bookings (booking_id)
);

select*from Payments;

insert into Payments
(payment_id, booking_id, payment_date, payment_amount, payment_method)
values
(1,5,'2024-03-12',10000.00,'Credit-card'),
(2,4,'2024-06-16',20000.00,'Cash'),
(3,6,'2024-11-11',50000.00,'Credit-card'),
(4,2,'2024-01-12',2000.00,'online'),
(5,1,'2024-05-12',100000.00,'Cash'),
(6,3,'2024-12-12',500000.00,'online');


select* 
from Rooms
where availability_status= True;

select *
from Bookings
where customer_id =1;

select Services.service_name, Services.price
from Services
join Services on Services.service_id =Services.service_id
where Services.booking_id=6;

select*
from Payments 
where booking_id= 6;
