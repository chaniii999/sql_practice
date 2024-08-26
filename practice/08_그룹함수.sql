
-- 그룹함수 AVG, MAX, MIN, SUM, COUNT
-- GROUR BY절 사용시 GROUP절에 해당하지않는 컬럼 조회 불가능.
SELECT
    AVG(salary),
    department_id
FROM employees
GROUP BY department_id;


-- 그룹조건 시 HAVING절에 작성
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
    AVG(salary) AS 평균급여
FROM employees
WHERE department_id > 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY 평균급여 DESC;




SELECT
    job_id,
    COUNT(*) AS 사원수,
    AVG(salary) AS 평균월급
FROM employees
GROUP BY job_id
ORDER BY 평균월급 DESC;

SELECT
    TO_CHAR(hire_date, 'yy') AS 입사년도,
    COUNT(*) AS 사원수
FROM employees
GROUP BY TO_CHAR(hire_date, 'yy')
ORDER BY 입사년도;

SELECT
    department_id,
    TRUNC(AVG(salary + salary*commission_pct)) AS avg_salary,
    SUM(salary + salary*commission_pct) AS total,
    COUNT(*) AS COUNT
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;
