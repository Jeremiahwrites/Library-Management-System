###joining table issued_status with table members where member_id in members table is the same with issued_memeber_id in the issued status table

use sakila;
select
    issued_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id, member_name, member_address, reg_date
from issued_status
	join members
    on members.member_id=issued_status.issued_member_id;
    
####joining table books with table issued_status where book_isbn in books table is equal to isbn in issued_status table

select
    issued_id, issued_member_id, issued_book_name, issued_date, issued_emp_id, book_title, category, rental_price, author, publisher
from issued_status
	join books
    on issued_status.issued_book_isbn=books.isbn;

###joining table employees with table issued_status where emp_id in employees table is equal to issued_emp_id in issued_status table
select
   issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, emp_name, position, salary, branch_id
from issued_status
	join employees
    on employees.emp_id=issued_status.issued_emp_id;

###joining table branch with table employees where branch_id in the employees table is equal to branch_id in the branch table

select
    emp_id, emp_name, position, salary, manager_id, branch_address, contact_no
from employees
	join branch
    on employees.branch_id=branch.branch_id;

###joining table issued_status with table return_status where issued_id in issued_status table is equal to issued_id in the return_status table

select
    issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id, return_id, return_date
from issued_status
	join return_status
    on return_status.issued_id=issued_status.issued_id;



