--���� ������
--���� �ٸ� ���� �ܷΰ��� ����� �ϳ��� ����, ��, ���̸� ���� �� �ְ�����
-- UNION(�ߺ�x) UNION ALL( �ߺ� O). INTERSECT(������), MINUS(������)

-- A UNION B : ������, �ڵ����� (ù��° ����)
-- A MINUS B : ������ , A - B (�����������) 
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION
SELECT
    employee_id, first_name
From employees
WHERE department_id = 20;





