drop table departments
drop table dept_emp
drop table dept_manager
drop table employees
drop table salaries
drop table titles

CREATE TABLE "departments" (
    "dept_no" varchar(30)   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   ,
    "dept_no" varchar  ,
    "from_date" varchar   ,
    "to_date" varchar   
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar ,
    "emp_no" int ,
    "from_date" varchar ,
    "to_date" varchar  
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" varchar   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "gender" varchar(30)   NOT NULL,
    "hire_date" varchar   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int  ,
    "salary" int  ,
    "from_date" varchar ,
    "to_date" varchar 
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" varchar(30)   NOT NULL,
    "from_date" varchar   NOT NULL,
    "to_date" varchar   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


select employees.emp_no,first_name,last_name,gender,salaries.salary
from employees
join salaries on employees.emp_no=salaries.emp_no


select *
from employees
where hire_date like '1986%'


select first_name,last_name, dept_manager.emp_no,dept_manager.dept_no,departments.dept_name,dept_emp.from_date,dept_emp.to_date
from employees
join dept_manager on dept_manager.emp_no=employees.emp_no
join departments on departments.dept_no=dept_manager.dept_no
join dept_emp on dept_emp.emp_no = dept_manager.emp_no

select first_name,last_name,employees.emp_no,departments.dept_name
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
join departments on departments.dept_no = dept_emp.dept_no

select first_name,last_name
from employees
where first_name = 'Hercules'
and last_name like 'B%'

select first_name,last_name,employees.emp_no,departments.dept_name
from employees
join dept_emp on dept_emp.emp_no=employees.emp_no
join departments on dept_emp.dept_no= departments.dept_no
where dept_name = 'Sales'

select first_name,last_name,employees.emp_no,departments.dept_name
from employees
join dept_emp on dept_emp.emp_no=employees.emp_no
join departments on dept_emp.dept_no= departments.dept_no
where dept_name = 'Sales' 
or dept_name= 'Development'

select last_name,count(last_name) as "frequency"
from employees
group by last_name
order by "frequency" desc

select *
from departments

select *
from dept_emp

select *
from employees

select *
from dept_manager
