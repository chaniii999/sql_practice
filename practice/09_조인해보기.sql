
/*
# �����̶�?
- ���� �ٸ� ���̺� ���� ������ ���谡 �����Ͽ�
 1�� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���ؼ� ����մϴ�.
- SELECT �÷�����Ʈ FROM ���δ���� �Ǵ� ���̺� (1�� �̻�)
  WHERE ���� ���� (����Ŭ ���� ����)
*/

-- employees ���̺��� �μ� id�� ��ġ�ϴ� departments ���̺��� �μ� id�� ã��
-- �μ��̸��� �������

SELECT
    e.first_name,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;  -- ����Ŭ ���� ����

SELECT
    e.first_name,
    e.department_id,
    d.department_name
FROM employees e
inner join departments d
on e.department_id =  d.department_id; -- ANSI ǥ�� ���� ����

/* �÷��� �Ҽ� ��Ȯ��.
������ ���̺� ���������� �����ϴ� �÷��� ��쿡��
���̺� �̸��� �����ص� �����մϴ�. �׷���, �ؼ��� ��Ȯ���� ����
���̺� �̸��� �ۼ��ϼż� �Ҽ��� ǥ���� �ִ� ���� �ٶ����մϴ�.
���̺� �̸��� �ʹ� �� �ÿ��� ALIAS�� �ۼ��Ͽ� Ī�մϴ�.
�� ���̺� ��� ������ �ִ� �÷��� ��� �ݵ�� ����� �ּž� �մϴ�.
*/


SELECT 
    e.first_name, e.department_id, e.job_id,
    d.department_name,
    j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;














