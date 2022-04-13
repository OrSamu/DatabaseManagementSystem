-- Or, Samuican, 315872424

--question 1: Find all customers that has ID thats bigger than all the ID's from customers in Taxes
SELECT *
FROM customer 
WHERE state != 'TX'
AND id > (SELECT MAX(id)
FROM customer 
WHERE state == 'TX');