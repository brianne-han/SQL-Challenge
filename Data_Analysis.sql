-- Data Analysis

-- 1. List the employee number, last name, first name, sex, and salary of each employee
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	s.salary
FROM "Employees" e
	INNER JOIN "Salary" s ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT
	e.first_name, 
	e.last_name,
	e.hire_date
FROM "Employees" e
WHERE e.hire_date >= '1/1/1986' and e.hire_date <= '12/31/1986'

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT
	d.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM "Departments" d
	INNER JOIN "Dept_manager" dm ON d.dept_no = dm.dept_no
	INNER JOIN "Employees" e ON e.emp_no = dm.emp_no;
	
-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
SELECT 
	de.dept_no,
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM "Employees" e
	LEFT JOIN "Dept_emp" de ON de.emp_no = e.emp_no
	INNER JOIN "Departments" d ON d.dept_no = de.dept_no;
	
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM "Employees" e
WHERE e.first_name = 'Hercules' and e.last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM "Employees" e
	INNER JOIN "Dept_emp" de ON de.emp_no = e.emp_no
	INNER JOIN "Departments" d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM "Employees" e
	INNER JOIN "Dept_emp" de ON de.emp_no = e.emp_no
	INNER JOIN "Departments" d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT
	e.last_name,
	COUNT(e.last_name)
FROM "Employees" e
GROUP BY e.last_name
ORDER BY count(e.last_name) desc;
