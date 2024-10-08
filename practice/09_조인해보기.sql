
/*
# 조인이란?
- 서로 다른 테이블 간에 설정된 관계가 결합하여
 1개 이상의 테이블에서 데이터를 조회하기 위해서 사용합니다.
- SELECT 컬럼리스트 FROM 조인대상이 되는 테이블 (1개 이상)
  WHERE 조인 조건 (오라클 조인 문법)
*/

-- employees 테이블의 부서 id와 일치하는 departments 테이블의 부서 id를 찾아
-- 부서이름을 출력하자

SELECT
    e.first_name,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;  -- 오라클 조인 문법

SELECT
    e.first_name,
    e.department_id,
    d.department_name
FROM employees e
inner join departments d
on e.department_id =  d.department_id; -- ANSI 표준 조인 문법

/* 컬럼의 소속 명확히.
각각의 테이블에 독립적으로 존재하는 컬럼의 경우에는
테이블 이름을 생략해도 무방합니다. 그러나, 해석의 명확성을 위해
테이블 이름을 작성하셔서 소속을 표현해 주는 것이 바람직합니다.
테이블 이름이 너무 길 시에는 ALIAS를 작성하여 칭합니다.
두 테이블 모두 가지고 있는 컬럼의 경우 반드시 명시해 주셔야 합니다.
*/


SELECT 
    e.first_name, e.department_id, e.job_id,
    d.department_name,
    j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;














