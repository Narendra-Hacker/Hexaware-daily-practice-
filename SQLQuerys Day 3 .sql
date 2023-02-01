use Employee_DB

Select * from department;

-- A subquery is a select query inside another query
-- Two types: 
-- 1] Corelated subquery  2] Non corelated subquery

--selct the employee details of HR department

select first_name, email, salary from employee where department_id =2;

-- By chance if sometimes the department HR's id is updated as 9 the above query will not give the correct answer
update department set id=9 where name='HR' -- data is changed 

-- SUBQUERY - To display the live data or current data 
select first_name,email,salary from employee where department_id =(select id from department where name='HR');

--To display the states of india

select state from location where country_id=(select id from countries where name ='India')

select state from location where country_id=(select id from countries where name ='India') and city ='Bombay'

select * from manager;

--Names of all the managers 
select first_name from employee where id in (select employee_id from manager);

--Name of the HR Manager
-- Multiple subquery
select first_name from employee where id in (select employee_id from manager) and 
department_id =(select id from department where name='HR');

-- Display the employee details whose departments's location is in state new jersey
select first_name from employee where department_id=(
 select id from department where location_id= (
 select id from location where state ='New Jersey'))

-- Employee Max Salary
select first_name from employee where salary=(
select Max(salary) from employee);

-- Employee Min Salary
select first_name from employee where salary =(
select Min(salary) from employee);

-- Employees names having salary less than the average salary

select Avg(salary) from employee

select first_name,salary from employee where salary<(
select Avg(salary) from employee);

select first_name,salary from employee where salary>(
select Avg(salary) from employee);

--Aggregate functions cannot with where clause directly, it needs the select query to operate

select first_name from employee where salary=max(salary);

-- 2nd highest salary

select first_name,salary from employee where salary=(
select max(salary) from employee where salary !=(
select max(salary) from employee));

select * from employee;

--3rd highest salary

select first_name,salary from employee where salary=(
select max(salary) from employee where salary!=(
select max(salary) from employee where salary !=(
select max(salary) from employee)));

-- The above query is not sutiable for finding the third highest salary. The below query is sutiable to do that 

select first_name, salary from employee where salary=(
select max(salary) from employee where salary < 
	(select max(salary) from employee where salary 
		<(select max(salary) from employee)));  

-- 4Th highest salary
select max(salary) from employee where salary<(
	select max(salary) from employee where salary < 
		(select max(salary) from employee where salary 
			<(select max(salary) from employee)));

-- 2.	Write a query to display the names of all states belonging to the country Canada. Display the records sorted in ascending order based on state name.(Q 2).

select state as States_in_canada from location where country_id=(select id from countries where name = 'canada') order by state; 

-- 3.	Write a query to display the first name of the managers of Accounts department. Display the records sorted in ascending order based on manager name.(Q7).

select * from employee;
select * from department;
select * from manager;
select first_name from employee where id in (select employee_id from manager where department_id = (select id from department where name='Business Development'))

-- 9.	Write a query to display the names of all countries belonging to region Europe. Display the records sorted in ascending order based on country name.(Q1)

select name from countries where region_id = (select id from region where name='europe') order by name;

-- 14.	Write a query to display the first name of the managers of HR department. Display the records sorted in ascending order based on manager name(Q6)

select first_name from employee 
where id in (select employee_id from manager 
			  where department_id = (select id from department where name ='HR'))
			  order by first_name;

-- 15.	Write a query to display the first name of all employees who are managers. Display the records sorted in ascending order based on first name.(Q5)

select * from manager;
select * from employee;
select * from department;

select first_name from employee where id in (select employee_id from manager);





















