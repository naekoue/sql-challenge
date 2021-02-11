-- of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no,e.last_name,e.first_name,e.sex, s.salary 
FROM employees e
INNER JOIN salaries s
ON e.emp_no =s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
--https://stackoverflow.com/questions/5875712/postgresql-select-something-where-date-01-01-11
SELECT  e.last_name,e.first_name, e.hire_date 
FROM employees e 
WHERE    hire_date >= to_date('1986', 'YYYY')
AND      hire_date < to_date('1987', 'YYYY');

-- Alternative
--https://stackoverflow.com/questions/27440764/extract-year-from-date-within-where-clause
SELECT e.last_name,e.first_name, e.hire_date  
FROM employees e  WHERE EXTRACT(YEAR FROM hire_date) = '1986';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no,e.last_name,e.first_name
FROM dept_manager dm
    INNER JOIN departments d
        ON dm.dept_no=d.dept_no 
    INNER JOIN employees e
        ON dm.emp_no=e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dm.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_manager dm
    INNER JOIN departments d
        ON dm.dept_no=d.dept_no 
    INNER JOIN employees e
        ON dm.emp_no=e.emp_no;	

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name ="Hercules"
AND e.last_name LIKE 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dm.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_manager dm
    INNER JOIN departments d
        ON dm.dept_no=d.dept_no 
    INNER JOIN employees e
        ON dm.emp_no=e.emp_no
        
WHERE d.dept_name= 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dm.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_manager dm
    INNER JOIN departments d
        ON dm.dept_no=d.dept_no 
    INNER JOIN employees e
        ON dm.emp_no=e.emp_no       
WHERE d.dept_name= 'Sales'
OR d.dept_name= 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name,COUNT(e.last_name)
FROM employees
GROUP BY e.last_name
ORDER BY COUNT(e.last_name) DESC;


--BONUS


