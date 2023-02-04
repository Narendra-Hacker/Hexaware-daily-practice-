Create database lms_db;
USE [lms_db]
GO
/****** Object:  Table [dbo].[LMS_BOOK_DETAILS]    Script Date: 01-02-2023 15:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LMS_BOOK_DETAILS](
	[BOOK_CODE] [varchar](10) NOT NULL,
	[BOOK_TITLE] [varchar](50) NOT NULL,
	[CATEGORY] [varchar](15) NOT NULL,
	[AUTHOR] [varchar](30) NOT NULL,
	[PUBLICATION] [varchar](30) NULL,
	[PUBLISH_DATE] [date] NULL,
	[BOOK_EDITION] [int] NULL,
	[PRICE] [decimal](8, 2) NULL,
	[RACK_NUM] [varchar](3) NULL,
	[DATE_ARRIVAL] [date] NOT NULL,
	[SUPPLIER_ID] [varchar](3) NULL,
 CONSTRAINT [LMS_cts4] PRIMARY KEY CLUSTERED 
(
	[BOOK_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LMS_BOOK_ISSUE]    Script Date: 01-02-2023 15:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LMS_BOOK_ISSUE](
	[BOOK_ISSUE_NO] [int] NOT NULL,
	[MEMBER_ID] [varchar](10) NOT NULL,
	[BOOK_CODE] [varchar](10) NOT NULL,
	[DATE_ISSUE] [date] NOT NULL,
	[DATE_RETURN] [date] NOT NULL,
	[DATE_RETURNED] [date] NULL,
	[FINE_RANGE] [varchar](3) NULL,
 CONSTRAINT [LMS_cts5] PRIMARY KEY CLUSTERED 
(
	[BOOK_ISSUE_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LMS_FINE_DETAILS]    Script Date: 01-02-2023 15:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LMS_FINE_DETAILS](
	[FINE_RANGE] [varchar](3) NOT NULL,
	[FINE_AMOUNT] [decimal](10, 2) NOT NULL,
 CONSTRAINT [LMS_cts3] PRIMARY KEY CLUSTERED 
(
	[FINE_RANGE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LMS_MEMBERS]    Script Date: 01-02-2023 15:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LMS_MEMBERS](
	[MEMBER_ID] [varchar](10) NOT NULL,
	[MEMBER_NAME] [varchar](30) NOT NULL,
	[CITY] [varchar](20) NULL,
	[DATE_REGISTER] [date] NOT NULL,
	[DATE_EXPIRE] [date] NULL,
	[MEMBERSHIP_STATUS] [varchar](15) NOT NULL,
 CONSTRAINT [LMS_cts1] PRIMARY KEY CLUSTERED 
(
	[MEMBER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LMS_SUPPLIERS_DETAILS]    Script Date: 01-02-2023 15:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LMS_SUPPLIERS_DETAILS](
	[SUPPLIER_ID] [varchar](3) NOT NULL,
	[SUPPLIER_NAME] [varchar](30) NOT NULL,
	[ADDRESS] [varchar](50) NULL,
	[CONTACT] [bigint] NOT NULL,
	[EMAIL] [varchar](15) NOT NULL,
 CONSTRAINT [LMS_cts2] PRIMARY KEY CLUSTERED 
(
	[SUPPLIER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LMS_BOOK_DETAILS] ([BOOK_CODE], [BOOK_TITLE], [CATEGORY], [AUTHOR], [PUBLICATION], [PUBLISH_DATE], [BOOK_EDITION], [PRICE], [RACK_NUM], [DATE_ARRIVAL], [SUPPLIER_ID]) VALUES (N'BL000001', N'Java How To Do Program', N'JAVA', N'Paul J. Deitel', N'Prentice Hall', CAST(N'1999-12-10' AS Date), 6, CAST(600.00 AS Decimal(8, 2)), N'A1', CAST(N'2011-05-10' AS Date), N'S01')
INSERT [dbo].[LMS_BOOK_DETAILS] ([BOOK_CODE], [BOOK_TITLE], [CATEGORY], [AUTHOR], [PUBLICATION], [PUBLISH_DATE], [BOOK_EDITION], [PRICE], [RACK_NUM], [DATE_ARRIVAL], [SUPPLIER_ID]) VALUES (N'BL000002', N'Java: The Complete Reference ', N'JAVA', N'Herbert Schildt', N'Tata Mcgraw Hill ', CAST(N'2011-10-10' AS Date), 5, CAST(750.00 AS Decimal(8, 2)), N'A1', CAST(N'2011-05-10' AS Date), N'S03')
INSERT [dbo].[LMS_BOOK_DETAILS] ([BOOK_CODE], [BOOK_TITLE], [CATEGORY], [AUTHOR], [PUBLICATION], [PUBLISH_DATE], [BOOK_EDITION], [PRICE], [RACK_NUM], [DATE_ARRIVAL], [SUPPLIER_ID]) VALUES (N'BL000003', N'Java How To Do Program', N'JAVA', N'Paul J. Deitel', N'Prentice Hall', CAST(N'1999-05-10' AS Date), 6, CAST(600.00 AS Decimal(8, 2)), N'A1', CAST(N'2012-05-10' AS Date), N'S01')
INSERT [dbo].[LMS_BOOK_DETAILS] ([BOOK_CODE], [BOOK_TITLE], [CATEGORY], [AUTHOR], [PUBLICATION], [PUBLISH_DATE], [BOOK_EDITION], [PRICE], [RACK_NUM], [DATE_ARRIVAL], [SUPPLIER_ID]) VALUES (N'BL000004', N'Java: The Complete Reference ', N'JAVA', N'Herbert Schildt', N'Tata Mcgraw Hill ', CAST(N'2011-10-10' AS Date), 5, CAST(750.00 AS Decimal(8, 2)), N'A1', CAST(N'2012-05-11' AS Date), N'S01')
INSERT [dbo].[LMS_BOOK_DETAILS] ([BOOK_CODE], [BOOK_TITLE], [CATEGORY], [AUTHOR], [PUBLICATION], [PUBLISH_DATE], [BOOK_EDITION], [PRICE], [RACK_NUM], [DATE_ARRIVAL], [SUPPLIER_ID]) VALUES (N'BL000005', N'Java How To Do Program', N'JAVA', N'Paul J. Deitel', N'Prentice Hall', CAST(N'1999-12-10' AS Date), 6, CAST(600.00 AS Decimal(8, 2)), N'A1', CAST(N'2012-05-11' AS Date), N'S01')
INSERT [dbo].[LMS_BOOK_DETAILS] ([BOOK_CODE], [BOOK_TITLE], [CATEGORY], [AUTHOR], [PUBLICATION], [PUBLISH_DATE], [BOOK_EDITION], [PRICE], [RACK_NUM], [DATE_ARRIVAL], [SUPPLIER_ID]) VALUES (N'BL000006', N'Java: The Complete Reference ', N'JAVA', N'Herbert Schildt Paul', N'Tata Mcgraw Hill ', CAST(N'2011-10-10' AS Date), 5, CAST(750.00 AS Decimal(8, 2)), N'A1', CAST(N'2012-05-12' AS Date), N'S03')
INSERT [dbo].[LMS_BOOK_DETAILS] ([BOOK_CODE], [BOOK_TITLE], [CATEGORY], [AUTHOR], [PUBLICATION], [PUBLISH_DATE], [BOOK_EDITION], [PRICE], [RACK_NUM], [DATE_ARRIVAL], [SUPPLIER_ID]) VALUES (N'BL000007', N'Let Us C', N'C', N'Yashavant Kanetkar ', N'BPB Publications', CAST(N'2010-12-11' AS Date), 9, CAST(500.00 AS Decimal(8, 2)), N'A3', CAST(N'2010-11-03' AS Date), N'S03')
INSERT [dbo].[LMS_BOOK_DETAILS] ([BOOK_CODE], [BOOK_TITLE], [CATEGORY], [AUTHOR], [PUBLICATION], [PUBLISH_DATE], [BOOK_EDITION], [PRICE], [RACK_NUM], [DATE_ARRIVAL], [SUPPLIER_ID]) VALUES (N'BL000008', N'Let Us SQL', N'SQL', N'Yashavant Kanetkar ', N'BPB Publications', CAST(N'2010-05-12' AS Date), 9, NULL, NULL, CAST(N'2011-08-09' AS Date), N'S04')
INSERT [dbo].[LMS_BOOK_DETAILS] ([BOOK_CODE], [BOOK_TITLE], [CATEGORY], [AUTHOR], [PUBLICATION], [PUBLISH_DATE], [BOOK_EDITION], [PRICE], [RACK_NUM], [DATE_ARRIVAL], [SUPPLIER_ID]) VALUES (N'BL000009', N'.Net Core', N'.Net', N'Dhivya', N'CloudKampus Publications', CAST(N'2022-07-10' AS Date), 1, CAST(500.00 AS Decimal(8, 2)), N'A2', CAST(N'2022-07-15' AS Date), NULL)
GO
INSERT [dbo].[LMS_BOOK_ISSUE] ([BOOK_ISSUE_NO], [MEMBER_ID], [BOOK_CODE], [DATE_ISSUE], [DATE_RETURN], [DATE_RETURNED], [FINE_RANGE]) VALUES (1, N'LM001', N'BL000001', CAST(N'2012-05-01' AS Date), CAST(N'2012-05-16' AS Date), CAST(N'2012-05-16' AS Date), N'R0')
INSERT [dbo].[LMS_BOOK_ISSUE] ([BOOK_ISSUE_NO], [MEMBER_ID], [BOOK_CODE], [DATE_ISSUE], [DATE_RETURN], [DATE_RETURNED], [FINE_RANGE]) VALUES (2, N'LM002', N'BL000002', CAST(N'2012-05-01' AS Date), CAST(N'2012-05-06' AS Date), CAST(N'2012-05-16' AS Date), N'R2')
INSERT [dbo].[LMS_BOOK_ISSUE] ([BOOK_ISSUE_NO], [MEMBER_ID], [BOOK_CODE], [DATE_ISSUE], [DATE_RETURN], [DATE_RETURNED], [FINE_RANGE]) VALUES (3, N'LM003', N'BL000007', CAST(N'2012-04-01' AS Date), CAST(N'2012-04-16' AS Date), CAST(N'2012-04-20' AS Date), N'R1')
INSERT [dbo].[LMS_BOOK_ISSUE] ([BOOK_ISSUE_NO], [MEMBER_ID], [BOOK_CODE], [DATE_ISSUE], [DATE_RETURN], [DATE_RETURNED], [FINE_RANGE]) VALUES (4, N'LM004', N'BL000005', CAST(N'2012-04-01' AS Date), CAST(N'2012-04-16' AS Date), CAST(N'2012-04-20' AS Date), N'R1')
INSERT [dbo].[LMS_BOOK_ISSUE] ([BOOK_ISSUE_NO], [MEMBER_ID], [BOOK_CODE], [DATE_ISSUE], [DATE_RETURN], [DATE_RETURNED], [FINE_RANGE]) VALUES (5, N'LM005', N'BL000008', CAST(N'2012-03-30' AS Date), CAST(N'2012-04-15' AS Date), CAST(N'2012-04-20' AS Date), N'R1')
INSERT [dbo].[LMS_BOOK_ISSUE] ([BOOK_ISSUE_NO], [MEMBER_ID], [BOOK_CODE], [DATE_ISSUE], [DATE_RETURN], [DATE_RETURNED], [FINE_RANGE]) VALUES (6, N'LM005', N'BL000008', CAST(N'2012-04-20' AS Date), CAST(N'2012-05-05' AS Date), CAST(N'2012-05-05' AS Date), N'R0')
INSERT [dbo].[LMS_BOOK_ISSUE] ([BOOK_ISSUE_NO], [MEMBER_ID], [BOOK_CODE], [DATE_ISSUE], [DATE_RETURN], [DATE_RETURNED], [FINE_RANGE]) VALUES (7, N'LM003', N'BL000007', CAST(N'2012-04-22' AS Date), CAST(N'2012-05-07' AS Date), CAST(N'2012-05-25' AS Date), N'R4')
GO
INSERT [dbo].[LMS_FINE_DETAILS] ([FINE_RANGE], [FINE_AMOUNT]) VALUES (N'R0', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[LMS_FINE_DETAILS] ([FINE_RANGE], [FINE_AMOUNT]) VALUES (N'R1', CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[LMS_FINE_DETAILS] ([FINE_RANGE], [FINE_AMOUNT]) VALUES (N'R2', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[LMS_FINE_DETAILS] ([FINE_RANGE], [FINE_AMOUNT]) VALUES (N'R3', CAST(75.00 AS Decimal(10, 2)))
INSERT [dbo].[LMS_FINE_DETAILS] ([FINE_RANGE], [FINE_AMOUNT]) VALUES (N'R4', CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[LMS_FINE_DETAILS] ([FINE_RANGE], [FINE_AMOUNT]) VALUES (N'R5', CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[LMS_FINE_DETAILS] ([FINE_RANGE], [FINE_AMOUNT]) VALUES (N'R6', CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[LMS_FINE_DETAILS] ([FINE_RANGE], [FINE_AMOUNT]) VALUES (N'R7 ', CAST(225.00 AS Decimal(10, 2)))
INSERT [dbo].[LMS_FINE_DETAILS] ([FINE_RANGE], [FINE_AMOUNT]) VALUES (N'R8 ', CAST(250.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[LMS_MEMBERS] ([MEMBER_ID], [MEMBER_NAME], [CITY], [DATE_REGISTER], [DATE_EXPIRE], [MEMBERSHIP_STATUS]) VALUES (N'LM001', N'AMIT', N'CHENNAI', CAST(N'2012-02-12' AS Date), CAST(N'2013-02-11' AS Date), N'Temporary')
INSERT [dbo].[LMS_MEMBERS] ([MEMBER_ID], [MEMBER_NAME], [CITY], [DATE_REGISTER], [DATE_EXPIRE], [MEMBERSHIP_STATUS]) VALUES (N'LM002', N'ABDHUL', N'DELHI', CAST(N'2012-04-10' AS Date), CAST(N'2013-04-09' AS Date), N'Temporary')
INSERT [dbo].[LMS_MEMBERS] ([MEMBER_ID], [MEMBER_NAME], [CITY], [DATE_REGISTER], [DATE_EXPIRE], [MEMBERSHIP_STATUS]) VALUES (N'LM003', N'GAYAN', N'CHENNAI', CAST(N'2012-05-13' AS Date), CAST(N'2013-05-12' AS Date), N'Permanent')
INSERT [dbo].[LMS_MEMBERS] ([MEMBER_ID], [MEMBER_NAME], [CITY], [DATE_REGISTER], [DATE_EXPIRE], [MEMBERSHIP_STATUS]) VALUES (N'LM004', N'RADHA', N'CHENNAI', CAST(N'2012-04-22' AS Date), CAST(N'2013-04-21' AS Date), N'Temporary')
INSERT [dbo].[LMS_MEMBERS] ([MEMBER_ID], [MEMBER_NAME], [CITY], [DATE_REGISTER], [DATE_EXPIRE], [MEMBERSHIP_STATUS]) VALUES (N'LM005', N'GURU', N'BANGALORE', CAST(N'2012-03-30' AS Date), CAST(N'2013-05-16' AS Date), N'Temporary')
INSERT [dbo].[LMS_MEMBERS] ([MEMBER_ID], [MEMBER_NAME], [CITY], [DATE_REGISTER], [DATE_EXPIRE], [MEMBERSHIP_STATUS]) VALUES (N'LM006', N'MOHAN', N'CHENNAI', CAST(N'2012-04-12' AS Date), CAST(N'2013-05-16' AS Date), N'Temporary')
INSERT [dbo].[LMS_MEMBERS] ([MEMBER_ID], [MEMBER_NAME], [CITY], [DATE_REGISTER], [DATE_EXPIRE], [MEMBERSHIP_STATUS]) VALUES (N'LM007', N'Vishnu', N'Hyderbad', CAST(N'2001-01-23' AS Date), CAST(N'2005-01-23' AS Date), N'Permanent')
INSERT [dbo].[LMS_MEMBERS] ([MEMBER_ID], [MEMBER_NAME], [CITY], [DATE_REGISTER], [DATE_EXPIRE], [MEMBERSHIP_STATUS]) VALUES (N'LM008', N'Barga', N'Pune', CAST(N'2016-10-20' AS Date), CAST(N'2017-10-20' AS Date), N'Permanent')
GO
INSERT [dbo].[LMS_SUPPLIERS_DETAILS] ([SUPPLIER_ID], [SUPPLIER_NAME], [ADDRESS], [CONTACT], [EMAIL]) VALUES (N'S01', N'SINGAPORE SHOPPEE', N'CHENNAI', 9894123555, N'sing@gmail.com')
INSERT [dbo].[LMS_SUPPLIERS_DETAILS] ([SUPPLIER_ID], [SUPPLIER_NAME], [ADDRESS], [CONTACT], [EMAIL]) VALUES (N'S02', N'JK Stores', N'MUMBAI', 9940123450, N'jks@yahoo.com')
INSERT [dbo].[LMS_SUPPLIERS_DETAILS] ([SUPPLIER_ID], [SUPPLIER_NAME], [ADDRESS], [CONTACT], [EMAIL]) VALUES (N'S03', N'ROSE BOOK STORE', N'TRIVANDRUM', 9444411222, N'rose@gmail.com')
INSERT [dbo].[LMS_SUPPLIERS_DETAILS] ([SUPPLIER_ID], [SUPPLIER_NAME], [ADDRESS], [CONTACT], [EMAIL]) VALUES (N'S04', N'KAVARI STORE', N'DELHI', 8630001452, N'kavi@redif.com')
INSERT [dbo].[LMS_SUPPLIERS_DETAILS] ([SUPPLIER_ID], [SUPPLIER_NAME], [ADDRESS], [CONTACT], [EMAIL]) VALUES (N'S05', N'EINSTEN BOOK GALLARY', N'US', 9542000001, N'eingal@aol.com')
INSERT [dbo].[LMS_SUPPLIERS_DETAILS] ([SUPPLIER_ID], [SUPPLIER_NAME], [ADDRESS], [CONTACT], [EMAIL]) VALUES (N'S06', N'AKBAR STORE', N'MUMBAI', 7855623100, N'akbakst@aol.com')
GO
/*ALTER TABLE [dbo].[LMS_BOOK_DETAILS]  WITH CHECK ADD  CONSTRAINT [LMS_cts41] FOREIGN KEY([SUPPLIER_ID])
REFERENCES [dbo].[LMS_SUPPLIERS_DETAILS] ([SUPPLIER_ID])
GO
ALTER TABLE [dbo].[LMS_BOOK_DETAILS] CHECK CONSTRAINT [LMS_cts41]
GO
ALTER TABLE [dbo].[LMS_BOOK_ISSUE]  WITH CHECK ADD  CONSTRAINT [LMS_BookDetail] FOREIGN KEY([BOOK_CODE])
REFERENCES [dbo].[LMS_BOOK_DETAILS] ([BOOK_CODE])
GO
ALTER TABLE [dbo].[LMS_BOOK_ISSUE] CHECK CONSTRAINT [LMS_BookDetail]
GO
ALTER TABLE [dbo].[LMS_BOOK_ISSUE]  WITH CHECK ADD  CONSTRAINT [LMS_FineDetail] FOREIGN KEY([FINE_RANGE])
REFERENCES [dbo].[LMS_FINE_DETAILS] ([FINE_RANGE])
GO
ALTER TABLE [dbo].[LMS_BOOK_ISSUE] CHECK CONSTRAINT [LMS_FineDetail]
GO
ALTER TABLE [dbo].[LMS_BOOK_ISSUE]  WITH CHECK ADD  CONSTRAINT [LMS_Mem] FOREIGN KEY([MEMBER_ID])
REFERENCES [dbo].[LMS_MEMBERS] ([MEMBER_ID])
GO
ALTER TABLE [dbo].[LMS_BOOK_ISSUE] CHECK CONSTRAINT [LMS_Mem]
GO
*/

select * from lms_book_details;
select * from lms_book_issue; 

/* Problem # 1:
	Write a query to display the member id, member name, city and membership status who are all having life time membership. Hint: Life time membership status is “Permanent”. */

select * from LMS_MEMBERS;

select member_id,member_name,city,membership_status from lms_members where MEMBERSHIP_STATUS='Permanent';

/*  Problem # 3:
	Write a query to display the member id, member name who have taken the book with book code 'BL000002'. */

select * from LMS_MEMBERS;
select * from lms_book_issue;

select member_id,member_name from lms_members where member_id =(select member_id from lms_book_issue where book_code = 'BL000002');

/* Problem # 4:
	Write a query to display the book code, book title and author of the books whose author name begins with 'P'. */

select * from lms_book_details;

select book_code,book_title,author,PUBLISH_DATE from lms_book_details where author like 'P%';

/* Problem # 5:
	Write a query to display the total number of Java books available in library with alias name ‘NO_OF_BOOKS’. */

select * from lms_book_details;

select count(book_code) as NO_OF_BOOKS from lms_book_details where book_title like '%Java%';
 
								---- or	----

select count(book_code) as NO_OF_BOOKS from lms_book_details where category='JAVA';


/* Problem # 6:
	Write a query to list the category and number of books in each category with alias name ‘NO_OF_BOOKS’.*/

select * from lms_book_details;

select category,count(book_code) as NO_OF_BOOKS from lms_book_details group by category order by category;

/* Problem # 7:
	Write a query to display the number of books published by "Prentice Hall” with the alias name “NO_OF_BOOKS”.*/

select * from lms_book_details;

select publish_date, count(book_code) as NO_OF_BOOKS from lms_book_details where publication='prentice hall'group by publish_date;

/* Problem # 8:
	Write a query to display the book code, book title of the books which are issued on the date "1st April 2012".*/

select * from lms_book_details;
select * from lms_book_issue;

select book_code,book_title from lms_book_details where book_code in (select book_code from lms_book_issue where date_issue='2012-04-01');

/* Problem # 9:
	Write a query to display the member id, member name, date of registration and expiry date of the members whose membership expiry date is before APR 2013.*/

select * from lms_members;

select member_id,member_name,date_register,date_expire from lms_members where date_expire< '2013-04-01'; 

/* Problem # 10:
	write a query to display the member id, member name, date of registration, membership status of the members who registered before  "March 2012" and membership status is "Temporary" */

select * from lms_members;

select member_id,member_name,date_register,membership_status from lms_members where (date_register<'2012-03-01') and membership_status='Temporary';

/* Problem #11:
	Write a query to display the member id, member name who’s City is CHENNAI or DELHI. Hint: Display the member name in title case with alias name 'Name'. */

select * from lms_members;

select member_id,member_name,city from lms_members where city='CHENNAI' or city='DELHI';

/* Problem #12:
Write a query to concatenate book title, author and display in the following format.
Book_Title_is_written_by_Author
Example:  Let Us C_is_written_by_Yashavant Kanetkar
Hint: display unique books. Use “BOOK_WRITTEN_BY” as alias name. */

/* SELECT 
    Title, 
    FirstName, 
    MiddleName, 
    LastName,
    CONCAT(Title,' ',FirstName,' ',MiddleName,' ',LastName) as MailingName
FROM Person
*/

select * from lms_book_details;

select book_code,concat(Book_title,'_is_written_by_'+author) as Book_Written_By from lms_book_details;

/* Problem #13:
	Write a query to display the average price of books which is belonging to ‘JAVA’ category with alias name “AVERAGEPRICE”.*/

select * from lms_book_details;

select avg(price) from lms_book_details where CATEGORY = 'JAVA';

  --- Another query based on avg() function

select avg(price) from lms_book_details where book_code <='BL000006';

/* Problem #14:
	Write a query to display the supplier id, supplier name and email of the suppliers who are all having gmail account. */

	select * from LMS_SUPPLIERS_DETAILS;

	select supplier_id,supplier_name,email from LMS_SUPPLIERS_DETAILS where email like '%@gmail.com';

/* Problem#16:
	Write a query to display the supplier id, supplier name and contact.  If phone number is null then display ‘No’ else display ‘Yes’ 
	with alias name “PHONENUMAVAILABLE”. Hint: Use ISNULL.*/

	select * from lms_suppliers_details;

	select supplier_id,supplier_name,contact from lms_suppliers_details where contact is not null;

--> ISNULL( check_expression, replacement_value ) 
	/* The ISNULL Function is a built-in function to replace nulls with specified replacement values.
		To use this function, all you need to do is pass the column name in the first parameter and in 
		the second parameter pass the value with which you want to replace the null value */

--> Usage of case statement in sql
	--> Example query:
		/* 
		SELECT P_Id
			CASE 
				WHEN Name IS NULL THEN 'No Name' ELSE Name
			END
				AS Name
			CASE 
				WHEN Gender IS NULL THEN 'No Gender' ELSE Gender
			END
				AS Gender
		FROM Persons_tbl;
		*/

	select supplier_id,supplier_name,contact, 
		case 
			when contact is null then 'No' ELSE 'Yes'
		end
		as Phone_Num_Available 
	from lms_suppliers_details;


























