#Question 1
#This query finds the first and last names of the employee whose initials are 'AJ'
SELECT fname, lname, 'Kristin Pflug' FROM employee WHERE fname LIKE 'A%' AND lname LIKE 'J%';

#Question 2
#This query lists the first name, last name, and salary of all employees who work in the Hardware department
SELECT fname, lname, salary, 'Kristin Pflug' FROM employee
WHERE dno = (SELECT dnumber FROM department WHERE dname = 'Hardware');

#Question 3
#This query lists the first name, last name, and salary of all employees who work on the project ProductX
SELECT fname, lname, salary, 'Kristin Pflug' FROM employee
WHERE ssn IN (SELECT essn FROM works_on WHERE pno = (SELECT pnumber FROM project WHERE pname = 'ProductX'));

#Question 4
#This query calculates the total amount of money that the company pays as 401k to all its employees 
# (listed in the results as total401k)
#NOTE: the company pays 5% of an employee's salary as the 401k benefit
SELECT SUM(401kAmount) AS total401k, 'Kristin Pflug' 
FROM (SELECT .05*salary AS 401kAmount FROM employee) AS 401kAmounts;

#Question 5
#This query lists the total hours that employees work on the project ProductX 
# (listed in the results as ProductX_total_hours)
SELECT SUM(hours) AS ProductX_total_hours, 'Kristin Pflug' FROM works_on 
WHERE pno = (SELECT pnumber FROM project WHERE pname = 'ProductX');

#Question 6
#This query lists the first name, last name, department name, and salary of the female employee with the highest salary
SELECT fname, lname, dname, salary, 'Kristin Pflug' FROM employee, department
WHERE employee.dno = department.dnumber AND salary = (SELECT MAX(salary) FROM employee WHERE sex = 'F');