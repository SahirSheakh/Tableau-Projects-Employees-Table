
/*CREATE A VISUALIZATION THAT PROVIDES A BREAKDOWN BETWEEN THE MALE AND FEMALE EMPLOYEES WORKING IN THE COMPANY EACH YEAR, STARTING FROM 1990.*/

use employees_mod;
SELECT 
    *
FROM
    t_dept_emp;
    
    SELECT 
    *
FROM
    t_employees;
    
SELECT distinct
 year(e.hire_date) as Year_Started_From,
    COUNT(e.emp_no) AS Number_Of_Emloyees,
    e.gender AS Gender
   
FROM
    t_employees e

 
GROUP BY Year_Started_From, e.gender
having Year_Started_From>=1990
order by hire_date;
 
 SELECT 

    YEAR(d.from_date) AS calendar_year,
    e.gender,    
    COUNT(e.emp_no) AS num_of_employees

FROM     
     t_employees e         
          JOIN    
     t_dept_emp d ON d.emp_no = e.emp_no

GROUP BY calendar_year , e.gender 

HAVING calendar_year >= 1990
order by from_date;