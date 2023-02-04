use lms_db;

-- Joins

select distinct supplier_id from lms_book_details;

select supplier_id from LMS_SUPPLIERS_DETAILS;

-- Outer Join
--> Left outer Join
--> Right Outer Join - displays the common data and the extra data from right side table
--> Full outer Join

select l1.book_code,l1.book_title,l2.supplier_name,l2.supplier_id from 
lms_book_details as l1 join lms_suppliers_details as l2
on l1.supplier_id=l2.supplier_id;

select l1.book_code,l1.book_title,l2.supplier_name,l2.supplier_id from 
lms_book_details as l1 right outer join lms_suppliers_details as l2
on l1.supplier_id=l2.supplier_id;

select * from LMS_BOOK_ISSUE;
select * from LMS_MEMBERS;

select l2.member_id,l2.member_name,l1.book_code from 
lms_book_issue as l1 join lms_members as l2
on l1.member_id= l2.member_id;

-- If you want to display the data of all the members and the books they have taken

select l2.member_id,l2.member_name,l1.book_code from 
lms_book_issue as l1 right join lms_members as l2
on l1.member_id= l2.member_id;

-- Left Outer join or Left Join

select distinct supplier_id from lms_book_details;
select supplier_id from LMS_SUPPLIERS_DETAILS;

select l1.book_code,l1.book_title,l2.supplier_name,l2.supplier_id from 
lms_book_details as l1 left outer join lms_suppliers_details as l2
on l1.supplier_id=l2.supplier_id;

-- Full Outer Join 
-- > It will be a combination of Right outer join and Left Outer Join
----- > It will display the common data and the extra data from both the right and left tables

select l1.book_code,l1.book_title,l2.supplier_name,l2.supplier_id from 
lms_book_details as l1 full outer join lms_suppliers_details as l2
on l1.supplier_id=l2.supplier_id;

-- Display the data of the suppliers starting with letter 'S'

select l1.book_code,l1.book_title,l2.supplier_name,l2.supplier_id from 
lms_book_details as l1 full outer join lms_suppliers_details as l2
on l1.supplier_id=l2.supplier_id where l2.supplier_name like 'S%';

-- when is Joins Used ? => when we want display data from multiple tables we use joins
-- when we sub queries ? => when we want to display data from one table using data from other table we use sub queries

-- Having clause
--> Find the supplier details who has supplied maximum number of books

select * from LMS_SUPPLIERS_DETAILS;
select * from LMS_BOOK_DETAILS;

select supplier_id, count(supplier_id) from lms_book_details 
group by supplier_id;

--> The below query is not possible it is giving the following error
--> Cannot perform an aggregate function on an expression containing an aggregate or a subquery.
--> Nesting of an aggregate function inside another aggregate is not possible

select supplier_id, max(count(supplier_id)) from lms_book_details 
group by supplier_id;

select supplier_id, count(supplier_id) from lms_book_details group by supplier_id
having count(supplier_id)>= All(
select count(supplier_id) from lms_book_details 
group by supplier_id);

-- sub query
-- 4
-- 3
-- 1
-- 0

-- ALL(4,3,1)
-- (0,4,3,1) >= ALL(0,4,3,1)

-- 0>=All(0,4,3,1)
-- 4>=All(0,4,3,1) --> For all the comparsion it will give a True 
-- 3>=All(0,4,3,1)
-- 1>=All(0,4,3,1)

-- The order to be followed while writing a query is 
-- select
-- from
-- where
-- group by
-- having
-- order by

-- To dispaly the supplier_id who supplied more than 2 books

select supplier_id, count(supplier_id) from lms_book_details group by supplier_id
having count(supplier_id)> 2;

-- Having clause is only used with Aggregate Functions

select supplier_id,count(supplier_id) from lms_book_details 
group by supplier_id; 

select supplier_id,count(supplier_id) from lms_book_details 
group by supplier_id having count(supplier_id)>2; 

select member_name,count(book_code) as No_of_Books from lms_book_issue as l1 join
lms_members as l2 on l1.member_id=l2.member_id where member_name like 'A%'
group by member_name having count(book_code)<2 order by member_name desc;


-- Using Dense_Rank() Function 

Use Employee_DB;
update employee set salary=38000 where first_name='madhu';

select * from employee;

select * from 
(select first_name,salary,dense_rank() over(order by salary desc) r from 
employee) as e 

select * from 
(select first_name,salary,dense_rank() over(order by salary desc) r from 
employee) as e where r=5;

--> Non Corelated Subquery - Only the outer query is dependent on the inner query

select * from employee where salary = (select max(salary) from employee);
--> Here the inner query is independent of the outer query

--> Corelated Subquery - the inner query is dependent on the outer query and the
						-- outer query is dependent on the inner query

create table Emp(
id int,
name char(10),
salary int);

insert into Emp values(1,'Saran',45000),
(2,'Deepa',65000),(3,'Ram',76000),(4,'John',35000);

select * from Emp;

-- Corelated query to display the 2nd highest salary
select * from emp as e1 where 2=
(select count(distinct salary) from emp as e2 where e2.salary>=e1.salary);

-- Query to Dispaly the 3rd Highest Salary
select * from emp as e1 where 3=
(select count(distinct salary) from emp as e2 where e2.salary>=e1.salary);

--  e2      e1
-- 45000>=45000 yes
-- 65000>=45000 yes
-- 76000>=45000 yes
-- 35000>=45000 no

--  e2      e1
-- 45000>=65000 no
-- 65000>=65000 yes
-- 76000>=65000 yes
-- 35000>=65000 no

--  e2      e1
-- 45000>=76000 no
-- 65000>=76000 no
-- 76000>=76000 yes
-- 35000>=76000 no

--  e2      e1
-- 45000>=35000 yes
-- 65000>=35000 yes
-- 76000>=35000 yes
-- 35000>=35000 yes

--> Complex Questions:

/* Problem # 1:
	Write a query to display the book code, book title and supplier name of the supplier who has supplied maximum number of books. 
	For example, if “ABC Store” supplied 3 books, “LM Store” has supplied 2 books and “XYZ Store” has supplied 1 book. 
	So “ABC Store” has supplied maximum number of books, hence display the details as mentioned below. 

	Example:
	BOOK_CODE		BOOK_TITLE	     	  SUPPLIER_NAME
	BL000008	Easy Reference for Java   	ABC STORE
	BL000001	Easy Reference for C     	ABC STORE
	BL000003	Easy Reference for VB    	ABC STORE	*/

	use lms_db;

	select * from lms_book_details;
	select * from LMS_SUPPLIERS_DETAILS;

	select supplier_id,count(supplier_id) from lms_book_details group by SUPPLIER_ID;

	select supplier_id,count(supplier_id) from LMS_BOOK_DETAILS group by supplier_id 
	having count(supplier_id)>=All(	select count(supplier_id) from lms_book_details
	group by SUPPLIER_ID);

	
	select l1.book_code,l1.book_title,l2.supplier_name,l1.supplier_id from LMS_BOOK_DETAILS as l1 join 
	LMS_SUPPLIERS_DETAILS as l2 on l1.SUPPLIER_ID=l2.SUPPLIER_ID
	where l1.supplier_id=(select supplier_id from LMS_BOOK_DETAILS group by supplier_id 
	having count(supplier_id)>=All(	select count(supplier_id) from lms_book_details
	group by SUPPLIER_ID))
	group by l1.book_code,l1.book_title,l2.supplier_name,l1.supplier_id;

							------ Or ------
	
	select l1.book_code,l1.book_title,l2.supplier_name,l1.supplier_id from LMS_BOOK_DETAILS as l1 join 
	LMS_SUPPLIERS_DETAILS as l2 on l1.SUPPLIER_ID=l2.SUPPLIER_ID
	group by l1.book_code,l1.book_title,l2.supplier_name,l1.supplier_id
	having l1.supplier_id=(select supplier_id from LMS_BOOK_DETAILS group by supplier_id 
	having count(supplier_id)>=All(	select count(supplier_id) from lms_book_details
	group by SUPPLIER_ID));

/* Problem # 2:
	Write a query to display the member id, member name and number of remaining books he/she can take with “REMAININGBOOKS” as alias name. 
	Hint:  Assuming a member can take maximum 3 books.  For example, Ramesh has already taken 2 books; he can take only one book now.
	Hence display the remaining books as 1 in below format. 
	
	Example: 
	MEMBER_ID       MEMBER_NAME    REMAININGBOOKS
	LM001             RAMESH	         1
	LM002             MOHAN	             3  */

	select * from LMS_MEMBERS;
	select * from LMS_BOOK_ISSUE;

	--->> Query to display the number of books taken

	select l2.member_id,l1.member_name,count(l2.member_id) as No_of_books_Taken from LMS_MEMBERS as l1 join 
	LMS_BOOK_ISSUE as l2 on l1.member_id=l2.MEMBER_ID
	group by l1.member_name,l2.MEMBER_ID;

	--->> Query to display the number of books Remaining 

	select l2.member_id,l1.member_name,3-count(l2.member_id) as Remaining_books from LMS_MEMBERS as l1 join 
	LMS_BOOK_ISSUE as l2 on l1.member_id=l2.MEMBER_ID
	group by l1.member_name,l2.MEMBER_ID;

/* Problem # 3 
	Write a query to display the supplier id and supplier name of the supplier who has supplied minimum number of books. 
	For example, if “ABC Store” supplied 3 books, “LM Store” has supplied 2 books and “XYZ Store” has supplied 1 book. 
	So “XYZ Store” has supplied minimum number of books, hence display the details as mentioned below. 
	
	Example:
	SUPPLIER_ID		SUPPLIER_NAME
		S04	          XYZ STORE */

select * from LMS_SUPPLIERS_DETAILS;
select * from LMS_BOOK_DETAILS;

select l2.supplier_id,l1.supplier_name,count(l2.supplier_id) as No_of_Books_Supplied from LMS_SUPPLIERS_DETAILS as l1 join
LMS_BOOK_DETAILS as l2 on l1.SUPPLIER_ID=l2.SUPPLIER_ID
group by l2.supplier_id,l1.supplier_name 
having  count(l2.supplier_id)<= all(select count(supplier_id) from LMS_BOOK_DETAILS where supplier_id is not null group by supplier_id);  















