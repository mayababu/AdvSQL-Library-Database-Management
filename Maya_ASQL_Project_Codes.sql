/*Database Creation and Data Population

Objective: Create a database schema for a library management system and populate it with sample data.

Tasks:

Table Creation: Write SQL statements to create the following tables in the db_LibraryManagement database:

•	tbl_publisher
•	tbl_book
•	tbl_library_branch
•	tbl_borrower
•	tbl_book_loans
•	tbl_book_copies
•	tbl_book_authors
*/

/*Create database*/
create database db_libManagement

use db_libManagement
go

/*Create tables*/

create table  tbl_publisher(
publisher_PublisherName varchar(100) primary key,
publisher_PublisherAddress varchar(200),
publisher_PublisherPhone varchar(50))

insert into tbl_publisher (publisher_PublisherName,publisher_PublisherAddress,publisher_PublisherPhone)
values
		('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Chilton Books','Not Available','Not Available'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745')		

select * from tbl_publisher


create table tbl_book(
book_BookID int primary key,
book_Title varchar(100),
book_PublisherName varchar(100) constraint FK1 foreign key references tbl_publisher(publisher_PublisherName))

insert into tbl_book (book_BookID, book_Title, book_PublisherName)
values
		(1,'The Name of the Wind', 'DAW Books'),
		(2,'It', 'Viking'),
		(3,'The Green Mile', 'Signet Books'),
		(4,'Dune', 'Chilton Books'),
		(5,'The Hobbit', 'George Allen & Unwin'),
		(6,'Eragon', 'Alfred A. Knopf'),
		(7,'A Wise Mans Fear', 'DAW Books'),
		(8,'Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		(9,'Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		(10,'The Giving Tree', 'Harper and Row'),
		(11,'The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		(12,'Brave New World', 'Chalto & Windus'),
		(13,'The Princess Bride', 'Harcourt Brace Jovanovich'),
		(14,'Fight Club', 'W.W. Norton'),
		(15,'Holes', 'Scholastic'),
		(16,'Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		(17,'Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		(18,'The Fellowship of the Ring', 'George Allen & Unwin'),
		(19,'A Game of Thrones', 'Bantam'),
		(20,'The Lost Tribe', 'Picador USA')

select * from tbl_book


create table tbl_book_authors(
book_authors_AuthorID int primary key,
book_authors_BookID int constraint FK2 foreign key references tbl_book(book_BookID),
book_authors_AuthorName varchar(100))

insert into tbl_book_authors (book_authors_AuthorID, book_authors_BookID,book_authors_AuthorName)
values
		(1,'1','Patrick Rothfuss'),
		(2,'2','Stephen King'),
		(3,'3','Stephen King'),
		(4,'4','Frank Herbert'),
		(5,'5','J.R.R. Tolkien'),
		(6,'6','Christopher Paolini'),
		(7,'6','Patrick Rothfuss'),
		(8,'8','J.K. Rowling'),
		(9,'9','Haruki Murakami'),
		(10,'10','Shel Silverstein'),
		(11,'11','Douglas Adams'),
		(12,'12','Aldous Huxley'),
		(13,'13','William Goldman'),
		(14,'14','Chuck Palahniuk'),
		(15,'15','Louis Sachar'),
		(16,'16','J.K. Rowling'),
		(17,'17','J.K. Rowling'),
		(18,'18','J.R.R. Tolkien'),
		(19,'19','George R.R. Martin'),
		(20,'20','Mark Lee')

select * from tbl_book_authors


create table tbl_library_branch(
library_branch_BranchID int primary key,
library_branch_BranchName varchar(100),
library_branch_BranchAddress varchar(200))

insert into tbl_library_branch (library_branch_BranchID, library_branch_BranchName, library_branch_BranchAddress)
values
		(1,'Sharpstown','32 Corner Road, New York, NY 10012'),
		(2,'Central','491 3rd Street, New York, NY 10014'),
		(3,'Saline','40 State Street, Saline, MI 48176'),
		(4,'Ann Arbor','101 South University, Ann Arbor, MI 48104')

select * from tbl_library_branch


create table tbl_book_copies(
book_copies_CopiesID int primary key,
book_copies_BookID int constraint FK3 foreign key references tbl_book(book_BookID),
book_copies_BranchID int constraint FK4 foreign key references tbl_library_branch(library_branch_BranchID),
book_copies_No_Of_Copies int)

insert into tbl_book_copies (book_copies_CopiesID, book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
values
	(1,'1','1','5'),
	(2,'2','1','5'),
	(3,'3','1','5'),
	(4,'4','1','5'),
	(5,'5','1','5'),
	(6,'6','1','5'),
	(7,'7','1','5'),
	(8,'8','1','5'),
	(9,'9','1','5'),
	(10,'10','1','5'),
	(11,'11','1','5'),
	(12,'12','1','5'),
	(13,'13','1','5'),
	(14,'14','1','5'),
	(15,'15','1','5'),
	(16,'16','1','5'),
	(17,'17','1','5'),
	(18,'18','1','5'),
	(19,'19','1','5'),
	(20,'20','1','5'),
	(21,'1','2','5'),
	(22,'2','2','5'),
	(23,'3','2','5'),
	(24,'4','2','5'),
	(25,'5','2','5'),
	(26,'6','2','5'),
	(27,'7','2','5'),
	(28,'8','2','5'),
	(29,'9','2','5'),
	(30,'10','2','5'),
	(31,'11','2','5'),
	(32,'12','2','5'),
	(33,'13','2','5'),
	(34,'14','2','5'),
	(35,'15','2','5'),
	(36,'16','2','5'),
	(37,'17','2','5'),
	(38,'18','2','5'),
	(39,'19','2','5'),
	(40,'20','2','5'),
	(41,'1','3','5'),
	(42,'2','3','5'),
	(43,'3','3','5'),
	(44,'4','3','5'),
	(45,'5','3','5'),
	(46,'6','3','5'),
	(47,'7','3','5'),
	(48,'8','3','5'),
	(49,'9','3','5'),
	(50,'10','3','5'),
	(51,'11','3','5'),
	(52,'12','3','5'),
	(53,'13','3','5'),
	(54,'14','3','5'),
	(55,'15','3','5'),
	(56,'16','3','5'),
	(57,'17','3','5'),
	(58,'18','3','5'),
	(59,'19','3','5'),
	(60,'20','3','5'),
	(61,'1','4','5'),
	(62,'2','4','5'),
	(63,'3','4','5'),
	(64,'4','4','5'),
	(65,'5','4','5'),
	(66,'6','4','5'),
	(67,'7','4','5'),
	(68,'8','4','5'),
	(69,'9','4','5'),
	(70,'10','4','5'),
	(71,'11','4','5'),
	(72,'12','4','5'),
	(73,'13','4','5'),
	(74,'14','4','5'),
	(75,'15','4','5'),
	(76,'16','4','5'),
	(77,'17','4','5'),
	(78,'18','4','5'),
	(79,'19','4','5'),
	(80,'20','4','5'),
	(1000,'1','1','5'),
	(1001,'2','1','8'),
	(1002,'3','1','3'),
	(1003,'4','1','6'),
	(1004,'5','1','7'),
	(1005,'6','1','2'),
	(1006,'7','1','4'),
	(1007,'8','1','9'),
	(1008,'9','1','1'),
	(1009,'10','1','10')


select * from tbl_book_copies


create table tbl_borrower(
borrower_CardNo int primary key,
borrower_BorrowerName varchar(100),
borrower_BorrowerAddress varchar(200),
borrower_BorrowerPhone varchar(50))

insert into tbl_borrower
values
		(100,'Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
		(101,'Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
		(102,'Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
		(103,'Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
		(104,'Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
		(105,'Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
		(106,'Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
		(107,'Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513')

select * from tbl_borrower


create table tbl_book_loans(
book_loans_LoansID int primary key,
book_loans_BookID int constraint FK5 foreign key references tbl_book(book_BookID),
book_loans_BranchID int constraint FK6 foreign key references tbl_library_branch(library_branch_BranchID),
book_loans_CardNo int constraint FK7 foreign key references tbl_borrower(borrower_CardNo),
book_loans_DateOut date,
book_loans_DueDate date)

insert into tbl_book_loans (book_loans_LoansID, book_loans_BookID, book_loans_BranchID, 
book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)
values
		(1,'1','1','100','1/1/18','2/2/18'),
		(2,'2','1','100','1/1/18','2/2/18'),
		(3,'3','1','100','1/1/18','2/2/18'),
		(4,'4','1','100','1/1/18','2/2/18'),
		(5,'5','1','102','1/3/18','2/3/18'),
		(6,'6','1','102','1/3/18','2/3/18'),
		(7,'7','1','102','1/3/18','2/3/18'),
		(8,'8','1','102','1/3/18','2/3/18'),
		(9,'9','1','102','1/3/18','2/3/18'),
		(10,'11','1','102','1/3/18','2/3/18'),
		(11,'12','2','105','12/12/17','1/12/18'),
		(12,'10','2','105','12/12/17','1/12/17'),
		(13,'20','2','105','2/3/18','3/3/18'),
		(14,'18','2','105','1/5/18','2/5/18'),
		(15,'19','2','105','1/5/18','2/5/18'),
		(16,'19','2','100','1/3/18','2/3/18'),
		(17,'11','2','106','1/7/18','2/7/18'),
		(18,'1','2','106','1/7/18','2/7/18'),
		(19,'2','2','100','1/7/18','2/7/18'),
		(20,'3','2','100','1/7/18','2/7/18'),
		(21,'5','2','105','12/12/17','1/12/18'),
		(22,'4','3','103','1/9/18','2/9/18'),
		(23,'7','3','102','1/3/18','2/3/18'),
		(24,'17','3','102','1/3/18','2/3/18'),
		(25,'16','3','104','1/3/18','2/3/18'),
		(26,'15','3','104','1/3/18','2/3/18'),
		(27,'15','3','107','1/3/18','2/3/18'),
		(28,'14','3','104','1/3/18','2/3/18'),
		(29,'13','3','107','1/3/18','2/3/18'),
		(30,'13','3','102','1/3/18','2/3/18'),
		(31,'19','3','102','12/12/17','1/12/18'),
		(32,'20','4','103','1/3/18','2/3/18'),
		(33,'1','4','102','1/12/18','2/12/18'),
		(34,'3','4','107','1/3/18','2/3/18'),
		(35,'18','4','107','1/3/18','2/3/18'),
		(36,'12','4','102','1/4/18','2/4/18'),
		(37,'11','4','103','1/15/18','2/15/18'),
		(38,'9','4','103','1/15/18','2/15/18'),
		(39,'7','4','107','1/1/18','2/2/18'),
		(40,'4','4','103','1/1/18','2/2/18'),
		(41,'1','4','103','2/2/17','3/2/18'),
		(42,'20','4','103','1/3/18','2/3/18'),
		(43,'1','4','102','1/12/18','2/12/18'),
		(44,'3','4','107','1/13/18','2/13/18'),
		(45,'18','4','107','1/13/18','2/13/18'),
		(46,'12','4','102','1/14/18','2/14/18'),
		(47,'11','4','103','1/15/18','2/15/18'),
		(48,'9','4','103','1/15/18','2/15/18'),
		(49,'7','4','107','1/19/18','2/19/18'),
		(50,'4','4','103','1/19/18','2/19/18'),
		(51,'1','4','103','1/22/18','2/22/18')

select * from tbl_book_loans




/********************************Questions********************************/

/*Q1.	Find the titles of all books published by "Bloomsbury"*/

select * 
from tbl_book
where book_PublisherName = 'Bloomsbury'

/*Q2.	List the names of borrowers whose phone numbers start with the area code "212"*/

select borrower_BorrowerName 
from tbl_borrower
where borrower_BorrowerPhone like '212%'

/*Q3.	Retrieve the titles of books with more than 10 copies available.*/

select book_Title, book_copies_No_Of_Copies
from tbl_book
join tbl_book_copies
on book_BookID = book_copies_BookID
where book_copies_No_Of_Copies > 10

/*Q4.	Display the names of borrowers who have borrowed books from the "Central" branch.*/

select distinct borrower_BorrowerName
from tbl_borrower
join tbl_book_loans
on borrower_CardNo = book_loans_CardNo
join tbl_library_branch
on book_loans_BranchID = library_branch_BranchID
where library_branch_BranchName = 'Central'

/*Q5.	List the titles of books borrowed by borrower "Joe Smith."*/

select book_Title 
from tbl_book
join tbl_book_loans
on book_BookID = book_loans_BookID
join tbl_borrower
on book_loans_CardNo = borrower_CardNo
where borrower_BorrowerName = 'Joe Smith'

/*Q6.	Find the names of publishers for the books authored by "J.K. Rowling."*/

select book_PublisherName
from tbl_book
join tbl_book_authors
on book_BookID = book_authors_BookID
where book_authors_AuthorName = 'J.K. Rowling'

/*Q7.	Count the total number of books available in the library.*/

select count(*) as Total_No_Of_Books from tbl_book

/*Q8.	Calculate the average number of copies available per book across all branches.*/

select book_Title, avg(book_copies_No_Of_Copies) as Avg_Copies_per_Book 
from tbl_book_copies
join tbl_book
on book_copies_BookID = book_BookID
group by book_Title

/*Q9.	Find the branch with the highest number of books loaned out.*/

select top 1 library_branch_BranchName, count(book_loans_BookID) as No_Of_Books_Loaned
from tbl_book_loans
join tbl_library_branch
on book_loans_BranchID = library_branch_BranchID
group by library_branch_BranchName
order by No_Of_Books_Loaned desc


/*Q10.	Insert a new book titled "The Catcher in the Rye" by "J.D. Salinger" into the database.*/

insert into tbl_book (book_BookID, book_Title)
values (21, 'The Catcher in the Rye')

insert into tbl_book_authors 
values (21, 21, 'J.D. Salinger')

/* Checking the tables after insertion*/

SELECT * 
FROM tbl_book
WHERE book_BookID = 21;

Select * 
from tbl_book_authors
where book_authors_BookID = 21;



/*11.	Update the address of the "Sharpstown" library branch to "45 West Side Avenue, New York, NY 10012."*/

update tbl_library_branch
set library_branch_BranchAddress = '45 West Side Avenue, New York, NY 10012'
where library_branch_BranchName = 'Sharpstown'

/*Checking the table after updation*/

select * from tbl_library_branch

/*Q12.	Remove all books published by "Pan Books" from the database.*/

/*A conflict between the DELETE operation and the REFERENCE constraint was shown by the error message that the delete command 
displayed.Cascade option is therefore added to the foreign key constraints.In SQL Server, you must first drop the current 
foreign key constraint and then recreate it with the CASCADE option in order to add the CASCADE option. A foreign key 
constraint cannot have the CASCADE option added or removed explicitly.*/

alter table tbl_book_authors
drop constraint FK2

alter table tbl_book_authors
add constraint FK2
foreign key (book_authors_BookID)
references tbl_book(book_BookID)
on delete cascade

alter table tbl_book_copies
drop constraint FK3

alter table tbl_book_copies
add constraint FK3
foreign key (book_copies_BookID)
references tbl_book(book_BookID)
on delete cascade

alter table tbl_book_loans
drop constraint FK5

alter table tbl_book_loans
add constraint FK5
foreign key (book_loans_BookID)
references tbl_book(book_BookID)
on delete cascade

delete from tbl_book 
where book_PublisherName = 'Pan Books'

/*Check the result*/

select * from tbl_book

/*Q13.	Retrieve the names of borrowers who have borrowed the same book more than once.*/

select distinct borrower_BorrowerName
from tbl_borrower
join tbl_book_loans
on borrower_CardNo = book_loans_CardNo
group by borrower_BorrowerName, book_loans_BookID
having count(book_loans_BookID) > 1


/*Q14.	Find the title of the book with the earliest due date.*/

select book_Title [Book with earliest due date]
from tbl_book_loans
join tbl_book 
on book_loans_BookID = book_BookID
where book_loans_DueDate = (select min(book_loans_DueDate) from tbl_book_loans)


/*Q15.	List the names of borrowers who have borrowed books authored by both "Stephen King" and "J.K. Rowling."*/

select distinct borrower_BorrowerName 
from tbl_borrower
join tbl_book_loans
on borrower_CardNo = book_loans_CardNo
join tbl_book
on book_loans_BookID = book_BookID
join tbl_book_authors
on book_BookID = book_authors_BookID
where book_authors_AuthorName = 'Stephen King' and book_authors_AuthorName = 'J.K. Rowling'


/*Q16.	Find the names of borrowers who have borrowed books published by "Bloomsbury.*/

select distinct borrower_BorrowerName 
from tbl_borrower
join tbl_book_loans
on borrower_CardNo = book_loans_CardNo
join tbl_book
on book_loans_BookID = book_BookID
where book_PublisherName = 'Bloomsbury'

/*Q17.	Retrieve the titles of books borrowed by borrowers located in New York.*/

select distinct book_Title [Books borrowed by borrowers in New York], borrower_BorrowerName
from tbl_book
join tbl_book_loans
on book_BookID = book_loans_BookID
join tbl_borrower
on book_loans_CardNo = borrower_CardNo
where borrower_BorrowerAddress like '%New York%'


/*Q18.	Calculate the average number of books borrowed per borrower.*/

select count(*) / (select count(distinct book_loans_CardNo) from tbl_book_loans) as AvgNo_of_books_borrowed_per_borrower
from tbl_book_loans

/*Q19.	Find the branch with the highest average number of books borrowed per borrower.*/


select top 1 book_loans_BranchID, count(*)  / (select count(distinct book_loans_CardNo) from tbl_book_loans) as avg_books_borrowed_per_borrower
from tbl_book_loans
group by book_loans_BranchID 
order by avg_books_borrowed_per_borrower desc

/*Q20.	Rank library branches based on the total number of books borrowed, without grouping*/

WITH book_counts AS (
 SELECT library_branch_BranchName, COUNT(book_loans_loansid) AS 
total_books_borrowed 
 FROM tbl_book_loans 
 JOIN tbl_library_branch ON tbl_book_loans.book_loans_BranchID = 
tbl_library_branch.library_branch_BranchID 
 GROUP BY library_branch_BranchName
)
SELECT library_branch_BranchName, 
 ROW_NUMBER() OVER (ORDER BY total_books_borrowed DESC) AS library_ranking, 
 total_books_borrowed
FROM book_counts


/*Q21.	Calculate the percentage of books borrowed from each branch relative to the total number of books borrowed across all branches.*/

select 
	library_branch_BranchName, 
	count(book_loans_LoansID) as total_books_borrowed,
	(count(book_loans_LoansID)*100/sum(count(book_loans_LoansID)) over()) as percent_books_loanedout
from tbl_library_branch join tbl_book_loans
on library_branch_BranchID = book_loans_BranchID
group by library_branch_BranchName


/*Q22.	Find the names of borrowers who have borrowed books authored by "Stephen King" and "J.K. Rowling" from the same library branch.*/

select book_loans_BranchID, borrower_BorrowerName
from tbl_borrower
join tbl_book_loans
on borrower_CardNo = book_loans_CardNo
where book_loans_BookID in (
	select book_authors_BookID from tbl_book_authors where book_authors_AuthorName in ('Stephen King','J.K. Rowling')
)

/*Q23.	Retrieve the names of borrowers who have borrowed books from branches located in New York and have more than 5 books checked out.*/

select distinct borrower_BorrowerName, count(book_loans_BookID) as Books_ckecked_out
from tbl_borrower
join tbl_book_loans
on borrower_CardNo = book_loans_CardNo
join tbl_library_branch
on book_loans_BranchID = library_branch_BranchID
where library_branch_BranchAddress like '%New York%' 
group by borrower_BorrowerName
having count(book_loans_BookID) > 5


/*Q24.	How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?*/

select library_branch_BranchName, book_Title, book_copies_No_Of_Copies 
from tbl_book_copies
join tbl_book
on book_copies_BookID = book_BookID
join tbl_library_branch
on book_copies_BranchID = library_branch_BranchID 
where book_Title = 'The Lost Tribe' and library_branch_BranchName = 'Sharpstown'


/*Q25.	How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/

select library_branch_BranchName, book_Title, book_copies_No_Of_Copies 
from tbl_book_copies
join tbl_book
on book_copies_BookID = book_BookID
join tbl_library_branch
on book_copies_BranchID = library_branch_BranchID 
where book_Title = 'The Lost Tribe'

/*Q26.	Retrieve the names of all borrowers who do not have any books checked out.*/

select borrower_BorrowerName
from tbl_borrower
left join tbl_book_loans
on borrower_CardNo = book_loans_CardNo
where book_loans_CardNo is null

/*Q27.	For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
        retrieve the book title, the borrower's name, and the borrower's address. */

SELECT tbl_book.book_Title, tbl_borrower.borrower_BorrowerName,
       tbl_borrower.borrower_BorrowerAddress FROM tbl_book_loans
       JOIN tbl_book ON tbl_book_loans.book_loans_BookID = tbl_book.book_BookID
       JOIN tbl_borrower ON tbl_book_loans.book_loans_CardNo =
       tbl_borrower.borrower_CardNo
       JOIN tbl_library_branch ON tbl_book_loans.book_loans_BranchID =
       tbl_library_branch.library_branch_BranchID
       WHERE tbl_library_branch.library_branch_BranchName = 'Sharpstown' AND
       tbl_book_loans.book_loans_DueDate = '2/2/18';

	   
	   
/*Q28.	For each library branch, retrieve the branch name and the total number of books loaned out from that branch.*/

select library_branch_BranchName, count(book_loans_BranchID) as total_books_loanedout
from tbl_library_branch
join tbl_book_loans
on library_branch_BranchID = book_loans_BranchID
group by library_branch_BranchName

