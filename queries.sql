DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles cascade;

-- code to create departments table in SQL
CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

-- code to create dept_emp table in SQL
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR
);

-- code to create dept_manager table in SQL
CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- code to create titles table in SQL
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR 
);

-- code to create employees table in SQL
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

-- code to create salaries table in SQL
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT
);

--need to create .sql file of all of my tables with imported data ???




--code to list employee details such as employee number, first & last name, six and salary pulled from two tables
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
	FROM employees
	JOIN salaries
	ON salaries.emp_no = employees.emp_no
	LIMIT 100;
	
--code to list first and last names of employees hired in 1986 with respective hire dates	
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE (e.hire_date <= '1986-12-31') AND (e.hire_date >= '1986-01-01');


--code to list manager of each dept with manager details, department name and department number
SELECT m.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employees AS e
	JOIN dept_manager AS m
	ON e.emp_no = m.emp_no
		JOIN departments AS d
		ON d.dept_no = m.dept_no
		WHERE emp_title = 'm0001';

--code to list department name of each employee with employee details
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp as p
	ON e.emp_no = p.emp_no
		JOIN departments as d
		ON d.dept_no = p.dept_no;
		
--code to list employees with first name 'Hercules' and last name beginning with 'B'
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

--code to list all employees in the sales department with employee details
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp as p
	ON e.emp_no = p.emp_no
		JOIN departments as d
		ON d.dept_no = p.dept_no
		WHERE dept_name = 'Sales';
		
--code to list all employees in Sales and Develemtne departments with employee details
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp as p
	ON e.emp_no = p.emp_no
		JOIN departments as d
		ON d.dept_no = p.dept_no
		WHERE dept_name = 'Sales' or dept_name = 'Development'
		LIMIT 200;
		
		
--code to find frequency count of employee last names
SELECT e.last_name, COUNT(last_name) AS "NameCount"
FROM employees AS e
GROUP BY e.last_name
ORDER BY "NameCount" DESC;

		


	
