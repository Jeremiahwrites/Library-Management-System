select* from books;
select* from branch;
select* from employees;
select* from issued_status;
select* from return_status;
select* from members;


###Project task
###Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT * FROM books;

###Task 2: Update an Existing Member's Address

UPDATE members
SET member_address = '125 Main St'
WHERE member_id = 'C101';
SELECT * FROM members;

####Task 3: Delete a Record from the Issued Status Table 
###Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

SELECT * FROM issued_status
WHERE issued_id = 'IS121';

DELETE FROM issued_status
WHERE issued_id = 'IS121';


###Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'

select* from issued_status
where issued_emp_id='E101';


###Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book

select
	issued_emp_id,
    emp_name
from issued_status
join employees
on employees.emp_id=issued_status.issued_emp_id
group by 1,2
HAVING COUNT(issued_status.issued_id) > 1;

####Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

create table book_cnts
as
select
	isbn,
    book_title,
    count(issued_id) as no_issued
from books
join issued_status
on issued_book_isbn=isbn
group by 1,2;

select* from 
book_cnts;

###Task 7. Retrieve All Books in a Specific Category:

select*
from books
where category='children';

###Task 8: Find Total Rental Income by Category:

select
	category,
    sum(rental_price) as total_rental_income
from books
group by 1;

###Task 9 List Employees with Their Branch Manager's Name and their branch details:


select
	emp.*,
	manager_id,
	emp2.emp_name as manager
from employees as emp
join branch
on branch.branch_id=emp.branch_id
join employees as emp2
on branch.manager_id=emp2.emp_id;

###Task 10. Create a Table of Books with Rental Price Above a Certain Threshold 7USD:
    
    create table rental_price_greatee_than_seven
    as
    select*
    from books
    where rental_price > 7;
    
    select* from rental_price_greatee_than_seven;
    
    
    ###Task 11: Retrieve the List of Books Not Yet Returned
    
select
    issued_book_name,
    return_date
from issued_status
join return_status 
on issued_status.issued_id=return_status.issued_id
where return_id is null;

select* from return_status
    


