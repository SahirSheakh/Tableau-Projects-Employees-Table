
#Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990.

use employees_mod;

select * from t_departments;


SELECT 
    YEAR(dm.from_date) AS starting_year,
    e.gender,
    COUNT(dm.emp_no) as number_of_employees,
    d.dept_name
FROM
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN
    t_employees e ON dm.emp_no = dm.emp_no
WHERE
    dm.from_date >= '1990-01-01'
GROUP BY e.gender , dm.from_date, d.dept_name
order by from_date, d.dept_name;



SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN 
    t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;


