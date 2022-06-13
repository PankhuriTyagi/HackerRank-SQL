SELECT total_salary, emp_cnt
FROM
(SELECT total_salary, COUNT(employee_id) as emp_cnt
FROM
(SELECT employee_id, months*salary AS total_salary
FROM Employee) AS a
GROUP BY total_salary) AS b
ORDER BY total_salary DESC LIMIT 1;