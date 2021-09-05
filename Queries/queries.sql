-- Retirement eligibility
SELECT first_name, last_name, emp_no
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


select departments.dept_name,
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_date
from departments
inner join dept_manager
on departments.dept_no = dept_manager.dept_no;


select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
into current_emp
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no
where de.to_date = ('9999-01-01');


-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO retirement_count
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary
from employees as e
left join salaries as s
on e.emp_no = s.emp_no;

SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');



select dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.first_name,
	e.last_name,
	dm.from_date,
	dm.to_date
from employees as e
inner join dept_manager as dm
on (e.emp_no = dm.emp_no)
inner join departments as d
on (dm.dept_no = d.dept_no)
where ((e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (dm.to_date = '9999-01-01'));
	 
select ce.emp_no,
	ce.first_name,
	ce.last_name,
	de.from_date,
	de.to_date,
	d.dept_name
into dept_info
from current_emp as ce
inner join dept_emp as de
on (ce.emp_no = de.emp_no)
inner join departments as d
on (de.dept_no = d.dept_no)
where (de.to_date = '9999-01-01');