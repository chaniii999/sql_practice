

-- roll up  �׷�ȭ �� �׷캰 �հ� ��µ�
-- cube() : ��� ������ ������ ����� ����
select
    department_id, job_id, sum(salary) as total_salary
from employees
group by rollup(department_id, job_id);


--grouping(): ������� Ư�� ���� ���谡 �Ǿ����� ���θ� Ȯ���� ���� ���Ƿ� ����
-- �հ� �з���
select
    case grouping(department_id) when 1 then 9999 else department_id end as dept_id,
    case grouping(job_id) when 1 then 'total' else job_id end as job_id,
    sum(salary) as total_salary
from employees
where department_id is not null
group by cube (department_id, job_id);












