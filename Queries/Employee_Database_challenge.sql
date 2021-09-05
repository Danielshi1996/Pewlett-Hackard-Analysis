-- Deliverable 1
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
JOIN title as t 
ON(e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no asc;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO clean_retirement_title
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

select count(*), title
into retiring_titles
from clean_retirement_title
group by title
order by count desc;

-- Deliverable 2
SELECT DISTINCT ON (emp_no)
    e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    tt.title
INTO mentorship_eligibility
From employees as e 
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN title as tt
ON e.emp_no = tt.emp_no
where (e.birth_date between '1965-1-1' and '1965-12-31') and (de.to_date = '9999-1-1')
ORDER BY emp_no,to_date DESC;