/*
- NUMBER(2) -> ������ 2�ڸ����� ������ �� �ִ� ������ Ÿ��.
- NUMBER(5, 2) -> ������, �Ǽ��θ� ��ģ �� �ڸ��� 5�ڸ�, �Ҽ��� 2�ڸ�
- NUMBER -> ��ȣ�� ������ �� (38, 0)���� �ڵ� �����˴ϴ�.
- VARCHAR2(byte) -> ��ȣ �ȿ� ���� ���ڿ��� �ִ� ���̸� ����. (4000byte����)
- CLOB -> ��뷮 �ؽ�Ʈ ������ Ÿ�� (�ִ� 4Gbyte)
- BLOB -> ������ ��뷮 ��ü (�̹���, ���� ���� �� ���)
- DATE -> BC 4712�� 1�� 1�� ~ AD 9999�� 12�� 31�ϱ��� ���� ����
- ��, ��, �� ���� ����.
*/


CREATE TABLE dept2 (
    dept_no NUMBER(2),
    dept_name varchar2(14),
    loca varchar2(15),
    dept_Date date,
    dept_bonus number(10)
);

desc dept2;

INSERT INTO dept2
values(10,'������','����',sysdate, 2000000);

INSERT INTO dept2
values(30,'����','���',sysdate, 2000000.86);

-- �÷�(�Ӽ�)�߰�
ALTER TABLE dept2
ADD dept_count NUMBER(3);

-- �÷��� ���� rename
alter table dept2
rename column dept_count to emp_count;

-- �÷� �Ӽ� ���� modify
alter table dept2
modify column emp_count VARCHAR2(10); 

select * from dept2;

-- DDL(create, alter ,truncate, drop)
-- �� Ʈ������� ����� �ƴϴ�.
-- : �ѹ� ���Ұ�

-- DML(insert, update, delete)
-- ���� DDL ����� �ڵ� Ŀ�Ե�


-- ���̺� �̸� ����
alter table dept2
rename to dept3;

-- ������ ����� �����͸� ���� ����
TRUNCATE tavle dept3;

-- ���̺� ����
drop table dept3;






