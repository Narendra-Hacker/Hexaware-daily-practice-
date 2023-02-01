
Create Database Employee_DB;
Use Employee_DB;

Create table Region
(id int primary key,
name varchar(50)
);

Create table Countries
(id varchar(50) primary key,
name varchar(50),
region_id int,
foreign key(region_id) references region(id)
);

Create table location
(id varchar(50) primary key,
street_address varchar(50),
postal_code varchar(50),
city varchar(50),
state varchar(50),
country_id varchar(50),
foreign key(country_id) references countries(id)
);

Create table department
(id int primary key,
name varchar(50),
location_id varchar(50),
foreign key(location_id) references location(id)
);

Create table employee
(id int primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
phone_number varchar(50),
hire_datet date,
salary int,
date_of_birth date,
department_id int ,
foreign key(department_id) references department(id)
);

Create table manager
(employee_id int,
department_id int,
primary key(employee_id,department_id),
foreign key(employee_id) references employee(id),
foreign key(department_id) references department(id)
);




insert into Region values(1,'Europe'),(2,'Americas'),(3,'Asia'),(4,'Middle east and africa');
insert into Countries values 
('AR','ARgentina',2),('AU','Australia',3),('BE','Belgium',1),('BR','BRAZIL',2),
('CA','Canada',2),('CH','Switzerland',1),('CN','China',3),('DE','Germany',1),
('DK','Denmark',1),('EG','Egpty',4),('FR','France',1),('HK','Hongkong',3),
('IL','Isreal',4),('IN','India',3),('IT','Italy',1),('JP','Japan',3),
('KW','Kuwait',4),('Mx','Mexico',2),('NG','Nigeria',4),('NL','Netherlands',1),
('SG','Singapore',3),('UK','United Kingdom',1),('US','United States of America',2),
('ZM','ZAMBIA',4),('zw','Zimbabwe',4);

ALTER TABLE location
NOCHECK CONSTRAINT FK__location__countr__29572725;

insert into location values
(1000, '1297 via cola di rie','989', 'Roma','Roma','IT'),
(1100,'93091 Calle della testa', '10934','Venice','venice','IT'),
(1200,'2017 ShinJUKU-KU','1689','Tokyo','Tokyo prefecture','JP'),
(1300,'9450 Kamya-Cho','6823','Hiroshima','hiroshi','JP'),
(1400,'2014 Jabberwocky RD', '26192', 'South lake','Texas','US'),
(1500,'2011 Interiors BLVD','99236','South san Francisco','California','Us'),
(1600,'2007 Zagora ST','50090','South bruncswick','New Jersey','US'),
(1700,'2004 Charade Rd','98199','Seattle','washington','US'),
(1800,'147 Spadna Ave','MSV 2L7','Toronto','Ontario','CA'),
(1900,'6092-BoXwood ST','YSW 9T2','Whitehorse','Yukon','CA'),
(2000,'40-5-12 Laogianggen','190518','Beijing','Beijing','CN'),
(2100, '1298 VILEPARLE ed','490231','BOMBAY','Maharasthra','IN'),
(2200,'12-98 Victoria Street','2901','Sydney','New South wales','AU'),
(2300,'198 Clementi North','540198','Singapore','Singapore','SG'),
(2400,'B204 Arthur ST','2345','London','LOndon','UK'),
(2500,'Magdalen Center','The Oxford','OX9 9ZB','Oxford','OX'),
(2600,'9702 Chester Road','9629850293','Stretford','Manchester','UK'),
(2700,'Schwanthalerstr, 7301','80925','Munich','Bavaria','DE'),
(2800,'RUA FREI Caneca 1360','01307-002','SAO Paulo','SAO Paulo','BR'),
(2900,'20 RUE DES Corps-Saints','1730','Geneva','Geneve','CH'),
(3000,'MURTENSTRASSE 921','3095','BERN','BE','CH'),
(3100,'PIETER BREUGHELSTRAAT B37','3029SK','UTRECHIT','UTRECHIT','NL'),
(3200,'MARIANO ESCOBEDO 9991','11932','Mexico city','Distrito federal','Europe');



insert into department values 
(1,'Accounts',1000),
(2,'HR',1600),
(3,'Business Development',1800),
(4,'IT Support',2400),
(5,'IT',3200);

Insert into employee values(1,'anu','sharma','anu@gmail.com',9864675634,'2015-08-13',20000,'1994-01-12',5);

Insert into employee values(2,'ananthi','sharma','ananthi@gmail.com',8608491910,'2015-08-03',22000,'1994-03-21',3);

Insert into employee values(3,'amarnath','pillai','amarnath@gmail.com',7894589654,'2004-07-03',38000,'1992-01-12',4);

Insert into employee values(4,'clinton','pritheev','clinton@gmail.com',7708480901,'2015-06-01',23000,'1994-09-05',2);

Insert into employee values(5,'collin','paul','collin@gmail.com',9842524655,'2014-06-02',30500,'1993-12-26',1);

Insert into employee values(
6, 'haritha', 'mohan', 'haritha@gmail.com', '7710589123', '2014-07-22', '41000', '1993-06-12', 4);

Insert into employee values
(7, 'shrihari', 'pillai', 'shrihari@gmail.com', '9842512456', '2015-07-01', '21000', '1994-05-01', 2);

Insert into employee values
(8, 'jeeva', 'annath', 'jeeva@gmail.com', '8608491912', '2013-06-02', '28000', '1991-12-23', 3);

Insert into employee values
(9, 'jimesh', 'sharma', 'jimesh@gmail.com', '9634565231', '2012-05-06', '51000', '1992-10-28', 1);

Insert into employee values
(10, 'giruba', 'dharan', 'giri@gmail.com', '9842524655', '2012-06-02', '24000', '1990-11-22', 2);

Insert into employee values
(11, 'karthiga', 'pillai', 'karthi@gmail.com', '8608491510', '2013-08-04', '32000', '1993-08-26', 4);   
	
insert into employee values(12,'MADHU','SHARMA' ,'MADHU@GMAIL.COM',9865478963,'2014-06-03',34000,'1995-05-01',2);

insert into employee values(13,'MADHAN','KUMAR','MADHAN@GMAIL.COM',8608491810,'2014-06-02',25500,'1993-01-11',3);
	insert into employee values(14,'MALINI','KENNEDY','MALINI@GMAIL.COM',9965684384,'2015-06-03',27800,'1994-01-02',2);
	insert into employee values(15,'PRAVEEN','SINGH','PRAVEEN@GMAIL.COM',9842578910,'2015-09-02',32800,'1993-08-18',4);
	insert into employee values(16,'PRABHA','MURUGAN','PRAGHA@GMAIL.COM',9865478963,'2013-06-03',25000,'1994-05-01',2);
	insert into employee values(17,'PRADEEP','SINGH','PRADEEP@GMAIL.COM',8604527865,'2004-10-02',76000,'1981-12-23',3);
    insert into  employee values(18,'PERICHI','PILLAI','PERICHI@gmail.com',9842578910,'2015-09-02',31780,'1993-08-28',4);


insert into  employee values(19,'PUNITHA','SHARMA','PUNITHA@gmail.com',9865478963,'2008-06-03',44148,'1984-05-01',2);


insert into  employee values(20,'SIVA','PILLAI','SIVA@gmail.com',9845612458,'2013-06-02',19348,'1991-12-23',3);


insert into  employee values(21,'THANA','RATHINAM','PRAGHA@gmail.com',9865478963,'2013-06-03',14148,'1994-05-01',2);


insert into  employee values(22,'YOGESH','SINGH','PRADEEP@gmail.com',8604527865,'2013-06-02',20348,'1991-12-23',3);


insert into  employee values(23,'VIDYA','SINGH','PERICHI@gmail.com',9842578910,'2014-09-02',21780,'1993-08-16',4);


Insert into manager(department_id,employee_id) values (1,9),(2,19),(2,4),(3,17),(3,8),(4,15),(5,1);


select * from Countries;
select * from department;
select * from employee;
select * from location;
select * from manager;
select * from Region;

-- 1.	Write a query to display the id, entire street address and the first word of the street address of all entries in the location table. Give an alias 
-- to the first word as 'first_word'. Display the records sorted in ascending order based on first_word.(Q10)

-- To Display some set of charcaters in a string
-- SELECT SUBSTRING(string, start, length) as anyVariableName from yourTableName; 

select id,street_address, SUBSTRING(street_address,1,4) as first_word from location order by first_word;

-- 2.	Write a query to display the names of all states belonging to the country Canada. Display the records sorted in ascending order based on state name.(Q 2).

select state as States_in_canada from location where country_id=(select id from countries where name = 'canada') order by state;  

-- 9.	Write a query to display the names of all countries belonging to region Europe. Display the records sorted in ascending order based on country name.(Q1)

select name from countries where region_id = (select id from region where name='europe') order by name;

-- 10.	Write a query to display the id,entire street address and the last word of the street address of all entries in the location table. Give an alias to the 
-- last word as 'last_word'. Display the records sorted in ascending order based on last_word.(Q9)

select id,street_address,SUBSTRING(street_address,17,4) as last_word from location order by last_word;

-- 11.Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Display
-- the records sorted in ascending order based on first name.(Q11).

select first_name,salary from employee;

-- describe employee; -- this is not working here

select first_name,concat('$$$$$ ',salary) as salary from employee order by first_name asc;

-- OR

select first_name,left(replicate('$',5)+convert(char,salary),10) as salary from employee order by first_name;

-- 13.	Write a query to display the first name and the last 5 characters of phone numbers of all employees. Display the records sorted in ascending order based on first name. 
-- Give an alias to the last 5 characters of phone number as phone_number(Q8).

SELECT first_name, SUBSTRING(phone_number,6,5) as phone_number from employee order by first_name;

-- 14.	Write a query to display the first name of the managers of HR department. Display the records sorted in ascending order based on manager name(Q6)

select first_name from employee 
where id in (select employee_id from manager 
			  where department_id = (select id from department where name ='HR'))
			  order by first_name;

-- Display the employee details whose age is grater than 30 ?

-- Not Allowed in Sql server to do in this way =  SELECT *, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),'DATE_OF_BIRTH')), '%Y') + 0 AS age from employee;

SELECT first_name, DATEDIFF(hour,date_of_birth,GETDATE())/8766 AS Age from employee;
