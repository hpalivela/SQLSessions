-- create database sqlsession;
use sqlsession;
-- Data definition language
-- creating table
-- CREATE TABLE employees (
--     id INT PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     salary DECIMAL(10, 2)
-- );
-- altering table
-- ALTER TABLE employees
-- ADD COLUMN email VARCHAR(100);
-- dropping
-- DROP TABLE IF EXISTS temp_table;
-- truncating
-- TRUNCATE TABLE employees;

-- data manipulation language
-- inserting
-- INSERT INTO employees (id, first_name, last_name, salary)
-- VALUES (1, 'John', 'Doe', 50000);
-- updating
-- UPDATE employees
-- SET salary = salary * 1.1
-- WHERE id = 1;
-- deleting
-- DELETE FROM employees
-- WHERE id = 1;
-- select * from employees;

-- constraints
-- not null
-- ALTER TABLE employees
-- MODIFY COLUMN first_name VARCHAR(50) NOT NULL;
-- uniquee
-- CREATE UNIQUE INDEX unique_email ON employees (email);
-- default
-- ALTER TABLE employees
-- MODIFY COLUMN salary DECIMAL(10, 2) DEFAULT 30000;

-- dataquerylanguage
-- select
-- select * from employees;
-- where,and,or,not
-- INSERT INTO employees (id, first_name, last_name, salary)
-- VALUES (1, 'John', 'Doe', 20000),
-- (2, 'kiwi', 'Doe', 70000);
-- SELECT * FROM employees
-- WHERE salary > 40000 AND (id=1 or id=2);
-- orderby,limit
-- SELECT * FROM employees
-- ORDER BY salary ASC || DESC
-- LIMIT 5;
-- in, between
-- SELECT * FROM employees
-- WHERE id IN (1, 2)
-- AND salary BETWEEN 30000 AND 80000;
-- distinct,alias
-- SELECT DISTINCT id AS dept_id
-- FROM employees;
-- having
-- SELECT id, COUNT(*) AS employee_count
-- FROM employees
-- GROUP BY id
-- HAVING employee_count > 0;
-- like wildcards
-- SELECT * FROM employees
-- WHERE first_name LIKE 'J%';

-- joins
-- CREATE TABLE Departments (
--     DepartmentID INT,
--     DepartmentName VARCHAR(50)
-- );
-- INSERT INTO Departments (DepartmentID, DepartmentName)
-- VALUES
-- (101, 'Human Resources'),
-- (102, 'Finance'),
-- (103, 'IT'),
-- (104, 'Marketing');
-- CREATE TABLE Employees1 (
--     EmployeeID INT,
--     EmployeeName VARCHAR(50),
--     DepartmentID INT
-- );
-- INSERT INTO Employees1 (EmployeeID, EmployeeName, DepartmentID)
-- VALUES
-- (1, 'Alice', 101),
-- (2, 'Bob', 102),
-- (3, 'Charlie', 101),
-- (4, 'David', 103),
-- (5, 'Eve', 105);

-- inner join
-- SELECT 
--     Employees1.EmployeeName, 
--     Departments.DepartmentName
-- FROM 
--     Employees1
-- INNER JOIN 
--     Departments 
-- ON 
--     Employees1.DepartmentID = Departments.DepartmentID;

-- leftjoin
-- SELECT 
--     Employees1.EmployeeName, 
--     Departments.DepartmentName
-- FROM 
--     Employees1
-- LEFT JOIN 
--     Departments 
-- ON 
--     Employees1.DepartmentID = Departments.DepartmentID;

-- -rightjoin
-- SELECT 
--     Employees1.EmployeeName, 
--     Departments.DepartmentName
-- FROM 
--     Employees1
-- RIGHT JOIN 
--     Departments 
-- ON 
--     Employees1.DepartmentID = Departments.DepartmentID;

-- fullouter join
-- select * from Employees1;
-- SELECT 
--     Employees1.EmployeeName, 
--     Departments.DepartmentName
-- FROM 
--     Employees1
-- full join
--     Departments 
-- ON 
--     Employees1.DepartmentID = Departments.DepartmentID;

-- cross join
-- SELECT 
--     Employees1.EmployeeName, 
--     Departments.DepartmentName
-- FROM 
--     Employees1
-- CROSS JOIN 
--     Departments;

-- union and unionall
-- CREATE TABLE TableA (
--     ID INT,
--     Name VARCHAR(50)
-- );
-- INSERT INTO TableA (ID, Name)
-- VALUES
-- (1, 'Alice'),
-- (2, 'Bob'),
-- (3, 'Charlie');
-- CREATE TABLE TableB (
--     ID INT,
--     Name VARCHAR(50)
-- );

-- INSERT INTO TableB (ID, Name)
-- VALUES
-- (3, 'Charlie'),
-- (4, 'David'),
-- (5, 'Eve');

-- UNION combines the results of two SELECT queries, removing duplicates.

-- SELECT ID, Name FROM TableA
-- UNION
-- SELECT ID, Name FROM TableB;

-- UNION ALL combines the results of two SELECT queries but retains duplicates.
-- SELECT ID, Name FROM TableA
-- UNION ALL
-- SELECT ID, Name FROM TableB;

-- aggregrate functions
-- CREATE TABLE Orders (
--     OrderID INT,
--     CustomerName VARCHAR(50),
--     OrderDate DATE,
--     OrderAmount DECIMAL(10, 2),
--     ProductCategory VARCHAR(20)
-- );

-- INSERT INTO Orders (OrderID, CustomerName, OrderDate, OrderAmount, ProductCategory)
-- VALUES
-- (1, 'Alice', '2024-01-01', 150.00, 'Electronics'),
-- (2, 'Bob', '2024-01-02', 250.00, 'Electronics'),
-- (3, 'Charlie', '2024-01-03', 300.00, 'Furniture'),
-- (4, 'David', '2024-01-04', 100.00, 'Furniture'),
-- (5, 'Eve', '2024-01-05', 400.00, 'Clothing');

-- SELECT MIN(OrderAmount) AS MinOrderAmount FROM Orders;
-- SELECT MAX(OrderAmount) AS MaxOrderAmount FROM Orders;

-- SELECT COUNT(*) AS TotalOrders FROM Orders;
-- SELECT COUNT(DISTINCT CustomerName) AS UniqueCustomers FROM Orders;

-- SELECT SUM(OrderAmount) AS TotalOrderAmount FROM Orders;

-- SELECT AVG(OrderAmount) AS AvgOrderAmount FROM Orders;

-- SELECT 
--     ProductCategory, 
--     SUM(OrderAmount) AS TotalOrderAmount
-- FROM 
--     Orders
-- GROUP BY 
--     ProductCategory;

-- transcation control language

-- begin,commit,savepoint,rollback
-- create table student (id int,name varchar(50),age int);
-- begin;
-- insert student values(1,'pavan',24);
-- insert student values(2,'venkat',25);
-- savepoint A;
-- insert student values(3,'venky',28);

-- select * from student;
-- drop table student;
-- select* from student;
-- no such tables exits---
-- then we use rollback
-- rollback to A;
-- select * from student;

-- if we do commit after savepoint,we cant roll back

-- insert,create using select
-- CREATE TABLE Customers (
--     CustomerID INT,
--     CustomerName VARCHAR(50),
--     LastOrderDate DATE
-- );
-- INSERT INTO Customers (CustomerID, CustomerName, LastOrderDate)
-- VALUES
-- (1, 'Alice', '2023-12-01'),
-- (2, 'Bob', '2022-11-15'),
-- (3, 'Charlie', '2022-05-30'),
-- (4, 'David', '2021-03-25'),
-- (5, 'Eve', '2023-07-10');

-- CREATE TABLE ArchivedCustomers (
--     CustomerID INT,
--     CustomerName VARCHAR(50),
--     LastOrderDate DATE
-- );

-- INSERT INTO ArchivedCustomers (CustomerID, CustomerName, LastOrderDate)
-- SELECT
--     CustomerID,
--     CustomerName,
--     LastOrderDate
-- FROM
--     Customers
-- WHERE
--   CustomerID=5;

-- select * from ArchivedCustomers;










