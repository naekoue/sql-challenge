-- Drop table if exists
--DROP TABLE departments;
CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    PRIMARY KEY ( dept_no)
    );

--Import the csv fles contents into the table and view rows
SELECT * FROM departments;

-- Drop table if exists
--DROP TABLE dept_emp;
CREATE TABLE dept_emp(
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    PRIMARY KEY (emp_no,dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
    );
    
--Import the csv fles contents into the table and view rows
SELECT * FROM dept_emp;

-- Drop table if exists
--DROP TABLE dept_manager;
CREATE TABLE dept_manager(
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no,emp_no),
    FOREIGN KEY(emp_no ) REFERENCES employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
    );    

SELECT * FROM dept_manager;
 
-- Drop table if exists
--DROP TABLE salaries;  
CREATE TABLE salaries(   
    emp_no INT,
    salary INT,
    PRIMARY KEY (emp_no),
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no) 
);

SELECT * FROM salaries;
-- Drop table if exists
--DROP TABLE titles;

CREATE TABLE titles( 
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    PRIMARY KEY (title_id)
);
SELECT * FROM titles;

-- Drop table if exists
--DROP TABLE employees;

CREATE TABLE employees(
    emp_no INT NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
    );
SELECT * FROM employees;


    