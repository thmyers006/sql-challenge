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





		


	
