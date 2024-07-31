------------Creating the 'departments' table-----------------

CREATE TABLE "departments" (
    "dept_no" VARCHAR(10) NOT NULL,
    "dept_name" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);


------------Creating the 'titles' table-----------------

CREATE TABLE "titles" (
    "title_id" VARCHAR(10) NOT NULL,
    "title" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")
);


------------Creating the 'employees' table-----------------

CREATE TABLE "employees" (
    "emp_no" INT NOT NULL,
    "emp_title_id" VARCHAR(10) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "sex" VARCHAR(1) NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_employees_titles" FOREIGN KEY ("emp_title_id") REFERENCES "titles" ("title_id")
);


------------Creating the 'dept_emp' table-----------------

CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(10) NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no", "dept_no"),
    CONSTRAINT "fk_dept_emp_employees" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
    CONSTRAINT "fk_dept_emp_departments" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
);


------------Creating the 'dept_manager' table---------

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(10) NOT NULL,
    "emp_no" INT NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("emp_no", "dept_no"),
    CONSTRAINT "fk_dept_manager_employees" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
    CONSTRAINT "fk_dept_manager_departments" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
);

------------Creating the 'salaries' table------------

CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL,
    "salary" MONEY NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_salaries_employees" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

