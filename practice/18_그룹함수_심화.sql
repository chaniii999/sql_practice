

-- roll up  그룹화 후 그룹별 합계 출력됨
-- cube() : 모든 가능한 조합을 고려해 집계
select
    department_id, job_id, sum(salary) as total_salary
from employees
group by rollup(department_id, job_id);


--grouping(): 결과에서 특정 열이 집계가 되었는지 여부를 확인해 값을 임의로 넣음
-- 합계 분류명에
select
    case grouping(department_id) when 1 then 9999 else department_id end as dept_id,
    case grouping(job_id) when 1 then 'total' else job_id end as job_id,
    sum(salary) as total_salary
from employees
where department_id is not null
group by cube (department_id, job_id);












