
-- ���� Ŀ�� Ȱ��ȭ ���� Ȯ��
SHOW AUTOCOMMIT;
-- ���� Ŀ�� �� : ���۾� ����Ҷ����� Ŀ�Ե�. (�ѹ�Ұ�)
SET AUTOCOMMIT ON:
-- ���� Ŀ�� ����
SET AUTOCOMMIT OFF;

COMMIT;

SELECT * FROM emps
ORDER BY employee_id DESC;

DELETE FROM emps WHERE employee_id = 100;

insert into emps
    (employee_id, last_name, email, hire_date, job_id)
values
    (302, 'park', 'ppap@naver.com', sysdate, 'test' );
    
ROLLBACK; // ������ Ŀ�Խ������� ���ư�

// �ӽ� Ŀ��
savepoint insert_kim;

ROLLBACK TO SAVEPOINT insert_kim;