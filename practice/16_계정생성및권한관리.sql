
-- ����� ���� Ȯ��
select * from all_users;

-- �����������
create user user1 identified by user1;
-- ���� �����ֱ�
grant create session to user1;

-- �����ڿ� ���ϴ� ������ �ο��ϴ� ����.
RESOURCE, CONNECT, DBA TO [���� �̸�]


-- �������� �ٸ� ������ ���̺� ��ȸ���� ����
GRANT SELECT ON HR.DEPARTMENTS TO user1;

-- ROLE : ���ѵ��� ����
create role my_team_role;
grant select, update on hr.employees to my_team_role;

grant my_team_role to user1;