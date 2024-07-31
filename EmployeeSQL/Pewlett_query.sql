---------------------SQL-QUERY------------------

--List each employee's number,last name, first name,
--sex and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List the first name,last name and hire date for
--employees hired in 1986.
SELECT  first_name, last_name , hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

