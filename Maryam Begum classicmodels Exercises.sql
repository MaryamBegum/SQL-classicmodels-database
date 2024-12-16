/*Maryam Begum clasicmodels Exercises

use classicmodels;

/* Explore the tables and columns */

select *
from products;

/**********
  Basics Exercises
**********/

#1) Write down sql query to show different countries from customers table
SELECT DISTINCT country
FROM customers;

#2) write a query to show number of cities in customers table
SELECT COUNT(DISTINCT city) AS "Number of Cities"
FROM customers;

#3) How many of my customers are from London in customers table?
SELECT COUNT(*) AS "Number of Customers", City
FROM customers
WHERE city = 'London';

#4)How many of customers from UK but not from London?
SELECT COUNT(*) AS "Number of Customers", City, Country
FROM customers
WHERE country IN ('UK') AND city NOT IN ('London');

#5)Write SQL query to show number of Sales Rep in employees table
SELECT COUNT(*) AS "Number of Sales Reps"
FROM employees
WHERE jobtitle = 'Sales Rep';

#6) What is the address line2 for the office in San Francisco in offices table?
SELECT addressline2, City
FROM offices
WHERE city = 'San Francisco';

#7) What is the largest quantity ordered in orderdetails table?
SELECT MAX(quantityordered) AS "Largest Quantity"
FROM orderdetails;

#8) Whats the highest amount paid on '2003-09-28' in payments table?
SELECT MAX(amount) AS "Highest amount", paymentDate AS "Payment Date"
FROM payments
WHERE paymentdate = '2003-09-28';

#9) Which products are avaliable more than 5000 in stock and also has buyprice lower than 25?
SELECT *
FROM products
WHERE quantityInStock > 5000 AND buyprice < 25;

#10) select customers who do not have a credit limit (0.00). 
SELECT *
FROM customers
WHERE creditlimit = 0.00;

#11)  Ask your own question and write a query to answer. Share and discuss with your friends.
-- Find out how many customers are from Germany
SELECT COUNT(*) AS "Number of Customers"
FROM customers
WHERE country = 'Germany';

#12) Ask your own question and write a query to answer. Share and discuss with your friends.
-- Find the customer with the highest credit limit
SELECT CustomerName,contactFirstName, contactLastName,creditLimit
FROM customers
ORDER BY creditlimit DESC
LIMIT 1;

#13) Ask your own question and write a query to answer. Share and discuss with your friends.
-- Find the average amount in payments table
SELECT AVG(amount) AS "average amount"
FROM payments;

/********** 
Joins and group by Exercises 
**********/

/* 1- Find office information of each employee with their first, lastname, addressLine1, state and their city */
SELECT e.officecode, e.firstname, e.lastname, o.addressline1, o.state, o.city
FROM employees as e
JOIN offices as o 
ON e.officecode = o.officecode;

/* 2- How many orders have been placed by Herkku Gifts? */
SELECT C.CustomerName, COUNT(*) AS 'Number of Orders'
FROM orders as o
JOIN customers as c
ON o.customerNumber = c.customerNumber
WHERE c.customerName = 'Herkku Gifts';

/* 3- Write sql query to find total payments for Atelier graphique */
SELECT CustomerName, SUM(p.amount) AS "Total Payments"
FROM payments as p
JOIN customers as c 
ON p.customerNumber = c.customerNumber
WHERE c.customerName = 'Atelier graphique';

/* 4- Write sql query find the total payments by date */
SELECT PaymentDate, SUM(amount) AS "Total Payments"
FROM payments
GROUP BY paymentdate
ORDER BY paymentdate;

/* 5- Write a query to find the amount paid by each customer. */
SELECT c.CustomerNumber, c.CustomerName, SUM(p.amount) AS "Total Paid"
FROM customers as c
JOIN payments as p 
ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber, c.CustomerName;

/* 6- Write sql to find top 10 customers the highest total amount paid */
SELECT c.CustomerNumber, c.CustomerName, SUM(p.amount) AS "Total Paid"
FROM customers as c
JOIN payments as p 
ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber, c.CustomerName
ORDER BY "Total Paid" DESC
LIMIT 10;

/* 7- Write a query to find the account representative for each customer.*/
SELECT CustomerName, JobTitle, concat(FirstName,' ',LastName) as EmployeeName
FROM Customers
CROSS JOIN Employees
WHERE jobtitle = 'Sales Rep'
ORDER BY CustomerName;

/* 8- Write sql query to find the employees who live in Boston */
SELECT concat(FirstName,' ',LastName) as "Employee Name", o.City
FROM employees as e
JOIN offices as o 
ON e.officecode = o.officecode
WHERE city = 'Boston';


-- /*My own queries
-- Task: Write a SQL query to find all products that have a stock quantity of less than 50. 
-- Return the product ID, product name, and stock quantity.
SELECT productCode, productName, QuantityInStock
FROM products
WHERE QuantityInStock < 50;

-- Which customers have never placed an order? 
SELECT customerName, customerNumber 
FROM customers 
WHERE customerNumber 
NOT IN (SELECT customerNumber FROM orders);


