--집합 연산자
--서로 다른 쿼리 겨로가의 행들을 하나로 결합, 비교, 차이를 구할 수 있게해줌
-- UNION(중복x) UNION ALL( 중복 O). INTERSECT(교집합), MINUS(차집합)

-- A UNION B : 합집합, 자동정렬 (첫번째 기준)
-- A MINUS B : 차집합 , A - B (순서상관있음) 
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION
SELECT
    employee_id, first_name
From employees
WHERE department_id = 20;





