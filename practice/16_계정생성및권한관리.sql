
-- 사용자 계정 확인
select * from all_users;

-- 계정생성명령
create user user1 identified by user1;
-- 계정 권한주기
grant create session to user1;

-- 관리자에 준하는 권한을 부여하는 구문.
RESOURCE, CONNECT, DBA TO [유저 이름]


-- 유저에게 다른 계정의 테이블 조회권한 위임
GRANT SELECT ON HR.DEPARTMENTS TO user1;

-- ROLE : 권한들의 모음
create role my_team_role;
grant select, update on hr.employees to my_team_role;

grant my_team_role to user1;