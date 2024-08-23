-- 06 ����ȯ �Լ�

-- TO_CHAR, TO_NUMBER, TO_DATE
SELECT TO_CHAR(sysdate) FROM dual;

-- ���� to ����
-- 9�� �ڸ����� ǥ���ϱ� ���� ��ȣ�̴�.
-- ���ľտ� L�� ���̸� �ش籹���� ��ȭ��ȣ�� �ٴ´�.
SELECT TO_CHAR(20000, 'L99,999') FROM dual;

SELECT
    first_name,
    TO_CHAR(salary, '$99,999') AS salary
FROM employees;


-- ���� to ���� TO_NUMBER(��, ����)
SELECT '2000' + 2000 FROM dual;
-- �ڵ����� ����ȯ�� �� (���� to ����)


-- ���ڹ��ڰ� ������������� ���Ĺ��ڷ� �˷������.
SELECT TO_NUMBER('$3,300', '$9,999') + 2000 FROM dual;

-- TO_dATE(��, ����)
SELECT TO_DATE('2023-04-13') FROM dual;

------------------------------------------------------

--NULL ���¸� ���ϴ� ������ 
--��ȯ�ϴ� �Լ� NVL(�÷� or ��, ��ȯ�� ��)

SELECT
    first_name,
    NVL(commission_pct,0)
FROM employees;

-- NVL2(tg, !null -> value, null -> value)
-- NULL�� ���� x
SELECT
    first_name,
    salary,
    salary + (salary * 
    NVL2(commission_pct,commission_pct,0))
    AS �޿�
FROM employees;

-- NULLIf(expr1, expr2)
-- �� ���� ������ NULL ���� / �ٸ��� expr1 ����
SELECT 
    NULLIF('�����', '��ٹ�')
FROM dual;

--COALESCE(expr1, ...) ( ... : ���� ǥ����)
-- ���� ǥ������ NULL�� �ƴ� ���� ���� �߰ߵǸ� �ش� �� ����
SELECT
    COALESCE(NULL,NULL,3000,2000,NULL)
FROM dual;


-- pct �� null �ξֵ��� 0 ����, �ƴ� �ֵ��� ������ pct ����
SELECT
    first_name,
    salary,
    salary + (salary * COALESCE(commission_pct, 0)) as total
FROM employees;

--DECODE(�÷� OR ǥ����, �׸�1, ���1, �׸�2, ���2,default)
--����Ŭ ���� �Լ�.
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
-- ANSI ǥ�� ���� (��� DB ��밡��)
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
























