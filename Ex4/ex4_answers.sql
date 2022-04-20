-- Or, Samuican, 315872424

--question 1: Find all customers that has ID thats bigger than all the ID's from customers in Taxes
SELECT *
FROM customer 
WHERE state != 'TX'
AND id > (SELECT MAX(id)
FROM customer 
WHERE state == 'TX');

--quastion 2: Find all customers that has the char 'x' in their address
SELECT *
FROM customer
WHERE address LIKE '%x%';

--quastion 3: Find all customers (id, fname, lname) that all of their orders are from 1994
// all the clients minus clients with orders from 1993
SELECT C.id, C.fname, C.lname, S.id, S.order_date
FROM customer C, saLes_order S
WHERE C.id = S.cust_id;
EXCEPT
SELECT C.id, C.fname, C.lname, S.id, S.order_date
FROM customer C, saLes_order S
WHERE C.id = S.cust_id
AND S.order_date < '1994-01-01'
GROUP BY C.id;

--quastion 4: Find all product name and description the bought by customers whom their first name begins with O
SELECT P.name, P.description
FROM customer C, sales_order S, sales_order_items I, product P
WHERE C.id = S.cust_id
AND I.id = S.id
AND P.id = I.prod_id
AND C.fname Like 'O%'
GROUP BY P.description
ORDER BY P.description;

--quastion 5: Find all the customers (id, fname, lname) that dont have a sale order
SELECT C.id, C.fname, C.lname
FROM customer C
WHERE C.id NOT IN (SELECT S.cust_id
FROM sales_order S
GROUP BY S.cust_id);

--quastion 6: Find all customers (id, fname, lname) who has orders but didnt order shirts
SELECT C.id, C.fname, C.lname
FROM customer C, sales_order S, sales_order_items I, product P
WHERE C.id = S.cust_id
AND I.id = S.id
AND P.id = I.prod_id
AND C.id NOT IN (
SELECT C.id
FROM customer C, sales_order S, sales_order_items I, product P
WHERE C.id = S.cust_id
AND I.id = S.id
AND P.id = I.prod_id
AND P.name LIKE '%Shirt%')
GROUP BY C.id;

--quastion 7: Find all the customers (id, fname, lname) that worker 299 took care in all of their orders
SELECT C.id, C.fname, C.lname
FROM customer C
WHERE C.id NOT IN (SELECT C.id
FROM customer C, sales_order S
WHERE C.id = S.cust_id
AND sales_rep != 299);

--quastion 8: For each dept. print the id, name, num of employee, and avg salary.
SELECT E.dept_id, D.dept_name, count(E.emp_id), avg(E.salary)
FROM department D, employee E
WHERE E.dept_id = D.dept_id
GROUP BY E.dept_id;

--quastion 9: For each employee (id and name) find the number of sales_order he took care of
SELECT S.sales_rep, E.emp_fname, E.emp_lname, count(S.sales_rep)
FROM sales_order S, employee E
WHERE S.sales_rep = E.emp_id
GROUP BY S.sales_rep;

--quastion 10: What is the date of the latest order?
SELECT MAX(order_date)
FROM sales_order;

--quastion 11: Which state has the most customers



































































