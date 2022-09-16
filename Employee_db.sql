CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR
);

SELECT * 
FROM departments;

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR
);

SELECT * 
FROM dept_emp;

CREATE TABLE dept_managers (
	dept_no VARCHAR,
	emp_no INT
);

SELECT * 
FROM dept_managers;

CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date VARCHAR, 
	first_name VARCHAR, 
	last_name VARCHAR, 
	sex VARCHAR, 
	hire_date VARCHAR
);

SELECT * 
FROM employees;

CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

SELECT * 
FROM salaries;

CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
);

SELECT * 
FROM titles;

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
ORDER BY salary DESC;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name FROM employees AS e

INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN dept_managers AS dm
ON de.emp_no = dm.emp_no
INNER JOIN departments AS d
ON d.dept_no = dm.dept_no
;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name FROM dept_emp AS de

INNER JOIN departments AS d
ON d.dept_no = de.dept_no
INNER JOIN employees AS e
ON e.emp_no = de.emp_no
;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name FROM employees AS e

INNER JOIN dept_emp AS de
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
ORDER BY emp_no
;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name FROM employees AS e

INNER JOIN dept_emp AS de
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' or dept_name = 'Development'
ORDER BY emp_no
;

-- List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, COUNT(last_name) AS same_last_name FROM employees
GROUP BY last_name
ORDER BY same_last_name DESC
;
