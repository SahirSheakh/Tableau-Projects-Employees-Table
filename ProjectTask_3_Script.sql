SELECT 
    e.emp_no,
    e.gender,
    d.dept_name,
    YEAR(s.from_date) AS work_year,

  CAST(AVG(s.salary) AS DECIMAL(10,2)) as average_salary
FROM
    t_employees e
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
/*where
    de.from_date <= '2002-01-01'*/
   
GROUP BY s.from_date
having s.from_date <='2002-01-01'
order by e.emp_no; 



/*_______________________________________________________*/




SELECT 
    e.gender,
    d.dept_no,
    e.emp_no,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no , e.gender , calendar_year
HAVING calendar_year <= 2002
ORDER BY e.emp_no;