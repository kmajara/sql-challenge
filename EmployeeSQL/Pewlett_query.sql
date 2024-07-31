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

--List the managers of each department by their department's number
--and name,their employee number,last name and first name.
SELECT dept_manager.dept_no , departments.dept_name , dept_manager.emp_no ,
	employees.last_name , employees.first_name
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--List the department's name and number,employee's number ,
--last name and first name for each employee.
SELECT  departments.dept_name , dept_emp.dept_no, dept_emp.emp_no ,
	employees.last_name , employees.first_name
FROM departments
LEFT JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no;

--List first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B.
SELECT first_name , last_name , sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number,
--last name and first name.
SELECT emp_no , last_name , first_name
FROM employees
WHERE emp_no IN
	(
    SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales'
	
	)
);

--List each employee in the Sales and Development departments, including 
--their employee number, last name, first name, and department name .
SELECT employees.emp_no , employees.last_name , employees.first_name , departments.dept_name
FROM employees
	INNER JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
		INNER JOIN departments
		ON dept_emp.dept_no = departments.dept_no
	WHERE dept_name IN ('Sales' ,  'Development');

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name) 
SELECT last_name,
	COUNT(*) AS name_count
FROM employees
GROUP BY last_name 
ORDER BY name_count DESC;