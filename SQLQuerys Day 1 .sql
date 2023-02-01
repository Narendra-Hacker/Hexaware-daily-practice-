Create database InventoryMgmt_Db;
use InventoryMgmt_Db;

Create Table Users
(
UserID int primary key identity(1,1),
UserName varchar(50),
Password varchar(25),
FullName varchar(255),
IsActive BIT,
Category varchar(50)
);


Create Table ProductMaster
(
Productid int primary key identity(1,1),
 ProductName varchar(50),
 AvailableQty bigint
 );

Create Table [Transaction]
(
TransactionID int primary key identity(1,1),
TransactionDate Date,
ProductID int,
constraint FK_productionID
FOREIGN KEY(ProductID) References ProductMaster(Productid),
TransactionType varchar(5),
Qty int,
UpdatedBy int
);

--Make the updatedBy column in [Transaction] as a foreign key relating with the Userid of  Users table
alter table [Transaction] add foreign key(updatedBy) references Users(userid);

--Make the productID column as Not Null column in [Transaction].
alter table [Transaction] alter column productId int not null;

--Make the updatedBy,TransactionType column of [Transaction] as Not Null.
Alter table [Transaction] alter column updatedBy int Not Null;
Alter table [Transaction] alter column TransactionType varchar(5) Not Null;


--Make the ProductName, AvailableQty columns ProductMaster as Not Null.
Alter table ProductMaster alter column ProductName varchar(50) Not Null;
Alter table ProductMaster alter column AvailableQty bigint Not Null;


--Droping a foreign key
Alter table [Transaction] drop FK__Transacti__Updat__403A8C7D;

Create table Testing(id int);

Drop table Testing;

-- DDL, DML, DQL, TCL,DCL,
-- DDL Data Definition Language
-- DML Data manipulation Language
-- TCL Transaction Control Language
-- DCL Data Control Language

--DML Commands - INSERT , UPDATE,DELETE

--Data Manipulation Language
--INSERT -Add new Row
--UPDATE --Modify the available data
--Delete --Delete the row(s) from the table

INSERT into ProductMaster values('TubeLight',500),('Switch',1000),('Screws',2000);
INSERT into ProductMaster values ('Nails',500);

Insert into Users(UserName,Password,FullName,IsActive) values
('Mathew','Mathew@111','John Mathew',1);

Insert into Users(UserName,Password,FullName,IsActive) values
('Dhivya','Dhivya@111','Dhivya Rajendran',1);

Insert into Users(UserName,Password,FullName,IsActive) values
('Kiran','Kiran@2132','Kiran padmanabham',1);

SELECT * from ProductMaster;

SELECT * from Users;



--Update
Update Users set Category='Admin';
Update Users set Category='Staff' where UserID in (2,6);


--Delete 
Delete from Users where UserID>2;
Delete from ProductMaster where Productid=6;

Delete from productMaster where productid=4;

-- Drop table users;
 
-- Drop table productmaster; -- Could not drop object 'productmaster' because it is referenced by a FOREIGN KEY constraint.

-- We could not Drop or Truncate productmaster table until its relation with the [Transaction] table is removed, hence first [transaction] is to be dropped

-- Drop table [transaction]; 
-- truncate table productmaster; 

Insert into [Transaction] ( TransactionDate,ProductID,TransactionType,Qty,UpdatedBy) values
('2022-09-11',1,'IN',12,1),('2022-10-11',2,'IN',10,2);

Insert into [Transaction] ( TransactionDate,ProductID,TransactionType,Qty,UpdatedBy) values ('2023-01-11',3,'OUT',4,3);
-- The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Transacti__Updat__4222D4EF".
-- The conflict occurred in database "Inventorymgmt_Db", table "dbo.Users", column 'UserID'            --> This error is occured because productID 3 is deleted

SELECT * from [Transaction];

Truncate table [transaction];

Delete from [transaction] where transactionid in (2,4,5);

Truncate table Users;
Truncate table [Transaction];

Select UserName,FUllName,Category from Users;

--Filtering the data using where clause

select * from productmaster;

Select * from ProductMaster where AvailableQty>500;

Select * from ProductMaster where AvailableQty=500;

Select ProductName from ProductMaster where AvailableQty<2000;

--between >= and <=

Select * from ProductMaster where AvailableQty between 1000 and 2000;

Select * from ProductMaster where AvailableQty  not between 1000 and 2000;


--Select All the Users FullName and Category
Select FullName ,Category from Users;


--Select ProductName  where the AvailableQty is less than 500
Select ProductName from ProductMaster where AvailableQty<500;


--Select Transactions details which is done by the User Mathew
select * from [transaction];
select * from users;

Select * from [Transaction] where UpdatedBy IN
(Select UserID from Users where UserName='Mathew');

--Select the transactionDate and TransactionType from the transaction table
Select  TransactionDate,TransactionType from [Transaction];


--Fetch only the Inward Transaction details
Select * from [Transaction] where TransactionType='IN';


--Fetch the prodcut details of Nails;
Select * from ProductMaster where ProductName='Nails';


INSERT into ProductMaster values('Nails',500);

Alter table [Transaction] drop FK_productionID;

