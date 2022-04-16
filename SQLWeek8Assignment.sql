-- 1. I want to know how many employees with each title were born after 1965-01-01

SELECT count(e.birth_date), title FROM titles t
	INNER JOIN employees e ON e.emp_no = t.emp_no
	WHERE e.birth_date > '1965-01-01'
	GROUP BY t.title;

-- another way
SELECT COUNT(e.birth_date), t.title FROM employees e 
	INNER JOIN titles t ON t.emp_no = e.emp_no 
	WHERE e.birth_date > "1965-01-01"
	GROUP BY t.title;


/*2. I want to know the average salary per title*/

SELECT AVG(s.salary), t.title FROM salaries s 
	INNER JOIN titles t ON s.emp_no = t.emp_no 
	GROUP BY t.title;

	
/*3. How much money was spent on salary for the marketing department between 
 * the years 1990 and 1992*/

SELECT d.dept_name, SUM(s.salary) FROM departments d  
	INNER JOIN dept_emp de ON d.dept_no = de.dept_no 
	INNER JOIN employees e ON e.emp_no = de.emp_no 
	INNER JOIN salaries s ON e.emp_no = s.emp_no 
	WHERE d.dept_name = 'Marketing' AND s.to_date 
	BETWEEN '1990-01-01' AND '1992-12-31'
	GROUP BY d.dept_name;