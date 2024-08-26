/*
# 서브쿼리 
: SQL 문장 안에 또다른 SQL을 포함하는 방식.
 여러 개의 질의를 동시에 처리할 수 있습니다.
 WHERE, SELECT, FROM 절에 작성이 가능합니다.

- 서브쿼리의 사용방법은 () 안에 명시함.
 서브쿼리절의 리턴행이 1줄 이하여야 합니다.
- 서브쿼리 절에는 비교할 대상이 하나 반드시 들어가야 합니다.
- 해석할 때는 서브쿼리절 부터 먼저 해석하면 됩니다.
*/

-- 'Nancy' 보다 급여가 높은 사원 조회.

-- employee_id 가 103번인 사람의 job_id와 동일한 job_id를 가진 사람 조회
SELECT * FROM employees
WHERE job_id = (SELECT job_id FROM employees
                WHERE employee_id = 103);
                
-- 리턴 행이 여러개라면
-- 다중 행 연산자를 사용해야한다.
-- 다중행 연산자 (IN, ANY, ALL, EXIST)
SELECT * FROM employees
WHERE job_id = (SELECT job_id FROM employees
                WHERE last_name = 'King');

-- IN: 조회목록에 어떤 값과 같은지 비교
SELECT * FROM employees
WHERE job_id IN (SELECT job_id FROM employees
                WHERE last_name = 'King');
-- first_name 이 David인 사람의 급여와 같은 급여를 받는 사람들을 조회

SELECT * FROM employees
WHERE Salary IN (SELECT salary FROM employees
                WHERE first_name = 'David');
-- ANY , SOME : 값을 서브쿼리에 의해 리턴된 값과 비교해
-- 하나라도 만족하면 조회 대상에 포함됨

SELECT * FROM employees
WHERE salary > ANY (SELECT salary FROM employees
                    WHERE first_name = 'David');
                    
-- > ALL 모든 대상보다 클 경우                  
SELECT * FROM employees
WHERE salary > ANY (SELECT salary FROM employees
                    WHERE first_name = 'David');
                    
-- EXIST : 서브쿼리가 하나 이상의 행을 반환하면 참
-- SELECT 1 : 조회가 되는지 확인여부를 위한 1
-- jobhistory에 존재하는 직원이 employees에도 존재하면 조회 대상에 포함

SELECT * FROM employees e
WHERE EXISTS (SELECT 1 FROM job_history jh
             WHERE e.employee_id = jh.employee_id);


---------------------------------------

--SELECT 절에 서브쿼리 붙이기. (단일 행 원칙)
-- a.k.a 스칼라 서브쿼리
-- left 조인과 결과가 같다. ( 걍 left조인써라.)

SELECT
    e.first_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.first_name;


-- 각 부서별 사원수 뽑기
SELECT
    d.department_name,
    COUNT(*) AS 사원수
FROM departments d
LEFT OUTER JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY 사원수 DESC;

SELECT 
    d.department_name,
    (SELECT COUNT (*)
    FROM employees e
    WHERE e.department_id = d.department_id 
    GROUP BY department_id) AS 사원수
FROM departments d;

--인라인 뷰
-- 조회한 결과를 테이블로 사용해 한번 더 조회할거다.
-- 게시판 페이징 할때 씀.
SELECT *
FROM
    (
    SELECT
        ROWNUM AS rn, tbl.*
    FROM
        (
        SELECT
            employee_id, first_name, salary
        FROM employees
        ORDER BY salary DESC
        ) tbl
    )
WHERE rn > 10 AND rn <= 20;


SELECT
    tbl.avg_salary
FROM employees e JOIN
(SELECT
    department_id,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id) tbl
ON e.department_id = tbl.department_id;
l









