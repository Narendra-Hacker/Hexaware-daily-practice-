use lms_db;

select * from lms_suppliers_details;
select * from lms_book_details;

-- Display the bookcode,book name and supplier name of the books in library

-- Inner Join = default keyword is "JOIN"

select book_code,book_title,supplier_name
from lms_book_details join LMS_SUPPLIERS_DETAILS
on lms_book_details.supplier_id = lms_suppliers_details.supplier_id;

					--- or ---
--The above query can also be written as:
select l1.book_code,l1.book_title,l2.supplier_name
from lms_book_details as l1 join lms_suppliers_details as l2
on l1.supplier_id=l2.supplier_id;

-- N Tables will need N-1 Joins

-- Display the book_title and the memner_id who has taken the books from library

select * from lms_book_details;
select * from lms_members;
select * from lms_book_issue;

select distinct book_title,member_id from lms_book_details join lms_book_issue on
lms_book_details.book_code = lms_book_issue.book_code;

-- Display the Book name and member name who has taken book from the library -- screenshot(5689)
select * from lms_book_details;
select * from lms_members;
select * from lms_book_issue;

select distinct l3.Book_title,l1.member_name from lms_members as l1 join lms_book_issue as l2 on l1.member_id=l2.member_id join lms_book_details as l3 on l2.book_code = l3.book_code;


-- Display the supplier_id and number of book supplied by each supplier
select * from lms_suppliers_details;

select supplier_id,count(book_code) 
from lms_book_details 
where supplier_id is not null
group by supplier_id; 

-- Dispaly the supplier_name and number of book supplied by each supplier
select * from lms_suppliers_details;
select * from lms_book_details;

select l1.supplier_name,count(l2.book_code) as count from lms_suppliers_details as l1 join 
lms_book_details as l2 on l1.supplier_id=l2.supplier_id
group by l1.supplier_name;

									-- or --


select l1.supplier_id,l1.supplier_name,count(l2.supplier_id) as count from lms_suppliers_details as l1 join 
lms_book_details as l2 on l1.supplier_id=l2.supplier_id
group by l1.supplier_name,l1.supplier_id; 


/* 
	The below is not working it is giving the following error 

-- Column 'lms_suppliers_details.SUPPLIER_NAME' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause. --

query:		select l1.supplier_name,count(l2.supplier_id) as count from lms_suppliers_details as l1 join 
			lms_book_details as l2 on l1.supplier_id=l2.supplier_id
			group by l2.supplier_id; 
*/

use Employee_DB;

select * from employee;
select * from department;
select * from location;

-- Display employee name,email and department name

select first_name+','+last_name as Name, email,name from employee join department
on employee.department_id=department.id;

-- Display employee name, department name and the state location

select e.first_name, d.name as Dept,l.state
from employee as e join department as d on e.department_id=d.id join 
location as l on l.id = d.location_id;

-- in the inner join the order of the tables when they are related does not make any difference

-- Display department_id and number of employees in each department

select department_id, count(id) as CountofEmps from employee group by department_id;

-- Display department name and number of employees in each department

select d.name,count(*) from employee as e join 
department as d on e.department_id=d.id
group by name;

select d.name,count(*) from employee as e join 
department as d on e.department_id=d.id
group by d.name;



use lms_db;
-- 1.	Write a query to display the book title, supplier name who has supplied books to library.

select * from lms_book_details;
select * from lms_suppliers_details;

select distinct l1.book_title,l2.supplier_name from lms_book_details as l1 join lms_suppliers_details as l2 on l1.supplier_id=l2.supplier_id;

-- 2.	Write a query to display member name and book code for the book he/she taken from the library.

select * from lms_members;
select * from lms_book_issue;

select distinct l1.member_name,l2.book_code from lms_members as l1 join lms_book_issue as l2 on l1.member_id=l2.member_id;

-- 3.	Write a query to display the book title and date when the book was taken from the library.

select * from lms_book_details;
select * from lms_book_issue;

select l1.book_title, l2.date_issue from lms_book_details as l1 join lms_book_issue as l2 on l1.book_code=l2.book_code;


-- 4.	Write a query to display the member id and the fine amount paid by the member in the library.

select * from lms_book_issue;
select * from lms_fine_details;

select l1.member_id,l2.fine_amount from lms_book_issue as l1 join lms_fine_details as l2 on l1.fine_range=l2.fine_range;

-- 5.	Write a query to display the member name and the date difference between the date return and date returned.

select * from lms_members;
select * from lms_book_issue;

select l1.member_name,l2.book_code,DateDiff(day,l2.date_return,l2.date_returned) as No_of_Extra_days from lms_members as l1 join lms_book_issue as l2 on l1.member_id=l2.member_id;

-- 6.	Write a query to display the book title and the member name of member who has taken book from library.

select * from lms_members;
select * from lms_book_issue;
select * from lms_book_details;

select distinct l1.book_title,l3.member_name from lms_book_details as l1 join lms_book_issue as l2 on l1.book_code = l2.book_code join lms_members as l3 on l2.member_id=l3.member_id;

-- 7.	Write a query to display the book title, member name and the supplier name for the books taken from the library.

select * from lms_book_details;
select * from lms_members;
select * from lms_suppliers_details;
select * from lms_book_issue;

select distinct l3.book_title,l1.member_name,l4.supplier_name from lms_members as l1 join 
lms_book_issue as l2 on l1.member_id=l2.member_id join 
lms_book_details as l3 on l2.book_code =l3.book_code join 
lms_suppliers_details as l4 on l3.supplier_id=l4.supplier_id;


-- 8.	Write a query to display the book title and the different fine amount paid for the book in library.

select * from lms_fine_details;
select * from lms_book_issue;
select * from lms_book_details;

select book_title,fine_amount from lms_fine_details as l1 join 
lms_book_issue as l2 on l1.fine_range=l2.fine_range join
lms_book_details as l3 on l2.book_code=l3.book_code;

--> Questions from Ansi document based on lms_db
--> Simple questions

--> Problem#17:
	-- Write a query to display the member id, member name, city and member status of members with the total fine paid by them with alias name “Fine”.
	
	use lms_db;
	
	select * from lms_members;
	select * from LMS_BOOK_ISSUE;
	select * from LMS_FINE_DETAILS;

	select l1.member_id,l1.member_name,l1.city,l1.MEMBERSHIP_STATUS, sum(l3.fine_amount) as Total_fine_amount from lms_members as l1 join lms_book_issue as l2 on l1.member_id=l2.member_id join
	LMS_FINE_DETAILS as l3 on l2.fine_range=l3.fine_range group by l1.member_id,l1.member_name,l1.city,l1.MEMBERSHIP_STATUS;

--> Average Questions

--> Problem # 1:
--	Write a query to display the member id, member name of the members, book code and book title of the books taken by them.
	
	select * from LMS_BOOK_ISSUE;
	select * from LMS_MEMBERS;
	select * from LMS_BOOK_DETAILS;

	select distinct l1.member_id,l1.member_name,l2.book_code,l3.book_title from lms_members as l1 join LMS_BOOK_ISSUE as l2 on l1.member_id=l2.member_id join
	LMS_BOOK_DETAILS as l3 on l2.BOOK_CODE=l3.book_code order by l1.member_id;

--> Problem # 3:
--	Write a query to display the member id, member name, fine range and fine amount of the members whose fine amount is less than 100. 

	select * from LMS_MEMBERS;
	select * from LMS_BOOK_ISSUE;
	select * from LMS_FINE_DETAILS;

	select l1.member_id,l1.member_name,l3.fine_range,l3.fine_amount from LMS_MEMBERS as l1 join LMS_BOOK_ISSUE as l2 on l1.member_id=l2.MEMBER_ID join
	LMS_FINE_DETAILS as l3 on l2.FINE_RANGE=l3.FINE_RANGE where l3.fine_amount<100;


	--> For the Overall fine amount
	select l1.member_id,l1.member_name,sum(l3.fine_amount) as Total_fine_amount from LMS_MEMBERS as l1 join LMS_BOOK_ISSUE as l2 on l1.member_id=l2.MEMBER_ID join
	LMS_FINE_DETAILS as l3 on l2.FINE_RANGE=l3.FINE_RANGE  group by l1.member_id,l1.member_name having sum(fine_amount)<100;


--> Problem # 4:
--	Write a query to display the book code, book title, publisher, edition, price and year of publication and sort based on year of publication, publisher and edition.
	
	select * from lms_book_details;

	-->> To extract the year from a date we use the year() function
			--> Def: The YEAR() function returns the year part for a specified date.
			--> Syntax: YEAR(date)
			--> Example: SELECT YEAR('1998/05/25 09:08') AS Year;

	select Book_code,book_title,publication,book_edition,price,year(publish_date) as Year_of_Publicaton 
	from LMS_BOOK_DETAILS
	order by Year_of_Publicaton,PUBLICATION,BOOK_EDITION;

								-------- or ----------

	--> To have an extra column for sorting

	select Book_code,book_title,publication,book_edition,price,year(publish_date) as Year_of_Publicaton 
	from LMS_BOOK_DETAILS
	order by Year_of_Publicaton,PUBLICATION,BOOK_EDITION,book_code desc;
	   
--> Problem # 5:
--	Write a query to display the book code, book title and rack number of the books which are placed in rack 'A1' and sort by book title in ascending order. 

	select * from LMS_BOOK_DETAILS;
	select distinct book_code,book_title,rack_num from lms_book_details where rack_num='A1' order by BOOK_TITLE; 

--> Problem # 6:
--	Write a query to display the member id, member name, due date and date returned of the members who has returned the books after the due date. 
--	Hint: Date_return is due date and Date_returned is actual book return date. 

	select * from lms_members;
	select * from LMS_BOOK_ISSUE;

	select l1.member_id,l1.member_name,l2.date_return as due_date,l2.date_returned from lms_members as l1 join lms_book_issue as l2 on l1.member_id=l2.member_id
	group by l1.member_id,l1.member_name,l2.date_return,l2.date_returned
	having l2.DATE_RETURN<l2.DATE_RETURNED;

								------- Or -------
	select distinct l1.member_id,l1.member_name,l2.date_return as due_date,l2.date_returned from lms_members as l1 join lms_book_issue as l2 on l1.member_id=l2.member_id
	where l1.member_id in (select member_id from lms_book_issue where date_return<DATE_RETURNED);    
	
--> Problem # 7:
--	Write a query to display the member id, member name and date of registration who have not taken any book. 

	select * from lms_members;
	select * from LMS_BOOK_ISSUE;

	select member_id,member_name,date_register from lms_members where member_id not in(select member_id from LMS_BOOK_ISSUE);

--> Problem # 8:
--	Write a Query to display the member id and member name of the members who has not paid any fine in the year 2012.

	select * from lms_members;
	select * from LMS_BOOK_ISSUE;
	select * from LMS_FINE_DETAILS;

	select l1.member_id,l1.member_name,sum(l3.FINE_AMOUNT) from lms_members as l1 join LMS_BOOK_ISSUE as l2 on l1.member_id=l2.member_id join
	LMS_FINE_DETAILS as l3 on l2.fine_range=l3.fine_range where year(l2.date_returned)='2012' group by l1.member_id,l1.member_name having sum(l3.fine_amount)=0;

--> Problem # 10:
--	Write a query to list the book title and supplier id for the books authored by “Herbert Schildt" and the book edition is 5 and supplied by supplier ‘S01’. 

	select * from lms_book_details;
	
	select Book_title,Supplier_id from lms_book_details where author='Herbert Schildt' and book_edition=5 and supplier_id='s01';

--> Problem # 11:
--	Write a query to display the rack number and the number of books in each rack with alias name “NOOFBOOKS” and sort by rack number in ascending order.

	select * from lms_book_details;

	select rack_num,count(rack_num) as No_of_Books from LMS_BOOK_DETAILS where rack_num is not null group by rack_num order by rack_num; 
	   
--> Problem # 12:
--	Write a query to display book issue number, member name, date or registration, date of expiry, book title, category, author, price, date of issue,
--	date of return, actual returned date, issue status, fine amount. 

	select * from lms_book_details;
	select * from LMS_BOOK_ISSUE;
	select * from LMS_MEMBERS;
	select * from LMS_FINE_DETAILS;
	
	select q1.member_id,q1.book_issue_no,q1.member_name,q1.DATE_REGISTER,q1.DATE_EXPIRE,q1.BOOK_TITLE,q1.CATEGORY,q1.AUTHOR,q1.PRICE,q1.DATE_ISSUE,
	q1.DATE_RETURN,q1.DATE_RETURNED,q1.MEMBERSHIP_STATUS,q1.FINE_RANGE,q2.FINE_AMOUNT
	from 
	(select distinct l1.member_id,l2.book_issue_no,l1.member_name,l1.DATE_REGISTER,l1.DATE_EXPIRE,l3.BOOK_TITLE,l3.CATEGORY,l3.AUTHOR,l3.PRICE,l2.DATE_ISSUE,
	l2.DATE_RETURN,l2.DATE_RETURNED,l1.MEMBERSHIP_STATUS,l2.FINE_RANGE
	from LMS_MEMBERS as l1 join LMS_BOOK_ISSUE as l2 on l1.member_id=l2.member_id join
	LMS_BOOK_DETAILS as l3 on l2.BOOK_CODE=l3.BOOK_CODE) as q1 join LMS_FINE_DETAILS as q2 on q1.FINE_RANGE=q2.FINE_RANGE;
	
--> Problem # 13:
--	Write a query to display the book code, title, publish date of the books which is been published in the month of December. 

	select * from LMS_BOOK_DETAILS;

	select Book_code,Book_title,Publish_Date from LMS_BOOK_DETAILS where month(publish_date)='12';

--> Problem # 15:
--	Write a query to display book code, book name, and publisher, how old the book is. Sorted as older to newer.

	select * from LMS_BOOK_DETAILS;

	select book_code,book_title,publication,publish_date,date_arrival,datediff(year,publish_date,date_arrival) as years from LMS_BOOK_DETAILS order by years desc;













