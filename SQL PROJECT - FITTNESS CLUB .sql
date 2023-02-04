create database fitness_club;

use fitness_club;

--Trainer registration table
----Trainer ID,first name,last name,mobile number,city,experience,gmail,Salary,Date of joining

Create Table Trainer_Regt
(trainer_ID int primary key identity(1,1),
First_name varchar(50),
Last_name varchar(50),
Mobile_No  varchar(50),
City varchar(30),
Experience int,
Date_of_join date,
Salary int,
Training_fees int,
Email varchar(50));

Select * from Trainer_Regt;

--Member Registration table
----Member ID,first name,last name,mobile number,city,gmail,Date of joining ,Trainer Id,

Create Table Member_Regt
(Member_ID int primary key identity(1,1),
First_name varchar(50),
Last_name varchar(50),
Mobile_no varchar(50),
City varchar(30),
Date_of_join date,
trainer_id int,
constraint FK_trainerID
FOREIGN KEY(trainer_id) References trainer_regt(trainer_id),
Email varchar(50));

select * from member_regt;

-- Fee collection details

-- member ID(foreign key),subscription(months), total fees, amount paid, fee due, status

create table fee_details(
member_id int,
constraint FK_memberID
FOREIGN KEY(member_id) References member_regt(member_id),
subscription int,
Total_fees int,
Amount_paid int,
Fee_due int,
status varchar(10));


Select * from Trainer_Regt;
select * from member_regt;
select * from fee_details;

Insert into Trainer_Regt values('Kiran','Padma','9000342412','Srikakulam',2,'05-01-2022',10000,1000,'Kiran@gmail.com');
Insert into Trainer_Regt values('Narendra','Guruvu','9200341234','Tekkali',2,'05-09-2022',14000,1200,'Narendra@gmail.com');

select * from Trainer_regt;

Insert into Member_Regt values('Naryana','Lakshmi','9010356998','Srikakulam','01-01-2023',1,'narayana@gmail.com');
Insert into Member_Regt values('Nara','simha','9010123498','Srikakulam','01-01-2023',1,'nara@gmail.com');
Insert into Member_Regt values('uday','kumar','8080123498','Palasa','01-09-2022',2,'uday@gmail.com');

select * from member_regt;

Insert into Fee_details values(1,3,3000,2000,1000,'Pending');
Insert into Fee_details values(3,2,2400,2400,0,'Cleared');

select * from fee_details;

-- Q] dislay the first name of the trainer and members under the trainer?

select m.member_id, m.first_name,t.first_name from trainer_regt as t join member_regt as m on t.trainer_id=m.trainer_id; 

