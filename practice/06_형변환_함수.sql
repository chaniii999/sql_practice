-- 06 형변환 함수

-- TO_CHAR, TO_NUMBER, TO_DATE
SELECT TO_CHAR(sysdate) FROM dual;

-- 숫자 to 문자
-- 9는 자릿수를 표현하기 위한 기호이다.
-- 형식앞에 L을 붙이면 해당국가의 통화기호가 붙는다.
SELECT TO_CHAR(20000, 'L99,999') FROM dual;

SELECT
    first_name,
    TO_CHAR(salary, '$99,999') AS salary
FROM employees;


-- 문자 to 숫자 TO_NUMBER(값, 형식)
SELECT '2000' + 2000 FROM dual;
-- 자동으로 형변환이 됨 (문자 to 숫자)


-- 숫자문자가 깔끔하지않으면 서식문자로 알려줘야함.
SELECT TO_NUMBER('$3,300', '$9,999') + 2000 FROM dual;

-- TO_dATE(값, 형식)
SELECT TO_DATE('2023-04-13') FROM dual;

------------------------------------------------------

--NULL 형태를 원하는 값으로 
--변환하는 함수 NVL(컬럼 or 값, 변환할 값)

SELECT
    first_name,
    NVL(commission_pct,0)
FROM employees;

-- NVL2(tg, !null -> value, null -> value)
-- NULL은 연산 x
SELECT
    first_name,
    salary,
    salary + (salary * 
    NVL2(commission_pct,commission_pct,0))
    AS 급여
FROM employees;

-- NULLIf(expr1, expr2)
-- 두 값이 같으면 NULL 리턴 / 다르면 expr1 리턴
SELECT 
    NULLIF('김춘식', '김바바')
FROM dual;

--COALESCE(expr1, ...) ( ... : 많은 표현식)
-- 많은 표현식중 NULL이 아닌 값이 최초 발견되면 해당 값 리턴
SELECT
    COALESCE(NULL,NULL,3000,2000,NULL)
FROM dual;


-- pct 가 null 인애들은 0 적용, 아닌 애들은 본인의 pct 적용
SELECT
    first_name,
    salary,
    salary + (salary * COALESCE(commission_pct, 0)) as total
FROM employees;

--DECODE(컬럼 OR 표현식, 항목1, 결과1, 항목2, 결과2,default)
--오라클 전용 함수.
SELECT
    first_name,
    job_id,
    salary,
    DECODE(
        job_id,
        'IT_PROG', salary * 1.1,
        'FI_MGR', salary * 1.2,
        'AD_VP', salary * 1.3,
        0
    ) AS result
FROM employees;

-- CASE WHEN THEN END
-- ANSI 표준 구문 (모든 DB 사용가능)
SELECT
    first_name,
    job_id,
    salary,
    (CASE job_id
        WHEN 'IT_PROG' THEN salary * 1.1
        WHEN 'FI_MGR' THEN salary * 1.2
        WHEN 'AD_VP' THEN salary * 1.3
        ELSE 0
    END) AS result
FROM employees;
























