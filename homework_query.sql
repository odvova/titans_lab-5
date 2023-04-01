use mydb;
## 1
select * from employees;
## 2
SELECT * FROM mydb.employees WHERE first_name = 'David';
## 3
SELECT * FROM employees
WHERE department_id IN (2, 3);
## 4
SELECT * FROM Employees
WHERE department_id IN (1, 2, 3) AND comimission_pct IS NOT NULL;
## 5
SELECT * FROM Employees
WHERE DATE_FORMAT(hire_date, '%d') = '01';
## 6
SELECT * FROM employees
WHERE hire_date BETWEEN '2008-01-01' AND '2008-12-31';
## 7
SELECT CONCAT('Tomorrow is ', DATE_FORMAT(DATE_ADD(NOW(), INTERVAL 1 DAY), '%D day of %M')) AS tomorrow_date FROM DUAL;
## 8
SELECT CONCAT(DATE_FORMAT(hire_date, '%D of %M, %Y')) AS hire_date_formatted, first_name, last_name
FROM employees;
## 9
SELECT CONCAT(first_name, ' ', last_name) AS employee_name, CONCAT('$', ROUND(salary * 1.2, 2)) AS salary
FROM employees;
## 10
SELECT * FROM Employees
WHERE MONTH(hire_date) = 2 AND YEAR(hire_date) = 2022;
## 10
SELECT NOW() AS current_datetime,
       SECOND(NOW()) AS current_second,
       MINUTE(NOW()) AS current_minute,
       HOUR(NOW()) AS current_hour,
       DAY(NOW()) AS current_day,
       MONTH(NOW()) AS current_month,
       YEAR(NOW()) AS current_year
FROM DUAL;
## 11
SELECT CONCAT('$ ', FORMAT((salary + IFNULL((salary * comimission_pct), 0)), 2)) AS 'total_salary'
FROM employees;
## 12
SELECT first_name, last_name, 
    CASE WHEN comimission_pct IS NOT NULL THEN 'Yes' ELSE 'No' END AS has_bonus
FROM employees;









