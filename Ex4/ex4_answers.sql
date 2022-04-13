-- israel, israeli, 1234569

--question a
select emp_id, emp_fname, emp_lname, count(*) 
from sales_order S, employee E 
where S.sales_rep = E.emp_id
group by emp_id;

-- question b
select * 
from product
where name like '%Shirt%';

--- question c
select count(*), count(distinct name) 
from product
where name like '%Shirt%';

--- question d
select emp_id, emp_fname, emp_lname
from employee, department
where dept_head_id == emp_id;