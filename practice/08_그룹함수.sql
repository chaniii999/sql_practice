
-- �׷��Լ� AVG, MAX, MIN, SUM, COUNT
-- GROUR BY�� ���� GROUP���� �ش������ʴ� �÷� ��ȸ �Ұ���.
SELECT
    AVG(salary),
    department_id
FROM employees
GROUP BY department_id;


-- �׷����� �� HAVING���� �ۼ�
SELECT
    AVG(salary),
    SUM(salary),
    department_id
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;

SELECT
    job_id,
    Count(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5;


SELECT
    department_id,
    AVG(salary) AS ��ձ޿�
FROM employees
WHERE department_id > 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY ��ձ޿� DESC;




SELECT
    job_id,
    COUNT(*) AS �����,
    AVG(salary) AS ��տ���
FROM employees
GROUP BY job_id
ORDER BY ��տ��� DESC;

SELECT
    TO_CHAR(hire_date, 'yy') AS �Ի�⵵,
    COUNT(*) AS �����
FROM employees
GROUP BY TO_CHAR(hire_date, 'yy')
ORDER BY �Ի�⵵;

SELECT
    department_id,
    TRUNC(AVG(salary + salary*commission_pct)) AS avg_salary,
    SUM(salary + salary*commission_pct) AS total,
    COUNT(*) AS COUNT
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;
