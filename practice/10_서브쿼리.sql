/*
# �������� 
: SQL ���� �ȿ� �Ǵٸ� SQL�� �����ϴ� ���.
 ���� ���� ���Ǹ� ���ÿ� ó���� �� �ֽ��ϴ�.
 WHERE, SELECT, FROM ���� �ۼ��� �����մϴ�.

- ���������� ������� () �ȿ� �����.
 ������������ �������� 1�� ���Ͽ��� �մϴ�.
- �������� ������ ���� ����� �ϳ� �ݵ�� ���� �մϴ�.
- �ؼ��� ���� ���������� ���� ���� �ؼ��ϸ� �˴ϴ�.
*/

-- 'Nancy' ���� �޿��� ���� ��� ��ȸ.

-- employee_id �� 103���� ����� job_id�� ������ job_id�� ���� ��� ��ȸ
SELECT * FROM employees
WHERE job_id = (SELECT job_id FROM employees
                WHERE employee_id = 103);
                
-- ���� ���� ���������
-- ���� �� �����ڸ� ����ؾ��Ѵ�.
-- ������ ������ (IN, ANY, ALL, EXIST)
SELECT * FROM employees
WHERE job_id = (SELECT job_id FROM employees
                WHERE last_name = 'King');

-- IN: ��ȸ��Ͽ� � ���� ������ ��
SELECT * FROM employees
WHERE job_id IN (SELECT job_id FROM employees
                WHERE last_name = 'King');
-- first_name �� David�� ����� �޿��� ���� �޿��� �޴� ������� ��ȸ

SELECT * FROM employees
WHERE Salary IN (SELECT salary FROM employees
                WHERE first_name = 'David');
-- ANY , SOME : ���� ���������� ���� ���ϵ� ���� ����
-- �ϳ��� �����ϸ� ��ȸ ��� ���Ե�

SELECT * FROM employees
WHERE salary > ANY (SELECT salary FROM employees
                    WHERE first_name = 'David');
                    
-- > ALL ��� ��󺸴� Ŭ ���                  
SELECT * FROM employees
WHERE salary > ANY (SELECT salary FROM employees
                    WHERE first_name = 'David');
                    
-- EXIST : ���������� �ϳ� �̻��� ���� ��ȯ�ϸ� ��
-- SELECT 1 : ��ȸ�� �Ǵ��� Ȯ�ο��θ� ���� 1
-- jobhistory�� �����ϴ� ������ employees���� �����ϸ� ��ȸ ��� ����

SELECT * FROM employees e
WHERE EXISTS (SELECT 1 FROM job_history jh
             WHERE e.employee_id = jh.employee_id);


---------------------------------------

--SELECT ���� �������� ���̱�. (���� �� ��Ģ)
-- a.k.a ��Į�� ��������
-- left ���ΰ� ����� ����. ( �� left���ν��.)

SELECT
    e.first_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.first_name;


-- �� �μ��� ����� �̱�
SELECT
    d.department_name,
    COUNT(*) AS �����
FROM departments d
LEFT OUTER JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY ����� DESC;

SELECT 
    d.department_name,
    (SELECT COUNT (*)
    FROM employees e
    WHERE e.department_id = d.department_id 
    GROUP BY department_id) AS �����
FROM departments d;

--�ζ��� ��
-- ��ȸ�� ����� ���̺�� ����� �ѹ� �� ��ȸ�ҰŴ�.
-- �Խ��� ����¡ �Ҷ� ��.
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









