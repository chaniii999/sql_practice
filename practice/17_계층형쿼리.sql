-- ������ ���� 
-- START WITH : ������ ù �ܰ踦 ��� ������ �������� ���� ����
-- CONNECT BY PRIOR �ڽ� = �θ�  -> ������ Ž��
-- CONNECT BY �ڽ� = PRIOR �θ�  -> ������ Ž��
-- ORDER SIBLINGS BY : ���� ���������� ������ ����.

select employee_id, first_name, manager_id from employees;

CONNECT by prior employee_id = manager_id // 

-- ������ ���̸� ��Ÿ��
LEVEL 