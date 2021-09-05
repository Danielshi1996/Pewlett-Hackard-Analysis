Create table departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

select * from departments;

CREATE TABLE employees (     
	emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
);

select * from employees;

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

select * from dept_manager;

drop table dept_emp;

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no varchar(4) NOT NULL,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (dept_no, emp_no)
);

select * from dept_emp;

CREATE TABLE salaries (
	emp_no INT,
	salary int,
	from_date DATE,
	to_date DATE,
	foreign key (emp_no) references employees(emp_no),
	primary key (emp_no)
);

select * from salaries;

create table title (
	emp_no int,
	title varchar,
	from_date date,
	to_date date,
	foreign key (emp_no) references employees(emp_no),
	primary key (emp_no, from_date)
);