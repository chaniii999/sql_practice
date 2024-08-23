
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