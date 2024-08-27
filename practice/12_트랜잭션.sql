
-- 오토 커밋 활성화 여부 확인
SHOW AUTOCOMMIT;
-- 오토 커밋 온 : 조작어 명령할때마다 커밋됨. (롤백불가)
SET AUTOCOMMIT ON:
-- 오토 커밋 오프
SET AUTOCOMMIT OFF;

COMMIT;

SELECT * FROM emps
ORDER BY employee_id DESC;

DELETE FROM emps WHERE employee_id = 100;

insert into emps
    (employee_id, last_name, email, hire_date, job_id)
values
    (302, 'park', 'ppap@naver.com', sysdate, 'test' );
    
ROLLBACK; // 마지막 커밋시점으로 돌아감

// 임시 커밋
savepoint insert_kim;

ROLLBACK TO SAVEPOINT insert_kim;