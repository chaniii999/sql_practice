-- ���̺� ������ ��������
-- : ���̺� �������� �����Ͱ� �ԷµǴ� ���� �����ϱ� ���� ��Ģ�� �����ϴ� ��.

-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�. (�ֿ� Ű)
-- UNIQUE: ������ ���� ���� �ϴ� �÷� (�ߺ��� ����)
-- NOT NULL: null�� ������� ����. (�ʼ���)
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷�
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���.


-- �÷� ���� ���� ���� (�÷� ���𸶴� �������� ����)
-- constraint �������ǽĺ����� �̸�
-- �������� �ĺ��ڴ� �������� (�˾Ƽ�����)
create table dept2 (
    dept_no number(2)CONSTRAINT dept2_deptno_pk PRIMAERY KEY,
    dept_name varchar2(14) not null constraint dept2_deptname_uk unique,
    loca NUMVER(4) constraint dept2_loca_locid_fk references locations(location_id),
    dept_bonus number(10) constraint dept2_bonus_ck check(dept_bonus > 10000),
    dept_gender varchar2(1) constraint dept2_gender_ck check(dept_gender in ('m','f'))
};

drop table dept2;

-- ���̺� ���� ���� ���� : ��� �� ���� �Ŀ� ���� ���� �Ŵ� ���
create table dept2 (
    dept_no number(2),
    dept_name varchar2(14) not null,
    loca number(4),
    dept_bonus number(10),
    dept_gender varchar2(1),
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no), 
    CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
};
-- �ܷ�Ű (foreign key) �� �θ����̺�(�������̺�)�� ���ٸ� insert �Ұ���

insert into dept2
values (10, 'gg', 6542,90000, 'm'); -- 6542�� ������ ����.'

-- ���������� �߰�, ������ ����







